packer {
  required_plugins {
    utm = {
      source  = "github.com/naveenrajm7/utm"
      version = "~> 0.0.2"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
  }
}

variable "iso_url" {
  type    = string
  default = "file:///Users/arx/virt/isos/kali-linux-2025.3-installer-arm64.iso"
}

variable "iso_checksum" {
  # You need to find the actual SHA256 checksum for your specific ISO file.
  # Use shasum -a 256 <filename> in your terminal to get this value.
  type    = string
  default = "sha256:a3f220224810d1111661040d64ddb62d0e68d2b7ed97bfd5fb3e5dd5768d02d9"
}

source "utm" "kali" {
  # UTM Specific Settings
  name           = "kali-linux-builder"
  iso_url        = var.iso_url
  iso_checksum   = var.iso_checksum
  http_directory = "http" # Directory to serve preseed file from

  # VM Hardware Settings for M1/ARM64
  architecture = "aarch64"
  memory       = 8192
  cores        = 8 
  disk_size    = "64G"

  # The command sequence to automate the installer prompts via serial console.
  # This requires a 'preseed.cfg' file served locally during the boot process.
  boot_command = [
    "<enter><wait>",
    "install auto=true priority=critical url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <enter>"
  ]

  # Communicator allows Packer to SSH into the VM after installation is complete
  communicator = "ssh"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
}

build {
  sources = ["source.utm.kali"]

  # Provisioners are used to install software or configure the OS after installation
  provisioner "shell" {
    script = "./scripts/install_vagrant.sh"
  }

  # Post-processor packages the VM into a Vagrant box file
  post-processor "vagrant" {
    output = "kali-arm64-{{.Version}}.box"
  }
}

