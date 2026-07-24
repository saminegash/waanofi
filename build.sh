#!/bin/bash
# Download Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Build the Flutter web app using your .env file
flutter build web --release --dart-define-from-file=.env
