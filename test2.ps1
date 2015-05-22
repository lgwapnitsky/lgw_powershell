for ($i = 1; $i -le 10; $i++) 
{ 
  write-progress -id 1 -activity "Doing some stuff" -status "whatever" -percentComplete ($i*10); 
   sleep 1;  
   for ($j = 1; $j -le 10; $j++) 
   { 
      write-progress -id 2 -parentId 1 -activity "Doing some child stuff" -status "yay" -percentComplete ($j*10) 
      sleep 0.75
      
      for ($k = 1; $k -le 10; $k++)
      {
		write-progress -d 3 -parentid 2 -activity "larry test" -status "$($k)" -percentComplete ($k*10)
		sleep 0.75
	  }
   }
}