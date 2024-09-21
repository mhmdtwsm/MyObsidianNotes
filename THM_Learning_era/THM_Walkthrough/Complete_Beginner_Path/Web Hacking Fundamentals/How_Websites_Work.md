
### How websites work

When you visit a website, your browser requests data from a *web server*, which processes the request and sends back information to display the page. A website consists of a ***front end (how the browser renders it)*** and a ***back end (the server handling requests and responses)***.

### HTML

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

- `<!DOCTYPE html>`: Declares HTML5.
- `<html>`: Root element.
- `<head>`: Contains metadata (like the title).
- `<body>`: Visible content (e.g., headings, paragraphs, images).

Attributes like `class` and `id` help style or identify elements.