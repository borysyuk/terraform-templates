resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

resource "random_pet" "cat" {
}

resource "random_pet" "dog" {
}

resource "random_pet" "cheetah" {
}

resource "random_pet" "horse" {
}

resource "random_pet" "zebra" {
}
