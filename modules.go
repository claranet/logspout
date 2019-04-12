package main

import (
	_ "github.com/claranet/logspout/adapters/gelf"
	_ "github.com/claranet/logspout/adapters/multiline"
	_ "github.com/claranet/logspout/adapters/raw"
	_ "github.com/claranet/logspout/adapters/syslog"
	_ "github.com/claranet/logspout/healthcheck"
	_ "github.com/claranet/logspout/httpstream"
	_ "github.com/claranet/logspout/routesapi"
	_ "github.com/claranet/logspout/transports/tcp"
	_ "github.com/claranet/logspout/transports/tls"
	_ "github.com/claranet/logspout/transports/udp"
)
