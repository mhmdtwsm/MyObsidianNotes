
### How websites work

When you visit a website, your browser requests data from a *web server*, which processes the request and sends back information to display the page. A website consists of a ***front end (how the browser renders it)*** and a ***back end (the server handling requests and responses)***.

### `HTML`

Websites are built using HTML for structure, CSS for styling, and JavaScript for interactivity. HTML is the core language that defines a webpage's layout using elements (tags).

```html
<!DOCTYPE html> 
<html> 
	<head> 
		<title>Website Title</title> 
	</head> 
	<body> 
		<h1>Main Heading</h1> 
		<p class="bold-text">This is a paragraph.</p> 
		<img src="img/cat.jpg" alt="Cat"> 
	</body> 
</html>
```

- `<!DOCTYPE html>`: Declares `HTML5`.
- `<html>`: Root element.
- `<head>`: Contains metadata (like the title).
- `<body>`: Visible content (e.g., headings, paragraphs, images).
- `<img>`: Embeds an image from a specified source using the `src` attribute (e.g., `<img src="img/cat.jpg">`).
Attributes like `class` and `id` help style or identify elements.

### `JS`

JavaScript (JS) is a popular programming language that adds interactivity to web pages, complementing HTML, which structures the content. Without JS, web pages remain static. It allows real-time updates, such as changing button styles or displaying animations. JS can be embedded in HTML using `<script>` tags or linked externally.

For example, to change the content of an element with the id "demo" to "Hack the Planet," you can use:

```js
document.getElementById("demo").innerHTML = "Hack the Planet";
```

HTML elements can trigger `JS` events like `<onclick>` to execute code, such as changing text when a button is clicked:

```html
<button onclick='document.getElementById("demo").innerHTML = "Button Clicked";'>Click Me!</button>
```

### Data exposure

***Look at the source***

Sensitive Data Exposure happens when websites fail to protect sensitive information, such as login credentials, in their `frontend` source code. This can allow attackers to exploit such data by viewing the page source, potentially gaining unauthorized access to various parts of the application.
### `HTML` Injection

HTML Injection is a vulnerability that arises when a website displays unfiltered user input, allowing attackers to inject malicious HTML or JavaScript code. Proper input sanitization is crucial for security, as it prevents users from controlling how their input is rendered on the page, which could compromise both appearance and functionality. Developers should always sanitize user inputs to remove any HTML tags to mitigate this risk.
