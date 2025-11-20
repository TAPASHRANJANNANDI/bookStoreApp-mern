# Amazon linux os 
#!/bin/bash
sudo yum update -y 
sudo yum install git -y
# Eksctl installation
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
# kubectl installation
sudo yum install kubectl -y
curl -LO "https://cdn.dl.k8s.io/release/$(curl -L -s https://cdn.dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://cdn.dl.k8s.io/release/$(curl -L -s https://cdn.dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
chmod +x kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
# Cluster Creation
eksctl create cluster --name book-app --region ap-south-1 --node-type t3.medium --nodes-min 2 --nodes-max 2
aws eks update-kubeconfig --region ap-south-1 --name book-app
kubectl get nodes
