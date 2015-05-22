# Rename-ScheduledTask.ps1
# Written by Bill Stewart (bstewart@iname.com)

#requires -version 2

<#
.SYNOPSIS
Renames a scheduled task on a computer by copying an existing task to a new task, then deleting the original task.

.DESCRIPTION
Renames a scheduled task on a computer by copying an existing task to a new task, then deleting the original task. Requires schedule service version 1.2 or later (i.e., at least Windows Vista or Server 2008). If you rename a scheduled task that has saved credentials, you must recreate the task's credentials (if you omit the -TaskCredential parameter, you will be prompted for credentials).

.PARAMETER TaskName
The scheduled task you want to rename. If you don't specify a folder name, the root folder ("\") is the default. If the task has saved credentials, you will be prompted for the task's credentials if you don't specify -TaskCredential.

.PARAMETER NewName
The new name for the task. You can specify a new folder name for the task. If you don't specify a different folder name, the default is to save the new task in the same folder as the original task. If the task has saved credentials, you will be prompted for the task's credentials if you don't specify -TaskCredential. If the folder name does not exist, it will be created.

.PARAMETER ComputerName
The computer on which the task exists. The current computer is the default.

.PARAMETER ConnectionCredential
The connection to the task scheduler service will be made using these credentials. If you don't specify this parameter, the currently logged on user's credentials are assumed.

.PARAMETER TaskCredential
If the scheduled task you are renaming has saved credentials, use these credentials when creating the new task. If the scheduled task has saved credentials and you don't specify this parameter, you will be prompted for new credentials.

.EXAMPLE
PS C:\> Rename-ScheduledTask "Scheduled Task 0" "Scheduled Task 1"
This command renames \Scheduled Task 0 to \Scheduled Task 1.

.EXAMPLE
PS C:\> Rename-ScheduledTask \TaskFolder1\Task0 Task1
This command renames \TaskFolder1\Task0 to \TaskFolder1\Task1.

.EXAMPLE
PS C:\> Rename-ScheduledTask \TaskFolder0\MyTask1 \TaskFolder1\MyTask1
This command renames \TaskFolder0\MyTask1 to \TaskFolder1\MyTask1.

.EXAMPLE
PS C:\> Rename-ScheduledTask MessageTask0 TestMessage -ComputerName server1
This command renames MessageTask0 to TestMessage on server1.

.EXAMPLE
PS C:\> Rename-ScheduledTask Test0 Test1 -ComputerName server1 -ConnectionCredential (Get-Credential)
This command renames \Task0 to \Test1 on server1. The connection to server1 is established using prompted credentials.

.EXAMPLE
PS C:\> Rename-ScheduledTask FileCopy1 FileCopy2 -ComputerName server2
If the task File1Copy1 on server2 has saved credentials, this command will prompt for credentials when renaming FileCopy1 to FileCopy2.

.EXAMPLE
PS C:\> Rename-ScheduledTask FileCopy1 FileCopy2 -ComputerName server2 -TaskCredential $Cred
If the task File1Copy1 on server2 has saved credentials, this command will use the credentials in the $Cred variable when renaming FileCopy1 to FileCopy2.
#>

param(
  [parameter(Position=0,Mandatory=$TRUE)] [String] $TaskName,
  [parameter(Position=1,Mandatory=$TRUE)] [String] $NewName,
  [String] $ComputerName=$ENV:ComputerName,
  [System.Management.Automation.PSCredential] $ConnectionCredential,
  [System.Management.Automation.PSCredential] $TaskCredential
)

$MIN_SCHEDULER_VERSION = "1.2"
$TASK_ILLEGAL_CHARS = @('/',':','*','?','"','<','>','|')
$TASK_CREATE = 2
$TASK_LOGON_PASSWORD = 1

# SUPPORTING FUNCTIONS ########################################################

# Returns the specified PSCredential object's password as a plain-text string
function get-plaintextpwd($credential) {
  $credential.GetNetworkCredential().Password
}

# Returns a version number as a string (x.y); e.g. 65537 (10001 hex) returns "1.1"
function convertto-versionstr([Int] $version) {
  $major = [Math]::Truncate($version / [Math]::Pow(2, 16)) -band 65535
  $minor = $version -band 65535
  "$($major).$($minor)"
}

# Returns a string "x.y" as a version number; e.g., "1.3" returns 65539 (10003 hex)
function convertto-versionint([String] $version) {
  $parts = $version.Split(".")
  $major = [Int] $parts[0] * [Math]::Pow(2, 16)
  $major -bor [Int] $parts[1]
}

# Returns whether the specified task name is valid (does not contain illegal characters)
function test-validtaskname($name) {
  foreach ($char in $name.ToCharArray()) {
    if ($TASK_ILLEGAL_CHARS -contains $char) { return $FALSE }
  }
  $TRUE
}

# Returns a list of all tasks starting at the specified task folder
function get-taskname($taskFolder) {
  $tasks = $taskFolder.GetTasks(0)
  $tasks | foreach-object { $_.Path }
  $taskFolders = $taskFolder.GetFolders(0)
  $taskFolders | foreach-object { get-taskname $_ }
}

# MAIN BODY OF SCRIPT #########################################################

# Throw an error if the new task name is not valid
if (-not (test-validtaskname $NewName)) {
  throw "Task name cannot contain any of the following characters: $TASK_ILLEGAL_CHARS"
}

# Assume root tasks folder if not specified
if (-not $TaskName.Contains("\")) { $TaskName = "\$TaskName" }
# If new name specified without folder name, assume same folder as original name
if (-not $NewName.Contains("\")) {
  $NewName = join-path (split-path $TaskName -parent) $NewName
}

# Throw an error if the original and new names are the same
if ($TaskName -eq $NewName) {
  throw "-TaskName and -NewName parameters cannot specify the same name."
}

# Try to create the TaskService object; throw an error on failure
try {
  $taskService = new-object -comobject "Schedule.Service"
}
catch [System.Management.Automation.PSArgumentException] {
  throw $_
}

# Assume $NULL for the schedule service connection parameters unless -ConnectionCredential used
$userName = $domainName = $connectPwd = $NULL
if ($ConnectionCredential) {
  # Get user name, domain name, and plain-text copy of password from PSCredential object
  $userName = $ConnectionCredential.UserName.Split("\")[1]
  $domainName = $ConnectionCredential.UserName.Split("\")[0]
  $connectPwd = get-plaintextpwd $ConnectionCredential
}

# Try to connect to the schedule service on the computer; throw an error on failure
try {
  $taskService.Connect($ComputerName, $userName, $domainName, $connectPwd)
}
catch [System.Management.Automation.MethodInvocationException] {
  throw $_
}

# Scheduler service must meet minimum version criteria
$minVersion = convertto-versionint $MIN_SCHEDULER_VERSION
if ($taskService.HighestVersion -lt $minVersion) {
  throw ("Schedule service on $ComputerName is version $($taskService.HighestVersion) " +
    "($(convertto-versionstr($taskService.HighestVersion))) - service must be version " +
    "$MIN_SCHEDULER_VERSION ($(convertto-versionint $MIN_SCHEDULER_VERSION)) or higher.")
}

# Get a reference to the root schedule folder
$rootFolder = $taskService.GetFolder("\")

# Retrieve a list of all registered tasks' names
$taskNames = get-taskname $rootFolder

# Throw an error if we can't find the task
if (-not ($taskNames -contains $TaskName)) {
  throw "Scheduled task not found on $ComputerName - $TaskName"
}

# Throw an error if the new task name already exists
if ($taskNames -contains $NewName) {
  throw "Scheduled task already exists on $ComputerName - $NewName"
}

# Get the TaskDefinition object for the original task
$taskDef = $rootFolder.GetTask($TaskName).Definition

# The task doesn't need a password unless its LogonType is TASK_LOGON_PASSWORD
$taskPwd = $NULL
if ($taskDef.Principal.LogonType -eq $TASK_LOGON_PASSWORD) {
  # If -TaskCredential not specified, prompt for credentials; exit script if cancel
  if (-not $TaskCredential) {
    $TaskCredential = $HOST.UI.PromptForCredential("Task Credentials", "Please specify credentials for the scheduled task.", "$ENV:USERDOMAIN\$ENV:USERNAME", "")
    if (-not $TaskCredential) {
      throw "You must specify credentials."
    }
  }
  # Retrieve plain-text copy of password from PSCredential object
  $taskPwd = get-plaintextpwd $TaskCredential
}

# Create new task and delete the original task; throw an error on failure
try {
  # Create a new task as a copy of the original one (void cast prevents output)
  [Void] $rootFolder.RegisterTaskDefinition($NewName, $taskDef, $TASK_CREATE,
    $taskDef.Principal.UserId, $taskPwd, $taskDef.Principal.LogonType)
  # Get the reference to the original task's folder and delete the original task
  $taskFolder = $taskService.GetFolder((split-path $TaskName -parent))
  $taskFolder.DeleteTask((split-path $TaskName -leaf), $NULL)
}
catch [System.Management.Automation.MethodInvocationException] {
  throw $_
}
