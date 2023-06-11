module "ubuntu_instances" {
  source = "./lab"

  public_key    = "<<PUT YOUR SSH KEY HERE>>"
  region        = "us-east-2"
  instance_type = "t2.micro"
  ami           = "ami-024e6efaf93d85776" 
}