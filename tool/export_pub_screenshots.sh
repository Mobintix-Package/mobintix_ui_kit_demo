#!/usr/bin/env bash
# Capture screenshots on a mobile device/emulator and copy them into:
#   - this repo's screenshots/ (public reference on GitHub)
#   - mobintix_ui_kit/screenshots/ (sibling package; pub.dev carousel)
#
# Uses `flutter drive` so PNG bytes are written on the host (not web), under
# build/pub_screenshots/.
#
# Usage:
#   ./tool/export_pub_screenshots.sh [device_serial]
set -euo pipefail

DEVICE_ID="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
KIT_SCREENSHOTS="$(cd "$PROJECT_ROOT/../../mobintix_ui_kit/screenshots" && pwd)"
DEMO_SCREENSHOTS="$PROJECT_ROOT/screenshots"

cd "$PROJECT_ROOT"

if [[ -n "$DEVICE_ID" ]]; then
  D_FLAG=(-d "$DEVICE_ID")
else
  D_FLAG=()
fi

rm -rf build/pub_screenshots
mkdir -p build/pub_screenshots

flutter drive \
  --driver=test_driver/pub_screenshots_driver.dart \
  --target=integration_test/screenshots_test.dart \
  "${D_FLAG[@]}"

mkdir -p "$DEMO_SCREENSHOTS"
cp -f build/pub_screenshots/*.png "$KIT_SCREENSHOTS/"
cp -f build/pub_screenshots/*.png "$DEMO_SCREENSHOTS/"
echo "Copied PNGs to $DEMO_SCREENSHOTS and $KIT_SCREENSHOTS"
