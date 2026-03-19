#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Usage: ./flutterfire-config.sh dev|prod{{#include_stage}}|stage{{/include_stage}}

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev' or 'prod'{{#include_stage}} or 'stage'{{/include_stage}}."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project={{project_name.paramCase()}}-dev \
      --out=lib/core/config/dev/firebase_options_dev.dart \
      --ios-bundle-id=com.{{project_name.dotCase()}}.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.{{project_name.dotCase()}}.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  prod)
    flutterfire config \
      --project={{project_name.paramCase()}}-prod \
      --out=lib/core/config/prod/firebase_options_prod.dart \
      --ios-bundle-id=com.{{project_name.dotCase()}}.prod \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.{{project_name.dotCase()}}.prod \
      --android-out=android/app/src/prod/google-services.json
    ;;
{{#include_stage}}
  stage)
    flutterfire config \
      --project={{project_name.paramCase()}}-stage \
      --out=lib/core/config/stage/firebase_options_stage.dart \
      --ios-bundle-id=com.{{project_name.dotCase()}}.stage \
      --ios-out=ios/flavors/stage/GoogleService-Info.plist \
      --android-package-name=com.{{project_name.dotCase()}}.stage \
      --android-out=android/app/src/stage/google-services.json
    ;;
{{/include_stage}}
  *)
    echo "Error: Invalid environment specified. Use 'dev' or 'prod'{{#include_stage}} or 'stage'{{/include_stage}}."
    exit 1
    ;;
esac
