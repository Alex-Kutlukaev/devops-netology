terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "y0_AgAAAAARrkq8AATuwQAAAADalvwSK1AuHxLGTPm459rQ5gZjDd0JYX4" # OAuth-токен яндекса
  cloud_id  = "b1gtob9reohhtoq182pj"
  folder_id = "b1g7ske3eoqq2v0bqnub"
  zone      = "ru-central1-a"
}


data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

data "yandex_vpc_subnet" "default_a" {
  name = "default-ru-central1-a"  # одна из дефолтных подсетей
}

# ресурс "yandex_compute_instance" т.е. сервер
# Terraform будет знать его по имени "yandex_compute_instance.default"
resource "yandex_compute_instance" "node" {
  name         = "test-ubuntu"
  platform_id  = "standard-v1" # тип процессора (Intel Broadwell)

  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores         = 2 # vCPU
    memory        = 1 # RAM
  }

  boot_disk {
    initialize_params {
      image_id = "fd8c5uabtiabvlcvdr97"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e9b5jvrjarodi9pbc20c"
    nat = true # автоматически установить динамический ip
  }
}