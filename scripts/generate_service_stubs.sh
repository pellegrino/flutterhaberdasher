#!/usr/bin/env bash  

set -ev

# rm -rf ./lib/model/google 
rm -rf ./lib/model/rpc/haberdasher

protoc -I. --twirp_dart_out=./lib/model --dart_out=./lib/model rpc/haberdasher/service.proto
# Leaving this as an example of how to handle google.protobuf.Timestamps, if they were present 
# protoc -I. --twirp_dart_out=./lib/model --dart_out=./lib/model $PROTO_DIR/google/protobuf/timestamp.proto

flutter dartfmt ./lib/model