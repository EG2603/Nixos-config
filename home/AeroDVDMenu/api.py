#!/usr/bin/env python3
from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess
import urllib.parse

class H(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith("/run?cmd="):
            cmd = urllib.parse.unquote(self.path.split("=")[1])
            subprocess.Popen(cmd.split())
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"OK")
        else:
            self.send_response(404)
            self.end_headers()

HTTPServer(("localhost", 8899), H).serve_forever()