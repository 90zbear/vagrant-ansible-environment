cd ansible
sudo apt-get install -y python-dev python-pip git
sudo aptitude install -y libmysqlclient-dev
sudo pip install ansible
sudo pip install mySQL-python
ansible-playbook playbook.yml -i hosts -c paramiko
