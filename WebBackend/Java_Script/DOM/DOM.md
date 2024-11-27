---
tags:
  - getElementById
---

In JavaScript, the `document` object represents the entire HTML document that is loaded in the browser. It is part of the Document Object Model (DOM) and provides various methods and properties to interact with the content and structure of the web page.

# Methods:

## `.getElementById`


`getElementById` is a method in the Document Object Model (DOM) used in JavaScript to select and manipulate HTML elements.

So basically you enter the ID of an object in the HTML Doc and start playing with it.

```js
let a = document.getElementById("count")
``` 

### `.InnerText`

`.innerText` is a property of DOM elements in JavaScript that allows you to **get or set the text content of an element**, excluding any HTML tags. It is widely used **for manipulating the visible text** within HTML elements.

```js
let a = document.getElementById("count")
a.getElementById("count").innerText = "5";
```













