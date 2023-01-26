variable "YC_FOLDER_ID" {
  type = string
  default = env("b1g7ske3eoqq2v0bqnub")
}

variable "YC_ZONE" {
  type = string
  default = env("ru-central1-a")
}

variable "YC_SUBNET_ID" {
  type = string
  default = env("e9b5jvrjarodi9pbc20c")
}

variable "TF_VER" {
  type = string
  default = "1.1.9"
}

variable "KCTL_VER" {
  type = string
  default = "1.23.0"
}


source "yandex" "ubuntu" {
  folder_id           = "${var.YC_FOLDER_ID}"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "Yandex Cloud Ubuntu Toolbox image"
  image_family        = "my-images"
  image_name          = "ubuntu"
  subnet_id           = "${var.YC_SUBNET_ID}"
  disk_type           = "network-hdd"
  zone                = "${var.YC_ZONE}"
}