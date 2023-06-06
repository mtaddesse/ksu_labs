module "ubuntu_instances" {
  source = "./lab"

  public_key    = ""
  region        = "us-east-2"
  instance_type = "t2.micro"
  ami           = "" 
}