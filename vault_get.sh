#!/usr/bin/env bash

function vault_get() {
  vault_get_token
  SECRETS_DIR=$1
  ENV_FILE=$2
  MSG="Get from vault"
  vault kv get $SECRETS_DIR | sed 's/\ \{1,\}/=/g' | sed 1,11d > $ENV_FILE
  echo "$MSG"
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
    export -f vault_get
  else
    vault_get "${@}"
    exit $?
fi

