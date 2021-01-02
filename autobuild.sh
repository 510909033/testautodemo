#!/bin/sh

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o asdfgh main.go
git add -u && git commit -m 'demo1' && git push origin main
