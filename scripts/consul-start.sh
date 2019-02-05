# will dowload consul if necessary

if [[ ! -f consul ]]; then
	if [[ $OSTYPE == "darwin"* ]]; then
		wget https://releases.hashicorp.com/consul/1.4.2/consul_1.4.2_darwin_amd64.zip
	fi
	if [[ $OSTYPE == "linux-gnu" ]]; then
		wget https://releases.hashicorp.com/consul/1.4.2/consul_1.4.2_linux_amd64.zip
	fi  
fi

unzip consul*.zip

./consul agent -data-dir=/tmp/consul -bind 127.0.0.1 -ui -dev
