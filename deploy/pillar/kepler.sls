app_name: kepler
user: ubuntu

repository: git@github.com:gabrielfalcao/kepler.git
revision: master

base_path: "/srv"

app_path: "/srv/app"
static_path: "/srv/app/kepler/static"

etc_path: "/srv/etc"

venv_path: "/srv/venv"

prefix_path: "/srv/usr"
bin_path: "/srv/usr/bin"
lib_path: "/srv/usr/lib"

log_path: "/var/log"

github_users:
  gabrielfalcao: gabrielfalcao
  bueller: benjie
  axelav: axel

environment:
  PORT: "4200"
  LOGLEVEL: "DEBUG"
  HOST: "kepler.propellr.com"
  DOMAIN: "kepler.propellr.com"
  REDIS_URI: "redis://localhost:6379"
  PATH: "/srv/venv/bin:$PATH"
  PYTHONPATH: "/srv/app:/srv/venv/lib/python2.7/site-packages:$PYTHONPATH"
  SQLALCHEMY_DATABASE_URI: "mysql://root@localhost/kepler"