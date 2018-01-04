This docker image is for running serverless node services with puppeteer.

Note: puppeteer is run as root so if will have to use this flag:

```js
const browser = await puppeteer.launch({ args: ["--no-sandbox"] });
```
