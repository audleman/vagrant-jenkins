heroku:
  cmd.run:
    - name: wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    - unless: heroku version
