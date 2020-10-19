# Flutter Haberdasher

A small Flutter project, demonstrating how to integrate a mobile app to consume a [twirp](https://github.com/twitchtv/twirp) based API

## Installation

```
go get -u github.com/pellegrino/protoc-gen-twirp_dart
pub global activate protoc_plugin
./scripts/generate_service_stubs.sh
```

## Scripts

scripts/generate_service_stubs.sh: Generates the service stubs, based on the proto definitions.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
