FROM williamyeh/ansible:ubuntu16.04

RUN apt-get update && apt-get install -y git curl unzip

ENV TERRAFORM_VERSION=0.9.4

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

WORKDIR /root/terraform

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY ./docker_files/init.sh /root/

CMD ["sh", "/root/init.sh"]