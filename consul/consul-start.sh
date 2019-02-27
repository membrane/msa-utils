# will dowload consul if necessary

VERSION=1.4.2

echo "Downloading consul version $VERSION"

if [[ ! -f consul ]]; then
	if [[ $OSTYPE == "darwin"* ]]; then
		wget "https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_darwin_amd64.zip"
	fi
	if [[ $OSTYPE == "linux-gnu" ]]; then
		wget https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_linux_amd64.zip
	fi  
fi

unzip consul*.zip

./consul agent -data-dir=/tmp/consul -bind 127.0.0.1 -ui -dev
