#!/bin/bash
PORT=8181
echo "🛑 Stopping backend on port $PORT..."
lsof -ti tcp:$PORT | xargs -r kill -9 && echo "✅ Backend stopped." || echo "⚠️  No backend process found."
