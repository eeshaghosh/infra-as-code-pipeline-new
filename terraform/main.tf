module "networking" {

  source = "./modules/networking"

  vpc_cidr = "10.0.0.0/16"

}

module "security" {

  source = "./modules/security"

  vpc_id = module.networking.vpc_id

}

module "ecs" {

  source = "./modules/ecs"

  vpc_id = module.networking.vpc_id

  public_subnet_ids = module.networking.public_subnet_ids

  private_subnet_ids = module.networking.private_subnet_ids

  ecs_security_group_id = module.security.ecs_security_group_id

  container_port = 5000

  image = "358103606042.dkr.ecr.ap-south-1.amazonaws.com/infra-as-code-pipeline:v1"

}