/*
 Environment variables for debuging terraform:
 
 TF_LOG = <LOG_LEVEL>  
 TF_LOG_CORE = <LOG_LEVEL> 
 TF_LOG_PROVIDER = <LOG_LEVEL> 

log levels TRACE, DEBUG, INFO, WARN or ERROR

 TF_LOG_PATH = <file_path>

*/

# Functions

variable map {
  type        = map 
  default     = {"https" = "443", "http" = "80", "ssh"="22"}
  description = "Common ports"
}

variable string {
  type        = string
  default     = "ssh-http"
  description = "String of ports"
}

/*
# split(separator, string)
split("-", var.string)
tolist([
  "ssh",
  "http",
])

# element(list, index)
element(split("-", var.string),0)
"ssh"

# lookup(map, key, default)
lookup(var.map,element(split("-", var.string),0))
"22"

lookup(var.map,"rdp",0)
"0"

# contains(list, value)
contains(split("-", var.string),"ssh")
true


# Merge - returns a single map or object that contains a merged set of elements from all arguments.
merge({a="b", c="d"}, {e="f", c="z"})
{
  "a" = "b"
  "c" = "z"   #! Important
  "e" = "f"
}

# concat - takes two or more lists and combines them into a single list.
concat(split("-", var.name), ["ssh","rdp"])
[
  "ssh",
  "http",
  "ssh",
  "rdp",
]


# toset() - converts its argument to a set value.
toset(concat(split("-", var.string), ["ssh","rdp"]))
toset([
  "http",
  "rdp",
  "ssh",
])


file
formatdate
timestamp
*/