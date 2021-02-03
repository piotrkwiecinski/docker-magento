#!/usr/bin/env bats

load test_helpers/common.bash

setup_file() {
  cd "$(magento_docker_base_path)"
}

@test 'status: show status' {
  run "$(magento_docker_base_path)"/bin/status
  echo "$output"
  regex="^Name(.*)Command(.*)State"
  [[ ${lines[0]} =~ $regex ]]
}
