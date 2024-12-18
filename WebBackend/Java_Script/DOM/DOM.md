---
tags:
  - getElementById
  - innerText
  - addEventListener
---

![](../../photos/DOM/DOM_Elements.png)


In JavaScript, the `document` object represents the entire HTML document that is loaded in the browser. It is part of the Document Object Model (DOM) and provides various methods and properties to interact with the content and structure of the web page.

### [Elements](Elements.md)



---
# Example Methods:

## `.getElementById`
#getElementById 

`getElementById` is a method in the Document Object Model (DOM) used in JavaScript to select and manipulate HTML elements.

So basically you enter the ID of an object in the HTML Doc and start playing with it.

```js
let a = document.getElementById("count")
``` 


## `.InnerText`
#innerText 

`.innerText` is a property of DOM elements in JavaScript that allows you to **get or set the text content of an element**, excluding any HTML tags. It is widely used **for manipulating the visible text** within HTML elements.

```js
let a = document.getElementById("count")
a.getElementById("count").innerText = "5";
```

## `.addEventListener`
#addEventListener

An event listener is a mechanism to execute a specific function when a particular event occurs on a DOM element.

***Syntax:***
```js
element.addEventListener(event, function);
```

- `event`: The type of event to listen for (e.g., 'click', 'mouseover', 'keydown').
- `function`: The function to be executed when the event occurs.

***Example:***
```js
const button = document.getElementById('myButton');

button.addEventListener('click', function(){ alert("Button clicked!");});
```

- **Event Object:** When an event occurs, a `Event` object is passed to the event listener function. This object contains information about the event, such as the target element, the type of event, and additional properties.
- **Multiple Event Listeners:** You can attach multiple event listeners to a single element.
- **Removing Event Listeners:** Use the `removeEventListener()` method to remove an event listener.
