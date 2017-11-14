# Clear out Composer cache and re-install
function resetcomposer() {
  rm -r vendor;
  rm composer.lock;
  composer install;
}

# Open PHP Unit code coverage report
function coverage() {
  open coverage/index.html
}

# Reset any uncommitted changes and pull latest origin
function resetproject() {
  git clean -fdx
  git reset --hard
  git pull origin
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

# Remove host from known_hosts file
forget_host() {
  local HOST=${1-}
  if [[ ! -z "${HOST}" ]]; then
    sed -i "/${HOST}/d" ~/.ssh/known_hosts
    echo "Removed ${HOST} from known_hosts file"
  else
    echo "Usage: forget_host HOSTNAME"
  fi
}
