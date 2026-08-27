#!/bin/bash
VAULT_ADDR='http://127.0.0.1:8200'
VAULT_TOKEN=$(grep 'Initial Root Token:' /home/aau/Desktop/Skills_Utilization/vault/vault_keys.txt | awk '{print $NF}')
SECRET_PATH='secret/myapp'
ENV_FILE='/home/aau/Desktop/Skills_Utilization/.env'

export VAULT_ADDR
export VAULT_TOKEN

echo "Retrieving secrets from Vault..."
# Swapped to docker exec since Vault is in a separate compose file
SECRETS=$(docker exec -i vault-server env VAULT_ADDR="http://127.0.0.1:8200" VAULT_TOKEN=$VAULT_TOKEN vault kv get -format=json $SECRET_PATH)

if [ $? -ne 0 ]; then
  echo "Failed to retrieve secrets from Vault."
  exit 1
fi

echo "Saving secrets to $ENV_FILE..."
echo "$SECRETS" | jq -r '.data.data | to_entries[] | .key + "=" + .value' > $ENV_FILE

echo "Running App stack..."
docker compose up -d backend frontend
