# S3 CORS Demo

Yes, you can implement a CORS demo on S3.

The cleanest classroom version uses **three S3 buckets**:

1. A **frontend bucket** that hosts the demo page.
2. A **blocked data bucket** with a public JSON file and **no CORS configuration**.
3. An **allowed data bucket** with a public JSON file and a CORS rule that allows the frontend bucket origin.

This is great for teaching **GET/download CORS** on S3.

If you also want to teach **POST preflight**, use API Gateway + Lambda or keep the local Python API demo in [CORS/readme.md](/Users/calson.njinoh/Class10/CORS/readme.md:1).

## Files

+ `index.html` - upload this to the frontend bucket
+ `allowed-bucket-cors.json` - apply this only to the allowed data bucket
+ `public-read-policy.example.json` - sample public-read bucket policy

## Suggested bucket names

Use unique names, for example:

+ `class10-cors-frontend-yourname-001`
+ `class10-cors-blocked-yourname-001`
+ `class10-cors-allowed-yourname-001`

## What students will see

+ Opening the blocked JSON file directly in a browser tab works.
+ Fetching that same blocked JSON file from JavaScript on the frontend page fails.
+ Fetching the allowed JSON file from JavaScript succeeds.

That difference is the lesson: **S3 served both objects, but the browser only exposed one of them to page JavaScript.**

## Setup Steps

### 1. Create the frontend bucket

Create an S3 bucket and enable **Static website hosting**.

Upload:

+ `index.html`

Apply a public-read policy based on `public-read-policy.example.json`.

For the frontend bucket, replace:

+ `REPLACE_BUCKET_NAME` with your frontend bucket name

After you enable website hosting, copy the **Bucket website endpoint** from the AWS console. It will look similar to:

`http://your-frontend-bucket.s3-website-your-region.amazonaws.com`

You will need that exact origin in the allowed bucket CORS rule.

### 2. Create the blocked data bucket

Create a second bucket.

Upload a file named `blocked.json` with content like:

```json
{
  "bucket": "blocked",
  "message": "This object is public, but this bucket does not allow the frontend origin with CORS."
}
```

Apply a public-read policy so the object can be opened directly in a browser.

Do **not** add any CORS configuration to this bucket.

### 3. Create the allowed data bucket

Create a third bucket.

Upload a file named `allowed.json` with content like:

```json
{
  "bucket": "allowed",
  "message": "This object is public and this bucket allows the frontend origin with CORS."
}
```

Apply a public-read policy so the object can also be opened directly.

Then apply the CORS configuration in `allowed-bucket-cors.json`.

Before applying it, replace:

+ `http://REPLACE_WITH_YOUR_FRONTEND_WEBSITE_ENDPOINT`

with the exact website origin of your frontend bucket.

Example:

```json
[
  {
    "AllowedHeaders": ["*"],
    "AllowedMethods": ["GET", "HEAD"],
    "AllowedOrigins": [
      "http://class10-cors-frontend-yourname-001.s3-website-us-east-1.amazonaws.com"
    ],
    "ExposeHeaders": [],
    "MaxAgeSeconds": 3000
  }
]
```

## Upload the demo page

Upload `index.html` from this folder to the frontend bucket website root.

Then open the frontend bucket website URL in your browser.

Paste these two object URLs into the page:

+ blocked object URL
+ allowed object URL

Use the website endpoint or object URL that opens publicly in a browser for each JSON file.

## Teaching flow

1. Open the frontend page from the frontend S3 bucket website endpoint.
2. Paste the blocked and allowed JSON object URLs.
3. Click `Open directly` for the blocked object and show that the JSON is real and publicly reachable.
4. Click `Fetch blocked object` and show that JavaScript access fails.
5. Open DevTools Network and Console to show the missing `Access-Control-Allow-Origin` header.
6. Click `Fetch allowed object` and compare the successful result.

## AWS CLI Example

These are example commands only. Replace bucket names and region.

```bash
aws s3 mb s3://class10-cors-frontend-yourname-001 --region us-east-1
aws s3 mb s3://class10-cors-blocked-yourname-001 --region us-east-1
aws s3 mb s3://class10-cors-allowed-yourname-001 --region us-east-1

aws s3 cp index.html s3://class10-cors-frontend-yourname-001/index.html
aws s3 cp blocked.json s3://class10-cors-blocked-yourname-001/blocked.json
aws s3 cp allowed.json s3://class10-cors-allowed-yourname-001/allowed.json

aws s3api put-bucket-cors \
  --bucket class10-cors-allowed-yourname-001 \
  --cors-configuration file://allowed-bucket-cors.json
```

## Important note

S3 is not a full API server, so it is not the best place to demonstrate:

+ custom server logic
+ JSON `POST` handling
+ richer preflight scenarios

For those, use:

+ your existing local Python CORS demo
+ API Gateway + Lambda
+ EC2 or Elastic Beanstalk if you want a traditional server
