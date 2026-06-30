output "load_balancer_dns" {

  value = aws_lb.web.dns_name

}

output "load_balancer_url" {

  value = "http://${aws_lb.web.dns_name}"

}