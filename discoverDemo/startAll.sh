#!/bin/sh

echo "Test Use:\n\tcurl 'http://localhost:8080/Andy'\nCrtl+C to exit\n"

export DISCOVER_APP=s1
export SERVICE_ACCESSTOKENS_aabbcc=1
go run service.go &
go run service.go &

export DISCOVER_APP=c1
export DISCOVER_WEIGHT=1
export DISCOVER_CALLS_s1=':aabbcc'
export SERVICE_ACCESSTOKENS_aabbcc=1
go run controller.go &
go run controller.go &

unset DISCOVER_APP
unset SERVICE_ACCESSTOKENS
export DISCOVER_CALLS_c1=':aabbcc'
export SERVICE_LISTEN=:8080
export SERVICE_HTTPVERSION=1
go run gateway.go
