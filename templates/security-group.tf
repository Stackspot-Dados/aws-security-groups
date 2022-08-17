resource "aws_security_group" "{{inputs.security_group_name}}"" {
  name        = "{{inputs.security_group_name}}"
  description = "{{inputs.description_security_group}}"
  vpc_id      = ${var.glue_vpc_id}

  ingress {
    description      = "{{inputs.description_ingress}}"
    from_port        = {{inputs.from_port_ingress}}
    to_port          = {{inputs.to_port_ingress}}
    protocol         = "{{inputs.protocol_ingress}}"
    {% if inputs.self_ingress == true %}
    self             = true
    {% endif %}
    {% if inputs.cidr_blocks_ingress == true %}
    cidr_blocks      = ["{{inputs.cidr_ingress}}"]
    {% endif %}
    {% if inputs.ipv6_cidr_blocks_ingress == true %}
    ipv6_cidr_blocks = ["{{inputs.cidr_ipv6_ingress}}"]
    {% endif %}
  }

  egress {
    description      = "{{inputs.description_egress}}"
    from_port        = {{inputs.from_port_egress}}
    to_port          = {{inputs.to_port_egress}}
    protocol         = "{{inputs.protocol_egress}}"
    {% if inputs.self_egress == true %}
    self             = "{{inputs.self_egress}}"
    {% endif %}
    {% if inputs.cidr_blocks_egress == true %}
    cidr_blocks      = ["{{inputs.cidr_egress}}"]
    {% endif %}
    {% if inputs.ipv6_cidr_blocks_egress == true %}
    ipv6_cidr_blocks = ["{{inputs.ipv6_cidr_blocks_egress}}"]
    {% endif %}
  }

  tags = {
    {% if inputs.name_tags == true %}
    Name = "{{inputs.mapa_tags}}"
    {% endif %}
  }
}