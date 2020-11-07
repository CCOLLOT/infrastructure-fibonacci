FROM hashicorp/terraform
ARG AWS_KEY_ID_FIB
ARG AWS_SECRET_KEY_FIB
WORKDIR /app/terraformconfig
COPY . .
