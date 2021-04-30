module "instance" {
  source             = "../../modules/instance"
  
  for_each = {
      for item in local.config : item.instance_name => item
  }

  zone               = each.value.zone

  instance_name      = each.key
  instance_type      = each.value.instance_type

  snapshot_name      = null

  boot_disk_size     = each.value.boot_disk_size
  boot_disk_image    = each.value.boot_disk_image

  extended_disk_size = each.value.extended_disk_size 
  extended_disk_type = each.value.extended_disk_type 

  firewall           = null

  ssh_user           = local.ssh_user
  ssh_public_key     = local.ssh_public_key
}

module "ansible_inventory" {
  source             = "../../../core_modules/ansible_inventory/"
  instances          = local.instances
  module             = module.instance
  prefix             = local.prefix
  project            = local.project
  ssh_user           = local.ssh_user
  roles              = local.roles
  baskets            = local.baskets
  regions            = local.regions
  disks              = local.disks
}
