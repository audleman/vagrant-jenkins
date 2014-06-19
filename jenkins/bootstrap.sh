#!/bin/sh

# Install saltstack
# sudo apt-get install python-software-properties -y
# sudo add-apt-repository ppa:saltstack/salt -y
# sudo apt-get update -y
# sudo apt-get install salt-minion -y
# sudo apt-get install salt-master -y
# sudo apt-get upgrade -y

# Set salt master location and start minion
# sudo sed -i 's/#master: salt/master: 127.0.0.1/' /etc/salt/minion
# sudo salt-minion -d
# echo 'y' | sudo salt-key -a '*'
# sudo salt '*' state.highstate

# Got this from the salt docs on running a masterless minion
# https://salt.readthedocs.org/en/latest/topics/tutorials/quickstart.html
wget -O - https://bootstrap.saltstack.com | sudo sh

# TODO
#   1. Use sed to change file_client: remote to local in /etc/salt/minion
#   2. Restart sudo service salt-minion restart (?)

#   3. salt folder needs to be at /srv/salt
#       cd /srv; ln -s /home/vagrant/jenkins/salt salt
#        or just use Vagrantfile)
#        install git above, checkout code from repo to /srv/salt -- I think this
#        would require SSH keys to be installed, which salt is better for.
#        The git repo would benefit from having the Vagrantfile included (set up
#        port-forwarding 8080, set up shared folder, define OS). That would make 
#        the repo a 1-stop shop for a Jenkins Virtualbox 

#   4. sudo salt-call --local state.highstate
