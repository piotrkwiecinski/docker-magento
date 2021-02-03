[[ ! $(type -t magento_docker_base_path)"" == 'function' ]] && echo "Run only with common.bash"

setup_file() {
  cd "$(magento_docker_base_path)" || exit 1
  if [ ! -f src/composer.json ]; then
    bin/download 2.4.1

    if [ ! -f src/auth.json ]; then
      cp auth.json src
    fi

    bin/setup "magento2.test"
  fi
  bin/start
}

teardown_file() {
  cd "$(magento_docker_base_path)" && bin/stop
}
