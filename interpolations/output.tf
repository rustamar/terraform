#================== FIRST LINE OF FILE ==============================
variable "empty" {
  default = ""
}

variable "string" {
  default = "string"
}

variable "underscore" {
  default = "_"
}

variable "float" {
  default = 3.14
}

variable "cidr" {
  default = "10.0.0.8/8"
}

variable "list" {
  default = ["first", "second", "third", "fourth", "fifth"]
}

variable "list_numbers" {
  default = [ 1, 2, 3, 4, 5]
}

variable "list_with_empty" {
  default = [ "first", "", "", "fourth", "", "sixth"]
}

variable "map" {
  default {
    "first" = "1"
    "second" = "2"
    "third" = "3"
    "fourth" = "4"
  }
}

#--------------------------------------------------------------------

output "base64encode" {
  value = "${base64encode(var.string)}"
}

output "base64decode" {
  value = "${base64decode(base64encode(var.string))}"
}

output "base64sha256" {
  value = "${base64sha256(var.string)}"
}

output "ceil" {
  value = "${ceil(var.float)}"
}

output "cidrhost" {
  value = "${cidrhost(var.cidr, 2)}"
}

output "cidrnetmask" {
  value = "${cidrnetmask(var.cidr)}"
}

output "cidrsubnet" {
  value = "${cidrsubnet(var.cidr, 8 , 2)}"
}

output "coalesce" {
  value = "${coalesce(var.empty, var.underscore, var.string)}"
}

output "compact" {
  value = "${compact(var.list_with_empty)}"
}

output "concat" {
  value = "${concat(var.list, var.list_with_empty)}"
}

output "disctinct" {
  value = "${distinct(concat(var.list, var.list_with_empty))}"
}

output "element" {
  value = "${element(var.list, 0)}"
}

output "file" {
  value = "${file("./interpolation.tf")}"
}

output "floor" {
  value = "${floor(var.float)}"
}

output "format" {
  value = "${format("web-%02d", 4)}"
}

output "formatlist" {
  value = "${formatlist("%s %s", var.list, "element")}"
}

output "formatlist_multiple" {
  value = "${formatlist("%s %s", var.list, var.list_numbers)}"
}

output "index" {
  value = "${index(var.list, "third")}"
}

output "join" {
  value = "${join(":", var.list_numbers)}"
}

output "jsonenconde" {
  value = "${jsonencode(var.list)}"
}

output "keys" {
  value = "${keys(var.map)}"
}

output "length" {
  value = "${length(var.list)}"
}

output "list" {
  value = "${list("one", "two", "three")}"
}

output "lookup" {
  value = "${lookup(var.map, "second")}"
}

output "lookup_default" {
  value = "${lookup(var.map, "ninth", "0")}"
}

output "lower" {
  value = "${lower("HELLO")}"
}

output "map" {
  value = "${map("key", "value", "one", "...")}"
}

output "max" {
  value = "${max(3.14, 4.13)}"
}

# ???
#output = "merge" {
#  value = "${merge(map("a", "b"), map("c", "d"))}"
#}

output "md5" {
  value  = "${md5(var.string)}"
}

output "pathexpand" {
  value = "${pathexpand("~/file")}"
}

output "replace" {
  value = "${replace(replace(var.string, "st", "ST"), "g", "G")}"
}

output "replace_expression" {
  value = "ST${replace(var.string, "/^.*(ri).*$/", "$1")}NG"
}

output "sha1" {
  value = "${sha1(var.string)}"
}

output "sha256" {
  value = "${sha256(var.string)}"
}

output "signum" {
  value = "${signum(3)}"
}

output "slice" {
  value = "${slice(var.list, 0, length(var.list) - 1)}"
}

output "sort" {
  value = "${sort(var.list)}"
}

output "split" {
  value = "${split(" ", "1 2 3 4")}"
}

output "timestamp" {
  value = "${timestamp()}"
}

output "title" {
  value = "${title("string should be titleized")}"
}

output "trimspace" {
  value = "${trimspace("    string ")}"
}

output "upper" {
  value = "${upper(var.string)}"
}

output "uuid" {
  value = "${uuid()}"
}

output "values" {
  value = "${values(var.map)}"
}

output "zipmap" {
  value = "${zipmap(list("key1", "key2", "key3"), list("value1", "value2", "value3"))}"
}
#================= LAST LINE OF FILE ================================
