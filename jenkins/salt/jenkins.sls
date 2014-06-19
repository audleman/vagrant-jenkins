jenkins:
  cmd.run:
    - name: wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    - unless: apt-key list | grep 'Kohsuke Kawaguchi'
    - require:
      - file: /etc/apt/sources.list.d/jenkins.list

  pkg:
    - installed
  
  file.directory:
    - name: /var/lib/jenkins/.ssh
    - makedirs: True
    - user: jenkins
    - group: nogroup
    - recurse:
      - user
      - group
    - require:
      - pkg: jenkins

/etc/apt/sources.list.d/jenkins.list:
  file.managed:
    - source: salt://apt_sources/jenkins.list

# Add git keys so that jenkins config files can be pulled from git
jenkins_git_key:
  file.managed:
    - name: /var/lib/jenkins/.ssh/id_rsa
    - source: salt://git_keys/id_rsa
    - user: jenkins
    - group: nogroup
    - mode: 600
    - require:
      - pkg: jenkins

# Add ssh known keys file so that git wont die
jenkins_known_hosts:
  file.managed:
    - name: /var/lib/jenkins/.ssh/known_hosts
    - source: salt://git_keys/known_hosts
    - user: jenkins
    - group: nogroup
    - mode: 644
    - require:
      - pkg: jenkins

# TODO
# Install config.xml to get user accounts

# Install plugins
# Cobertura
# Git & its dependencies
# Install jobs
    # Just copy a blank workspace folder that is configured with:
        # Initial reop checkout
        # sudo git remote add staging git@heroku.com:malta-staging.git

# Nginx front-end so we can access on port 80?
