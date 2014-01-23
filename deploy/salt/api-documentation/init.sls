/etc/nginx/sites-enabled/propellr:
  file:
    - managed
    - template: jinja
    - source: salt://api-documentation/nginx.conf
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/fallback:
  file:
    - managed
    - template: jinja
    - source: salt://api-documentation/www-fallback.conf
    - require:
      - pkg: nginx


copy-fallback-files:
  module.run:
    - name: cp.get_dir
    - path: salt://api-documentation/www-fallback
    - dest: {{ pillar['api-documentation']['www_fallback'] }}


propellr_deploy_key:
  file.managed:
    - name: /root/.ssh/github
    - source: salt://api-documentation/id_rsa
    - makedirs: True
    - mode: 600

propellr_public_key:
  file.managed:
    - name: /root/.ssh/github.pub
    - source: salt://api-documentation/id_rsa.pub
    - makedirs: True
    - mode: 600


nginx-httpasswd:
  file.managed:
    - name: /srv/http-auth
    - source: salt://api-documentation/http-auth
    - makedirs: True
    - mode: 600

propellr.com:
  git.latest:
    - name: {{ pillar['api-documentation']['repository'] }}
    - rev: {{ pillar['api-documentation']['revision'] }}
    - target: {{ pillar['api-documentation']['www_root'] }}
    - force: true
    - require:
      - pkg: app-pkgs
      - file: propellr_deploy_key
      - file: propellr_public_key


markment:
  pip.installed

markment.build:
  cmd.run:
    - name: markment -t .theme spec
    - cwd: {{ pillar['api-documentation']['www_root'] }}
    - env:
      - PYTHONPATH: {{ pillar['venv_path'] }}/lib/python2.7/site-customize:$PYTHONPATH


propellr-reload-nginx:
  cmd.run:
    - name: service nginx force-reload
