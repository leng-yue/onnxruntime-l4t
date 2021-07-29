# This .sh just copy file from docker

build -t onnxruntime-tensorrt-builder -f Dockerfile.build .
id=$(docker create onnxruntime-tensorrt-builder)
docker cp $id:/root/onnxruntime/build/Linux/Release/dist .
docker rm -v $id
