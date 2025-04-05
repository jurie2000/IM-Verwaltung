#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FRONTEND_PORT=3100
BACKEND_PORT=8181

echo "🧪 Running full stack test..."

"$DIR/startFrontend.sh"
"$DIR/startBackend.sh"

echo "⏳ Waiting for services to start..."
sleep 10

echo ""
echo "🔍 Checking availability..."

function check {
  URL=$1
  NAME=$2
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
  if [[ "$STATUS" == "200" || "$STATUS" == "204" ]]; then
    echo "✅ $NAME reachable at $URL"
  else
    echo "❌ $NAME not reachable at $URL (Status: $STATUS)"
  fi
}

check "http://localhost:$FRONTEND_PORT" "Frontend"
check "http://localhost:$BACKEND_PORT/actuator/health" "Backend (Actuator)"

echo ""
echo "🧹 Cleaning up..."
"$DIR/stopFrontend.sh"
"$DIR/stopBackend.sh"

echo "✅ Test completed."
