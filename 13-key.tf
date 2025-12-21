# https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/public_key
# https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key

data "tls_public_key" "MySecureKey" {
  private_key_pem = tls_private_key.MySecureKey.private_key_pem
}

resource "tls_private_key" "MySecureKey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}