/etc/nginx/sites-enabled/propellr:
  file:
    - managed
    - template: jinja
    - source: salt://propellr/nginx.conf
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/fallback:
  file:
    - managed
    - template: jinja
    - source: salt://propellr/www-fallback.conf
    - require:
      - pkg: nginx


copy-fallback-files:
  module.run:
    - name: cp.get_dir
    - path: salt://propellr/www-fallback
    - dest: {{ pillar['propellr']['www_fallback'] }}


propellr_deploy_key:
  file.managed:
    - name: /root/.ssh/github
    - source: salt://propellr/id_rsa
    - makedirs: True
    - mode: 600

propellr_public_key:
  file.managed:
    - name: /root/.ssh/github.pub
    - source: salt://propellr/id_rsa.pub
    - makedirs: True
    - mode: 600

propellr.com:
  git.latest:
    - name: {{ pillar['propellr']['repository'] }}
    - rev: {{ pillar['propellr']['revision'] }}
    - target: {{ pillar['propellr']['www_root'] }}
    - force: true
    - require:
      - pkg: app-pkgs
      - file: propellr_deploy_key
      - file: propellr_public_key

propellr-reload-nginx:
  cmd.run:
    - name: service nginx force-reload
