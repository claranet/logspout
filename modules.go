package main

import (
	_ "adapters/gelf"
	_ "adapters/multiline"
	_ "adapters/raw"
	_ "adapters/syslog"
	_ "healthcheck"
	_ "httpstream"
	_ "routesapi"
	_ "transports/tcp"
	_ "transports/tls"
	_ "transports/udp"
)
