# will dowload consul if necessary

if [[ ! -f consul ]]; then
  wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip && unzip consul*.zip
fi

./consul agent -data-dir=/tmp/consul -bind 127.0.0.1 -ui -dev
