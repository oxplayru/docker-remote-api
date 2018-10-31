Makes the Docker Remote API available via port 2375.
# No Security
Start with:
`docker run -p 2375:2375 -v /var/run/docker.sock:/var/run/docker.sock jarkt/docker-remote-api`
# Secure with TLS
You should make and mount directory with folling files:
* ca-cert.pem 
* server-cert.pem 
* server-key.pem

Read [Enable Docker Remote API with TLS client verification](https://gist.github.com/kekru/974e40bb1cd4b947a53cca5ba4b0bbe5) for more information.

Start with:
`docker run -d --name Docker-Remote-Api -e TLS=true -p 2375:2375 -v {{YOUR_CERT_FOLDER}}:/certs/ -v /var/run/docker.sock:/var/run/docker.sock innerfire/docker-remote-api`
