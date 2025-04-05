#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$SCRIPT_DIR/../backend/IM-Spring-Service"
PORT=8181

cd "$BACKEND_DIR" || { echo "❌ Backend-Verzeichnis nicht gefunden: $BACKEND_DIR"; exit 1; }

echo "🔄 Building backend..."
./gradlew build

echo "🚀 Starting Spring Boot on port $PORT..."
./gradlew bootRun --args="--server.port=$PORT" > "$SCRIPT_DIR/backend.log" 2>&1 &
BACK_PID=$!

echo "$BACK_PID" > "$SCRIPT_DIR/backend.pid"
echo "🌱 Spring Boot started in background (PID: $BACK_PID)"
sleep 3
echo "🌍 Spring Boot should be running at: http://localhost:$PORT/actuator/health"