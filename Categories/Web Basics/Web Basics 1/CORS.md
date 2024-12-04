#CORS 

`CORS` is a security mechanism implemented in web browsers that allows or restricts web pages from making requests to a different origin (domain, protocol, or port) than their own. It enables secure cross-origin communication between clients and servers.

Let's imagine the scenario of visiting a *Website A* which wants some data form *Website B*...

#### **1. You Visit Website A**

You open **Website A** (`mywebsite.com`) in your browser. At this point, your browser makes a regular HTTP request to Website A to load the page.
```http
GET / HTTP/1.1
Host: mywebsite.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36
Accept-Language: en-US,en;q=0.9
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
```
At this point, there are no `Origin` or `Referer` headers because you are directly visiting **Website A**.

#### **2. Website A Needs Data from Website B**
Website A has JavaScript that needs data from **Website B** (e.g., an API). Website A says to your browser: _"Go fetch some data from `api.weather.com` on my behalf."_

This is typically an API request or fetch call made by JavaScript in **Website A**.
**API fetch Example:**
```js
// Website A wants to get data from Website B (api.weather.com)
const apiUrl = 'https://api.weather.com/v3/weather/forecast?location=12345';

// Making a GET request to Website B's API
fetch(apiUrl, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'Origin': 'https://website-a.com', // Specify the origin of the request
    'Referer': 'https://website-a.com/page', // Specify the referer to show where the request is coming from
  },
})
.then(response => response.json()) // Parse the JSON response
.then(data => {
  console.log('Weather Data:', data); // Handle the weather data
})
.catch(error => {
  console.error('Error fetching weather data:', error);
});
```

**HTTP request example:**
```http
GET /weather HTTP/1.1
Host: api.weather.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36
Accept: application/json, text/javascript
Origin: https://mywebsite.com
Referer: https://mywebsite.com/somepage
Connection: keep-alive
```

#### **3. Website B Checks Permissions**

Website B receives the request. It sees the `Origin` header (`https://mywebsite.com`) and decides whether or not it allows the request based on its CORS policy.

- If **Website B** allows requests from **Website A**, it responds with the data and includes the appropriate CORS headers.
```http
HTTP/1.1 200 OK
Access-Control-Allow-Origin: https://mywebsite.com   <-- Allows this specific origin
Access-Control-Allow-Methods: GET, POST
Access-Control-Allow-Headers: Content-Type
Content-Type: application/json
Content-Length: 250
```
Here, the server includes the `Access-Control-Allow-Origin` header in the response, which tells your browser that it is okay to send the data back to **Website A**.

- If **Website B** doesn’t allow requests from **Website A**, it denies the request.
```http
HTTP/1.1 403 Forbidden
```

#### **4. Your Browser Gives the Response to Website A**

If **Website B** allows the request, the browser passes the data back to **Website A** (through JavaScript or a front-end framework). You’ll see the data displayed on **Website A** (e.g., weather information).

Website A never directly communicates with Website B; **your browser** does all the work of making the request to Website B, checking the `CORS` headers, and returning the response.

#### **Summary of Request Flow:**

1. **You visit Website A** → No `Origin` or `Referer` header.

2. **Website A asks your browser to fetch data from Website B** → The request from your browser to Website B includes the `Origin` and `Referer` headers.

3. **Website B checks if the `Origin` is allowed** → It decides whether to send the data.

4. **Your browser receives the response from Website B** → The data is sent back to **Website A**.


#### Attacks

As a **web penetration tester**, understanding how the **`Origin`**, **`Referer`**, and `CORS` policies work can help you identify vulnerabilities such as:

- **Miss-configured `CORS`** (allowing unintended cross-origin data sharing).

- **Information disclosure** through improperly managed `Referer` or `Origin` headers.

- **`CSRF` vulnerabilities** if a website doesn't properly check these headers.

- **Redirect-based attacks** using headers.

By manipulating these headers, you can simulate attacks like:

- Accessing data from other origins (cross-origin attacks).

- Stealing sensitive information through crafted requests.

- Hijacking requests to trick a server into processing malicious actions.