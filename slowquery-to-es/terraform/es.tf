data "aws_network_interfaces" "es_domain_slowquery" {
  filter {
    name   = "description"
    values = ["ES slowquery"]
  }
}

data "aws_network_interface" "es_domain_slowquery" {
  for_each = toset(data.aws_network_interfaces.es_domain_slowquery.ids)
  id       = each.value
}


output "es_slowquery" {
  value = {
    for i in data.aws_network_interfaces.es_domain_slowquery.ids :
    i => {
      private_ips = data.aws_network_interface.es_domain_slowquery[i].private_ip,
    }
  }
}

resource "aws_elasticsearch_domain" "slowquery" {
  domain_name           = "slowquery"
  elasticsearch_version = "7.7"

  cluster_config {
    instance_type = "t2.small.elasticsearch"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 35
  }

  vpc_options {
    subnet_ids = [
      "subnet-0257d0837139a4d77",
    ]

    security_group_ids = ["sg-0e75f3c6ccbb8c468"]
  }
}

output "ELASTICSEARCH_URL" {
  value = "https://${aws_elasticsearch_domain.slowquery.endpoint}:443"
}
