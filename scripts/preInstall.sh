#set env vars
set -o allexport; source .env; set +o allexport;

ADMIN_PASSWORD=${ADMIN_PASSWORD:-`openssl rand -hex 32`}

cat << EOT >> ./.env

ADMIN_PASSWORD=${ADMIN_PASSWORD}
EOT

cat << EOT >> ./production.yaml
service:
  api_key: "${ADMIN_PASSWORD}"
EOT