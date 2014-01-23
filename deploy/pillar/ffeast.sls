app_name: ffeast
user: ubuntu

repository: git@github.com:propellr/ffeast.git
revision: master

base_path: "/srv"

app_path: "/srv/app"
static_path: "/srv/app/ffeast/static"

etc_path: "/srv/etc"

venv_path: "/srv/venv"

prefix_path: "/srv/usr"
bin_path: "/srv/usr/bin"
lib_path: "/srv/usr/lib"

log_path: "/var/log"

github_users:
  gabrielfalcao: gabrielfalcao
  alscardoso: andre
  clarete: lincoln

environment:
  PORT: "5050"
  LOGLEVEL: "DEBUG"
  HOST: "ffeast.propellr.com"
  DOMAIN: "ffeast.propellr.com"
  REDIS_URI: "redis://localhost:6379"
  PATH: "/srv/venv/bin:$PATH"
  PYTHONPATH: "/srv/app:/src/venv/lib/python2.7/site-packages:$PYTHONPATH"
  SQLALCHEMY_DATABASE_URI: "mysql://root@localhost/ffeast"