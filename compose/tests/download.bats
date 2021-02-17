#!/usr/bin/env bats

load test_helpers/common.bash

setup_file() {
  cd "$(magento_docker_base_path)"
  rm -rf src
}

@test 'download: download' {
   run "$(magento_docker_base_path)"/bin/download 2.4.2
   echo "$output"
   [ "$status" -eq 0 ]
}
