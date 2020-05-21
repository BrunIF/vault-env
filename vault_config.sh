#!/usr/bin/env bash

export VAULT_CONFIG_FILE=~/.vault-configuration

function vault_config() {
  VAULT_ADDR=$1
  VAULT_NAME=$2
  VAULT_PASSWORD=$3
  MSG="Add vault_env to profile"
  echo 'export VAULT_ADDR='$VAULT_ADDR > $VAULT_CONFIG_FILE
  echo 'export VAULT_NAME='$VAULT_NAME >> $VAULT_CONFIG_FILE
  echo 'export VAULT_PASSWORD='$VAULT_PASSWORD >> $VAULT_CONFIG_FILE
  source $VAULT_CONFIG_FILE
  echo "$MSG"
}

function vault_get_token()  {
  source $VAULT_CONFIG_FILE
  MSG="Get token from vault server"
  VAULT_TOKEN=$(vault login -method=userpass username=${VAULT_NAME} password=${VAULT_PASSWORD} \
                | sed 1,6d | tr -s ' ' | cut -f 2 -d ' ' | sed -n 1p)
  echo "$MSG" 
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
    export -f vault_config
  else
    vault_config "${@}"
    exit $?
fi

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
    export -f vault_get_token
  else
    vault_get_token "${@}"
    exit $?
fi


