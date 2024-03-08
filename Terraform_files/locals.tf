locals {
  ingress_ports = [

    {
        port=80
        protocol="tcp"
    },
    {
        port=443
        protocol="tcp"
    },
    {
        port=8080
        protocol="tcp"
    },
    {
        port=8081
        protocol="tcp"
    },
    {
        port=9000
        protocol="tcp"
    },
    {
        port=22
        protocol="tcp"
    }


  ]
}