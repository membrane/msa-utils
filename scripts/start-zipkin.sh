if [ ! -f zipkin-server*.jar ]; then
  curl 'http://search.maven.org/remotecontent?filepath=io/zipkin/java/zipkin-server/2.5.3/zipkin-server-2.5.3-exec.jar' > zipkin-server.jar || { echo 'Unable to dl Zipkin server'; exit 1; }
fi

java -jar zipkin-server.jar
