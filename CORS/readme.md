# CORS Demo

This demo gives you a fast classroom setup for showing what CORS is and why browsers block some cross-origin requests.

## What this demo shows

It runs:

+ a frontend at `http://localhost:5500`
+ an API at `http://localhost:8000`

Because the ports are different, they are different **origins**. That lets you show:

+ a `GET` request that fails because the API does not send `Access-Control-Allow-Origin`
+ a `GET` request that succeeds because the API does send the header
+ a `POST` request with JSON that fails its **preflight** check
+ a `POST` request with JSON that succeeds after the API answers the preflight request

## Files

+ `api_server.py` - small Python API with CORS and non-CORS endpoints
+ `web/index.html` - browser page for running the demo
+ `run-demo.sh` - starts both servers together

## Run it

From the project root:

```bash
cd CORS
chmod +x run-demo.sh
./run-demo.sh
```

Then open:

`http://localhost:5500`

## Teaching flow

1. Open the page and also open the browser DevTools console and Network tab.
2. Click **GET without CORS**.
3. Show students that the API did send a response, but the browser blocks frontend JavaScript from reading it.
4. Click **GET with CORS** and compare the successful response.
5. Click **POST without CORS** to show the browser sending an `OPTIONS` preflight request first.
6. Show that the preflight fails because the server does not allow the origin, method, and headers.
7. Click **POST with CORS** and show the successful preflight and the successful `POST`.

## Important talking points

+ CORS is enforced by the browser, not by Postman or curl.
+ Different ports mean different origins.
+ A missing `Access-Control-Allow-Origin` can block even a normal `GET`.
+ JSON `POST` requests usually trigger a preflight request.
+ The server must answer the preflight correctly for the real request to continue.

## Quick curl examples

These help you explain that the server is reachable even when the browser blocks access:

```bash
curl http://localhost:8000/api/no-cors
curl http://localhost:8000/api/with-cors
curl -i -X OPTIONS http://localhost:8000/api/post-with-cors \
  -H "Origin: http://localhost:5500" \
  -H "Access-Control-Request-Method: POST" \
  -H "Access-Control-Request-Headers: Content-Type"
```
