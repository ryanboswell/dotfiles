# Clear out Composer cache and re-install
function resetcomposer() {
  rm -r vendor;
  rm composer.lock;
  composer install;
}


# Clear out all local docker containers and caches
dockerclean() {
  dockerstopall
  dockerrmc
  dockerrmi
}

dockerstopall() {
  echo "Stopping all containers ..."
  docker stop $(docker ps -a -q)
}

dockerrmc() {
  echo "Removing all containers ..."
  docker rm $(docker ps -a -q)
}

dockerrmi() {
  echo "Removing all images ..."
  docker rmi -f $(docker images -a -q)
}
