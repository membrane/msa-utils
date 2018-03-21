# will dowload consul if necessary

if [[ ! -f consul ]]; then
	if [[ $OSTYPE == "darwin"* ]]; then
		wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_darwin_amd64.zip
	fi
	if [[ $OSTYPE == "linux-gnu" ]]; then
		wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip
	fi  
fi

unzip consul*.zip

./consul agent -data-dir=/tmp/consul -bind 127.0.0.1 -ui -dev
