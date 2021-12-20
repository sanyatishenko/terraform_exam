/*

Simple (Primitive) types:
    string                                  A sequence of Unicode characters representing some text, such as "hello".
    number                                  The number type can represent both whole numbers like 15 and fractional values such as 6.28.
    bool                                    Either true or false. bool values can be used in conditional logic.

Collection types (All elements of a collection must always be of the same type): 
    list(<TYPE>)                            A sequence of values of the same type.
    set(<TYPE>)                             An unordered collection of unique values, all of the same type.
    map(<TYPE>)                             A lookup table, matching keys to values, all of the same type.

Structural types:
    object({<ATTR NAME> = <TYPE>, ... })    A lookup table, matching a fixed set of keys to values of specified types.
    tuple([<TYPE>, ...])                    A sequence of elements identified by consecutive whole numbers starting with zero, where each element has its own type.

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

# set
variable sg_ids {
  type        = set
  default     = []
  description = "Set of security groups"
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

# object
variable ami {
  type        = object({
      ami_name = string,
      virtualization_type = string,
      owners = string
  })
  default     = {
      ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      virtualization_type = "hvm"
      owners = "099720109477"
  }
  description = "Object with ami parameters"
}

# tuple
variable add_parameters {
  type        = tuple[bool,bool]
  # hibirnate, monitoring
  default     = [false, false]
  description = "Additional parameters"
}
