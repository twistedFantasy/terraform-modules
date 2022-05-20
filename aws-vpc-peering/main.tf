data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_vpc" "peer_vpc" {
  id = var.peer_vpc_id
}

data "aws_route_tables" "route_tables" {
  vpc_id = var.vpc_id

  filter {
    name   = var.filter.name
    values = var.filter.values
  }
}

resource "aws_vpc_peering_connection" "vpc_peering_connection" {

  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
  auto_accept = true

  tags = local.common_tags
}

resource "aws_route" "route_for_database_subnets" {
  for_each = toset(data.aws_route_tables.route_tables.ids)

  route_table_id            = each.key
  destination_cidr_block    = data.aws_vpc.peer_vpc.cidr_block_associations[0].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
}
