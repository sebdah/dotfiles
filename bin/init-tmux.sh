#!/usr/bin/env bash

tmux new -d -s "common" -n system -c ~ bpytop
tmux new -d -s "saltside/admin" -c ~/go/src/github.com/saltside/admin
tmux new -d -s "saltside/admin-service" -c ~/go/src/github.com/saltside/admin-service
tmux new -d -s "saltside/apex" -c ~/go/src/github.com/saltside/apex
tmux new -d -s "saltside/apex-config" -c ~/go/src/github.com/saltside/apex-config
tmux new -d -s "saltside/api-gateway-v2" -c ~/go/src/github.com/saltside/api-gateway-v2
tmux new -d -s "saltside/chat-service" -c ~/go/src/github.com/saltside/chat-service
tmux new -d -s "saltside/core-service" -c ~/go/src/github.com/saltside/core-service
tmux new -d -s "saltside/email-service" -c ~/go/src/github.com/saltside/email-service
tmux new -d -s "saltside/external-admin-service" -c ~/go/src/github.com/saltside/external-admin-service
tmux new -d -s "saltside/external-data-contracts" -c ~/go/src/github.com/saltside/external-data-contracts
tmux new -d -s "saltside/image-service" -c ~/go/src/github.com/saltside/image-service
tmux new -d -s "saltside/infrastructure" -c ~/go/src/github.com/saltside/infrastructure
tmux new -d -s "saltside/inventory-service" -c ~/go/src/github.com/saltside/inventory-service
tmux new -d -s "saltside/lib" -c ~/go/src/github.com/saltside/lib
tmux new -d -s "saltside/notification-service" -c ~/go/src/github.com/saltside/notification-service
tmux new -d -s "saltside/offer-service" -c ~/go/src/github.com/saltside/offer-service
tmux new -d -s "saltside/payment-admin" -c ~/go/src/github.com/saltside/payment-admin
tmux new -d -s "saltside/payment-service" -c ~/go/src/github.com/saltside/payment-service
tmux new -d -s "saltside/platform-admin-data-contracts" -c ~/go/src/github.com/saltside/platform-admin-data-contracts
tmux new -d -s "saltside/platform-data-contracts" -c ~/go/src/github.com/saltside/platform-data-contracts
tmux new -d -s "saltside/platform-config-files" -c ~/go/src/github.com/saltside/platform-config-files
tmux new -d -s "saltside/platform-puppet-v2" -c ~/go/src/github.com/saltside/platform-puppet-v2
tmux new -d -s "saltside/platform-proto-files" -c ~/go/src/github.com/saltside/platform-proto-files
tmux new -d -s "saltside/platform-thrift-files" -c ~/go/src/github.com/saltside/platform-thrift-files
tmux new -d -s "saltside/review-service" -c ~/go/src/github.com/saltside/review-service
tmux new -d -s "saltside/sandbox" -c ~/go/src/github.com/saltside/sandbox
tmux new -d -s "saltside/scheduler-service" -c ~/go/src/github.com/saltside/scheduler-service
tmux new -d -s "saltside/search-service-v2" -c ~/go/src/github.com/saltside/search-service-v2
tmux new -d -s "saltside/sms-service" -c ~/go/src/github.com/saltside/sms-service
tmux new -d -s "saltside/web" -c ~/go/src/github.com/saltside/web
tmux new -d -s "saltside/web-gateway" -c ~/go/src/github.com/saltside/web-gateway
tmux new -d -s "saltside/web-pwa" -c ~/go/src/github.com/saltside/web-pwa
tmux new -d -s "saltside/web-router" -c ~/go/src/github.com/saltside/web-router
tmux new -d -s "saltside/workstation" -c ~/go/src/github.com/saltside/workstation
