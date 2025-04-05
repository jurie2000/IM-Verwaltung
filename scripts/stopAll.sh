#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "🛑 Stopping all services..."
"$DIR/stopBackend.sh"
"$DIR/stopFrontend.sh"
echo "✅ All services stopped."
