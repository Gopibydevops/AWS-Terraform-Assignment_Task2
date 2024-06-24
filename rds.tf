resource "aws_db_instance" "my_rds_instance" {
  identifier              = "demo-rds-terraform-db"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "gvaiccqte7yibxwyst2i2db" # Use a more secure password
  db_name                 = "testdb"
  parameter_group_name    = "default.mysql8.0"

  multi_az                = true   # Enable Multi-AZ deployment
  backup_retention_period = 1
  backup_window           = "03:00-06:00"
  maintenance_window      = "Mon:00:00-Mon:03:00"

# Enable encryption at rest
  storage_encrypted       = true

  # Enable SSL/TLS for in-transit encryption
  apply_immediately = true
  skip_final_snapshot = true

  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  tags = {
    Name = "demo-rds-terraform-db"
  }
}
