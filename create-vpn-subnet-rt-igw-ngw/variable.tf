variable "public_subnets" {
    default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
    description = "public_subnets"
}

variable "private_subnets" {
    default = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
    description = "private_subnets"
}

variable "db_subnets" {
    default = ["10.10.7.0/24", "10.10.8.0/24", "10.10.9.0/24"]
    description = "db_subnets"
}
