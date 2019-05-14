#!/bin/bash
sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install wget nc bind-utils unzip python36 python36-devel openssl-devel gcc git
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python3.6 get-pip.py
pip install --upgrade pip
pip install --user virtualenv
mkdir ~/venv
virtualenv ~/venv
source ~/venv/bin/activate
echo "source venv/bin/activate" >> ~/.bash_profile
pip install boto
pip install boto3
pip install awscli
pip install -I ansible
pip install credstash
curl https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip --output terraform_0.11.13_linux_amd64.zip
sudo unzip terraform_0.11.13_linux_amd64.zip -d /usr/bin
curl https://releases.hashicorp.com/packer/1.3.5/packer_1.4.0_linux_amd64.zip --output packer_1.4.0_linux_amd64.zip
sudo unzip packer_1.4.0_linux_amd64.zip -d /usr/bin
sudo cp -p terraform-provider-credstash /usr/bin
cat << EOF > ~/.terraformrc
providers {
     credstash = "/usr/bin/terraform-provider-credstash"
}
EOF
mkdir ~/repos
cd ~/repos
git clone https://github.com/uriagassi/sash.git
cd sash
make install
echo "source ~/.local/bin/sash.sh" >> ~/.bashrc
source ~/.bashrc
