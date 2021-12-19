/*

Simple types:
    string
    number
    bool

Complex types:
    list(<TYPE>)
    set(<TYPE>)
    map(<TYPE>)
    object({<ATTR NAME> = <TYPE>, ... })
    tuple([<TYPE>, ...])

*/

# string
variable region {
  type        = string
  default     = "eu-ctntal-1"
  description = "Default AWS region."
}

# number
variable amount_of_instances {
  type        = number
  default     = 1
  description = "Amount of instances which must be created"
}

# bool
variable source_dest_check {
  type        = bool
  default     = true
  description = "Enable sorce dest IP checking"
}

# list
variable inbound_ports {
  type        = list
  default     = [22, 3389]
  description = "Opened ports"
}

# map
variable tags {
  type        = map
  default     = {
      "Name" = "EC2 instance",
      "Project" = "Variables"
      } 
  description = "Tegs for EC2 Instances"
}

