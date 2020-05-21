#!/usr/bin/env bash

function vault_put() {
  vault_get_token
  SECRETS_DIR=$1
  ENV_FILE=$2
  MSG="Put to vault"
  vault kv put $SECRETS_DIR $(egrep -v '^#' $ENV_FILE | xargs) 
  echo "$MSG"
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
    export -f vault_put
  else
    vault_put "${@}"
    exit $?
fi

