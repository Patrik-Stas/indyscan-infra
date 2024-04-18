resource "aws_security_group" "Indyscan_Services" {

  name = "Indyscan_Services"
  description = "Terraform Managed, Indyscan services"

  ingress {
    from_port = 3707
    to_port = 3707
    protocol = "TCP"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "Indyscan UI"
  }

  ingress {
    from_port = 3708
    to_port = 3708
    protocol = "TCP"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "Indyscan API"
  }
// Enable if you want
//  ingress {
//    from_port = 9200
//    to_port = 9200
//    protocol = "TCP"
//    cidr_blocks = [
//      "0.0.0.0/0"
//    ]
//    description = "Indyscan Elasticsearch"
//  }
//
//  ingress {
//    from_port = 5601
//    to_port = 5601
//    protocol = "TCP"
//    cidr_blocks = [
//      "0.0.0.0/0"
//    ]
//    description = "Indyscan Kibana"
//  }
}

resource "aws_security_group" "Indyscan_General" {
  name = "Indyscan_General"
  description = "Terraform Managed, Indyscan general"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

