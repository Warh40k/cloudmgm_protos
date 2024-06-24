SHELL=/bin/bash
.PHONY: proto
proto:
	while IFS='' read -r -d '' protofile; do \
      echo "$$protofile"; \
      protoc -I protos/proto "$$protofile" --go_out=./protos/gen/go \
        --go_opt=paths=source_relative --go-grpc_out=./protos/gen/go/ \
        --go-grpc_opt=paths=source_relative; \
    done < <(find ./protos -name "*.proto" -print0)