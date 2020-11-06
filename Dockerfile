FROM hashicorp/terraform
ARG AWS_KEY_ID_FIB
ARG AWS_SECRET_KEY_FIB
WORKDIR /app/terraformconfig
COPY . .
ENV AWS_ACCESS_KEY_ID=$AWS_KEY_ID_FIB
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY_FIB
RUN printenv
RUN terraform init
RUN terraform validate
RUN terraform plan