#!/usr/bin/env python3
import json
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


WEB_ORIGIN = "http://localhost:5500"
API_HOST = "localhost"
API_PORT = 8000


class CorsDemoHandler(BaseHTTPRequestHandler):
    def _set_json_headers(self, status_code=200, *, cors=False):
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        if cors:
            self.send_header("Access-Control-Allow-Origin", WEB_ORIGIN)
        self.end_headers()

    def _send_json(self, payload, status_code=200, *, cors=False):
        self._set_json_headers(status_code, cors=cors)
        self.wfile.write(json.dumps(payload, indent=2).encode("utf-8"))

    def do_OPTIONS(self):
        if self.path == "/api/post-with-cors":
            self.send_response(204)
            self.send_header("Access-Control-Allow-Origin", WEB_ORIGIN)
            self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.send_header("Access-Control-Max-Age", "600")
            self.end_headers()
            return

        self.send_response(204)
        self.end_headers()

    def do_GET(self):
        if self.path == "/api/no-cors":
            self._send_json(
                {
                    "demo": "simple GET",
                    "status": "response sent without Access-Control-Allow-Origin",
                    "teaching_point": "The browser receives the response, but JavaScript cannot read it.",
                }
            )
            return

        if self.path == "/api/with-cors":
            self._send_json(
                {
                    "demo": "simple GET",
                    "status": "success",
                    "teaching_point": "The API allowed the frontend origin, so browser JavaScript can read this response.",
                },
                cors=True,
            )
            return

        self._send_json(
            {
                "error": "Not found",
                "available_endpoints": [
                    "/api/no-cors",
                    "/api/with-cors",
                    "/api/post-no-cors",
                    "/api/post-with-cors",
                ],
            },
            status_code=404,
            cors=True,
        )

    def do_POST(self):
        content_length = int(self.headers.get("Content-Length", "0"))
        raw_body = self.rfile.read(content_length) if content_length else b"{}"

        try:
            body = json.loads(raw_body.decode("utf-8"))
        except json.JSONDecodeError:
            body = {"raw_body": raw_body.decode("utf-8", errors="replace")}

        if self.path == "/api/post-no-cors":
            self._send_json(
                {
                    "demo": "preflighted POST",
                    "status": "response sent without CORS headers",
                    "received": body,
                    "teaching_point": "The browser should fail before this response is made available to frontend JavaScript.",
                }
            )
            return

        if self.path == "/api/post-with-cors":
            self._send_json(
                {
                    "demo": "preflighted POST",
                    "status": "success",
                    "received": body,
                    "teaching_point": "The preflight passed and the response includes Access-Control-Allow-Origin.",
                },
                cors=True,
            )
            return

        self._send_json({"error": "Not found"}, status_code=404, cors=True)

    def log_message(self, format, *args):
        print(f"[api] {self.address_string()} - {format % args}")


if __name__ == "__main__":
    server = ThreadingHTTPServer((API_HOST, API_PORT), CorsDemoHandler)
    print(f"CORS demo API running at http://{API_HOST}:{API_PORT}")
    print(f"Allowed frontend origin: {WEB_ORIGIN}")
    server.serve_forever()
