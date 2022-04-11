output "wave1" {
  value = {
    for instance, details in module.wave1 :
    instance => ({ hostname = details.hostname, instance_id = details.instance_id, private_ip = details.private_ip })
  }
}

output "wave2" {
  value = {
    for instance, details in module.wave2 :
    instance => ({ hostname = details.hostname, instance_id = details.instance_id, private_ip = details.private_ip })
  }
}

output "wave3" {
  value = {
    for instance, details in module.wave3 :
    instance => ({ hostname = details.hostname, instance_id = details.instance_id, private_ip = details.private_ip })
  }
}
