.PHONY: test

cleandb:
	@(redis-cli KEYS "limitertests:*" | xargs redis-cli DEL)

test: cleandb
	@(scripts/test)

lint:
	@(scripts/lint)


PKGMAP=Mproto/auth/policy.proto=auth/policy
GOOGLEAPI=${GOPATH}/src/github.com/yourhe/grpc-gateway/third_party/googleapis
GOOGLEAPIS_DIR=$(GOOGLEAPI)

AUTH_PROTO_DIR=$(PWD)/auth
AUTH_PROTO=$(AUTH_PROTO_DIR)/policy.proto \
	$(AUTH_PROTO_DIR)/group.proto

REWRITE_PROTO_DIR=$(PWD)/proto/rewrite
REWRITE_PROTO=$(REWRITE_PROTO_DIR)/rewrite.proto 

PROTOC_INC_PATH=$(dir $(shell which protoc))/../include
PKG=${GOPATH}/src/github.com/yourhe/grpc-gateway
GO_PLUGIN=bin/protoc-gen-go
GATEWAY_PLUGIN=$(PKG)/bin/protoc-gen-grpc-gateway

# EXAMPLES_REWRITE_POLICY=$(GOPATH)/src/gitlab.iyorhe.com/wfgz/reverseproxy/proto/rewrite/rewrite.proto
EXAMPLES_REWRITE_POLICY=proto/rewrite/rewrite.proto
REWRITE_PROTO_DIR=$(PWD)/proto/rewrite
REWRITE_PROTO=$(REWRITE_PROTO_DIR)/rewrite.proto 
REWRITE_DIR=$(GOPATH)/src/gitlab.iyorhe.com/wfgz/reverseproxy
GOPATH_DIR=$(GOPATH)/src
REVERSEPROXY_DIR=gitlab.iyorhe.com/wfgz/reverseproxy



PLATFORMS_PROTO_DIR=$(PWD)/proto
PLATFORMS_PROTO=$(PLATFORMS_PROTO_DIR)/context.proto

gen_proto_context:
	protoc -I/usr/local/include \
		-I$(PROTOC_INC_PATH) \
		-I$(GOPATH_DIR) \
		-I$(GOOGLEAPIS_DIR) \
		-I. \
		-I$(PLATFORMS_PROTO_DIR) \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/yourhe/grpc-gateway/third_party/googleapis \
		--go_out=plugins=grpc:$(PLATFORMS_PROTO_DIR)/../ \
		$(PLATFORMS_PROTO)


