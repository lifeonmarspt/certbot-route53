# sudo docker build -t cb .
# sudo docker run -v $HOME/.aws:/root/.aws -ti cb
FROM ubuntu:zesty

RUN apt update
RUN apt install -y libssl-dev libffi-dev python2.7-dev python-virtualenv build-essential

WORKDIR /root/
RUN virtualenv venv -p python2.7 && venv/bin/pip install -U pip setuptools

COPY . /root/
RUN venv/bin/pip install -e .

VOLUME /root/.aws

CMD venv/bin/certbot certonly -n --agree-tos --test-cert --email pkoch@lifeonmars.pt -a certbot-route53:auth -d pkoch.lifeonmars.pt --work-dir scratch --config-dir scratch --logs-dir scratch
