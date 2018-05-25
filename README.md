# docker host 

Requirements:
AWS-cli with configured AWS Access Key ID and AWS Secret Access Key -- use https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html 
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

How to :

Create aws key-pair

###### aws ec2 create-key-pair --key-name terraformwp --query 'KeyMaterial' --output text > ~/.ssh/terraformwp.pem

###### chmod 400 ~/.ssh/terraformwp.pem

###### mkdir somedir

###### cd somedir

###### git clone https://github.com/SergeyMuha/docker_host_aws_terrfarom.git

###### cd docker_host_aws_terrfarom

###### terraform init

Deploy infrastructure. This command will output dns name for monithost 

###### terraform apply -input=false -auto-approve

ex.
Outputs:

Docker-host = ec2-34-200-236-193.compute-1.amazonaws.com

###### ssh to Docker-host 

###### ssh -i ~/.ssh/terraformwp.pem ubuntu@ec2-34-200-236-193.compute-1.amazonaws.com

###### git clone https://github.com/SergeyMuha/docker_haproxy_apache_mysql_wp.git

###### cd docker_haproxy_apache_mysql_wp

###### docker-compose build

###### docker-compose up --scale apache2=2

Open Docker-host:8080

To destroy infrastructure use 

###### terraform destroy -input=false -auto-approve

