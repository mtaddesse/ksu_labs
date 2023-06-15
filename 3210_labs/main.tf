module "ubuntu_instances" {
  source = "./lab"

  // Put SSH Key between the quotes
  public_key    = ""
  
  region        = "us-east-2"
  instance_type = "t2.micro"
  ami           = "ami-024e6efaf93d85776" 
}