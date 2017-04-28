BINARY?=go-protocol-comparison-server
PROTOC?=submit_image.pb.go
IMAGE_NAME?=go-protocol-comparison

clean:
	if [ -f ${BINARY} ]; then rm ${BINARY}; fi
	if [ -f ./submit-image/${PROTOC} ]; then rm ./submit-image/${PROTOC}; fi
	if [ ! -z $(docker images -q ${IMAGE_NAME}) ]; then docker rmi ${IMAGE_NAME}; fi

build:
	protoc -I submit-image/ submit-image/submit_image.proto --go_out=plugins=grpc:submit-image
