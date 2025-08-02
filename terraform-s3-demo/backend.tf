terraform { 
  cloud { 
    
    organization = "TechStackConf" 

    workspaces { 
      name = "s3-demo" 
    } 
  } 
}