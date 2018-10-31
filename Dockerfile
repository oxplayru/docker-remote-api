FROM alpine

RUN apk update && apk add socat
  
EXPOSE 2375
  
CMD if [ "$TLS" = "true" ] ; then socat OPENSSL-LISTEN:2375,reuseaddr,fork,cert=/certs/server-cert.pem,cafile=/certs/ca-cert.pem,key=/certs/server-key.pem UNIX-CLIENT:/var/run/docker.sock; else socat TCP-LISTEN:2375,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock; fi 
