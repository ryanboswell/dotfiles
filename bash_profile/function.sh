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

# Reset any uncommitted changes and pull latest origin (branch positional argument optional)
function resetproject() {
  local BRANCH=${1-}

  if [ ! -d ".git" ]; then
    echo "Warning: This is not a git repository"
    return 1
  fi

  # Reset working copy to a clean state to prevent conflicts
  git clean -fdx
  git reset --hard

  # If a branch was specified, fetch remotes and check it out
  if [[ ! -z "${BRANCH}" ]]; then
    git fetch --all -p
    git checkout ${BRANCH}
  fi

  git pull origin ${BRANCH}
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
