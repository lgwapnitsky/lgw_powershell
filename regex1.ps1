$errMsg = "somevalue"

([regex](".*(?<P1>eva).*")).matches($errMsg)[0].groups["P1"].value

([regex]("(e)")).matches($errMsg)