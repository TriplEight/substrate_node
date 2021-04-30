locals {
  raw_settings = yamldecode(file("config.yml"))

  config = flatten([
     for instance, params in local.raw_settings.instances : [
       for machine, p in params.machines : {
         type                = instance
         instance_name       = machine
         instance_type       = try(p.instance_type, params.instance_type)
         boot_disk_image     = try(p.boot_disk_image, params.boot_disk_image)
         boot_disk_size      = try(p.boot_disk_size, params.boot_disk_size)
         extended_disk_type  = try(p.extended_disk_type, try(params.extended_disk_type, null))
         extended_disk_size  = try(p.extended_disk_size, try(params.extended_disk_size, 0))
         extended_disk_name  = try(p.extended_disk_name, try(params.extended_disk_name, "none"))
         role                = try(p.role, try(params.role, "none"))
         basket              = try(p.basket, try(params.basket, "none"))
         region              = try(p.region, try(params.region, "none"))
         zone                = try(p.zone, try(params.zone, null))
       }
     ]
  ])

  instances          = { for k in local.config: k.type => k.instance_name... }
  roles              = { for k in local.config: k.instance_name => k.role }
  baskets            = { for k in local.config: k.instance_name => k.basket }
  regions            = { for k in local.config: k.instance_name => k.region }
  disks              = { for k in local.config: k.instance_name => k.extended_disk_name }

  ssh_user           = local.raw_settings.ssh_user
  ssh_public_key     = local.raw_settings.ssh_public_key
  project            = local.raw_settings.project
  prefix             = local.raw_settings.prefix
}
