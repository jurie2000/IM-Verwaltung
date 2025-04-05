#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "🚀 Starting all services..."
"$DIR/startBackend.sh"
"$DIR/startFrontend.sh"
echo "✅ All services started."

echo "Services should be running at:"
"$DIR/status.sh"