#!/bin/bash
# Manufacturing Boot Camp - local test launcher (Mac / Linux)
# Double-click this file. It starts a small local web server in this folder
# and opens the app in your browser. Everything works, including the
# Advanced Mold Making lessons.

cd "$(dirname "$0")"
echo ""
echo "  Manufacturing Boot Camp - starting local test server..."
echo "  Leave this window open while you test."
echo "  When you're done, close this window to stop the server."
echo ""

# Pick whichever Python is available
if command -v python3 >/dev/null 2>&1; then
  ( sleep 1; open "http://localhost:8765/index.html" 2>/dev/null || xdg-open "http://localhost:8765/index.html" 2>/dev/null ) &
  python3 -m http.server 8765
elif command -v python >/dev/null 2>&1; then
  ( sleep 1; open "http://localhost:8765/index.html" 2>/dev/null || xdg-open "http://localhost:8765/index.html" 2>/dev/null ) &
  python -m SimpleHTTPServer 8765
else
  echo "  Python isn't installed. Easiest fix: just double-click index.html"
  echo "  (everything works except the Mold lessons, which need this server)."
  read -p "  Press Enter to close."
fi
