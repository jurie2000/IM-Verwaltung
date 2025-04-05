#!/bin/bash
PORT=3100
echo "🛑 Stopping frontend on port $PORT..."
lsof -ti tcp:$PORT | xargs -r kill -9 && echo "✅ Frontend stopped." || echo "⚠️  No frontend process found."
