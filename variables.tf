variable "aws_region" {
  default = "eu-north-1"
}

variable "elasticsearch_domain" {
  default = "geniusee-es"
}

variable "cluster_name" {
  default = "geniusee-k8s"
}

variable "elasticsearch_username" {
  description = "AWS Elasticsearch domain master username"
  sensitive = true
  default = "geniusee-user"
}

variable "elasticsearch_password" {
  description = "AWS Elasticsearch domain master password"
  sensitive = true
  default = "geniuseePassword1$"
}