install-go: 
	sudo apt install -y protobuf-compiler
	go mod download
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

gen-go:
	protoc -I="$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/proto" --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative "$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/proto/gophkeeper/gophkeeper.proto"
	echo "All done."