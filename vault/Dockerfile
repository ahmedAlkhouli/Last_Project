FROM hashicorp/vault:latest

# Keep the exact same Dev Mode config you already have
ENV VAULT_DEV_ROOT_TOKEN_ID=my-secret-root-token
ENV VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200

EXPOSE 8200

# Start Vault in Dev mode
CMD ["server", "-dev"]
