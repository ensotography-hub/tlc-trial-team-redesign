#!/bin/bash
DIR=$(cd "$(dirname "$0")" && pwd)
cd "$DIR"
exec /usr/bin/env node "$DIR/scripts/auto-push.js"
