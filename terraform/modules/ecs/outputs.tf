output "cluster_id" {

 value = aws_ecs_cluster.main.id

}


output "service_name" {

 value = aws_ecs_service.app.name

}


output "alb_dns" {

 value = aws_lb.app.dns_name

}