#!/bin/bash
FRONTEND_PORT=3100
BACKEND_PORT=8181
IP=$(ipconfig getifaddr en0)  # für macOS – für Linux: `hostname -I | awk '{print $1}'`

echo "📡 Local IP: $IP"
echo ""
echo "📊 Current service status:"
echo ""

check_status() {
  PORT=$1
  NAME=$2
  URL_LOCAL="http://localhost:$PORT"
  URL_LAN="http://$IP:$PORT"

  PID=$(lsof -ti tcp:$PORT)

  if [ -n "$PID" ]; then
    echo "🟢 $NAME is running (PID: $PID)"
    echo "🔗 Localhost: $URL_LOCAL"
    echo "🌐 Over network: $URL_LAN"
  else
    echo "🔴 $NAME is NOT running"
  fi
  echo ""
}

check_status $FRONTEND_PORT "Frontend"
check_status $BACKEND_PORT "Backend (Actuator)"