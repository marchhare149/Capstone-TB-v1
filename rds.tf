resource "aws_db_instance" "wordpress" {
  identifier        = "wordpress-db"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 10

  db_name  = "wordpress"
  username = "wpuser"
  password = "wpPassword123!"

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group_v1.name
  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  publicly_accessible = false
  skip_final_snapshot = true
  deletion_protection = false
}
