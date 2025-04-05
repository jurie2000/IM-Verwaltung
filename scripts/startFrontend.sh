#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FRONTEND_DIR="$SCRIPT_DIR/../frontend/im-client-view"
PORT=3100

cd "$FRONTEND_DIR" || { echo "❌ Frontend-Verzeichnis nicht gefunden: $FRONTEND_DIR"; exit 1; }

echo "🔄 Installing frontend dependencies..."
npm install

echo "🚀 Starting React frontend on port $PORT..."
PORT=$PORT nohup npm start > /dev/null 2>&1 &

sleep 3
echo "🌍 React frontend should be running at: http://localhost:$PORT"
