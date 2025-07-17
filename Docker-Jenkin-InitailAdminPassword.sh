#!/bin/bash

set -e

echo "🔄 Updating system packages..."
sudo yum update -y

echo "🐳 Installing Docker..."
sudo yum install -y docker

echo "🚀 Starting and enabling Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "👤 Adding ec2-user to docker group..."
sudo usermod -aG docker ec2-user

echo "📦 Pulling Jenkins LTS image..."
sudo docker pull jenkins/jenkins:lts

echo "📂 Running Jenkins container..."
sudo docker run -dit \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --restart=always \
  jenkins/jenkins:lts

echo "⏳ Waiting 30 seconds for Jenkins to initialize..."
sleep 30

echo "🔑 Fetching Jenkins initial admin password..."
sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

