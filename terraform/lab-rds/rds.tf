provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "akilaRDS" {
    allocated_storage = 5
    db_name = "akiladb"
    engine = "mysql"
    engine_version = "  5.7"
    instance_class = "db.t3.micro"
    identifier = "akila"
    username = "akila"
    password = "akilavasan"
    parameter_group_name = "default.mysql5.7"
    publicly_accessible = true
    skip_final_snapshot = true
}   
