# Accessing HTML Elements from JavaScript

![](../../photos/DOM/DOM_Elements.png)

In this document, we'll explore how to interact with HTML elements using JavaScript. By accessing and manipulating HTML elements, you can create dynamic and interactive web pages.

## Methods to Access HTML Elements

JavaScript provides several methods to select and work with elements in the DOM (Document Object Model). Below are the most commonly used methods:

### 1. `getElementById`

- Selects a single element based on its `id` attribute.

```javascript
const element = document.getElementById("myElement");
console.log(element); // Logs the element with id="myElement"
```

**Note:** If you assign the same `id` to multiple elements, `getElementById` will return only the first element it encounters in the DOM. This behavior can lead to unexpected results and should be avoided.

### 2. `getElementsByClassName`

- Returns a collection of elements that share the same `class`.

```javascript
const elements = document.getElementsByClassName("myClass");
console.log(elements); // Logs an HTMLCollection of elements with class="myClass"
```

**Note:** Classes are meant to be reused across multiple elements. `getElementsByClassName` will return all elements with the specified class as an HTMLCollection.

### 3. `getElementsByTagName`

- Selects elements based on their tag name, such as `div`, `p`, or `input`.

```javascript
const elements = document.getElementsByTagName("p");
console.log(elements); // Logs an HTMLCollection of all <p> elements
```

### 4. `querySelector`

- Selects the first element that matches a given CSS selector.

```javascript
const element = document.querySelector(".myClass");
console.log(element); // Logs the first element with class="myClass"
```

### 5. `querySelectorAll`

- Selects all elements that match a given CSS selector.

```javascript
const elements = document.querySelectorAll(".myClass");
console.log(elements); // Logs a NodeList of all elements with class="myClass"
```

## Examples

### Accessing and Modifying an Element

You can retrieve an element and then modify its content or style:

```javascript
const heading = document.getElementById("heading");
heading.textContent = "Hello, World!"; // Changes the text content
heading.style.color = "blue";          // Changes the text color
```

### Adding Event Listeners

After accessing an element, you can add interactivity with event listeners:

```javascript
const button = document.querySelector("#myButton");
button.addEventListener("click", () => {
  alert("Button clicked!");
});
```

### Working with Multiple Elements

When accessing multiple elements, loop through the collection to apply changes:

```javascript
const items = document.querySelectorAll(".list-item");
items.forEach((item) => {
  item.style.backgroundColor = "yellow";
});
```

**Note:** If you assign the same `name` attribute to multiple elements, you can access them using `document.getElementsByName`. This will return a NodeList containing all elements with that name. Unlike `id`, it is common and valid to reuse `name` attributes for form elements.

## Accessing and Manipulating Attributes

HTML elements have attributes that can be accessed and modified directly or using attribute-related functions.

### Direct Access

You can directly access and modify common attributes using their corresponding properties:

```javascript
const inputField = document.getElementById("input");
inputField.value = "Hello"; // Sets the current value of the input field
inputField.placeholder = "Enter your text here"; // Sets the placeholder text
```

### Using Attribute Functions

For less common or custom attributes, use the following methods:

#### `getAttribute`

- Retrieves the value of a specified attribute.

```javascript
const inputField = document.getElementById("input");
console.log(inputField.getAttribute("type")); // Logs the type of the input, e.g., "text"
```

#### `setAttribute`

- Sets a new value for a specified attribute.

```javascript
inputField.setAttribute("type", "password"); // Changes the input type to "password"
```

#### `removeAttribute`

- Removes a specified attribute from an element.

```javascript
inputField.removeAttribute("readonly"); // Makes the input editable
```

### Most Used Attributes and Examples

Here are some commonly used attributes and how to work with them:

1. **`id`**
    
    - Used to uniquely identify an element.
    
    ```javascript
    const element = document.getElementById("uniqueId");
    element.id = "newId"; // Changes the id attribute
    ```
    
2. **`class`**
    
    - Specifies one or more class names for an element.
    
    ```javascript
    element.setAttribute("class", "newClass");
    element.className = "anotherClass"; // Alternative way to set class
    ```
    
3. **`src`** (for images, scripts, etc.)
    
    - Defines the source URL.
    
    ```javascript
    const img = document.getElementById("myImage");
    img.src = "newImage.jpg";
    ```
    
4. **`href`** (for links)
    
    - Specifies the URL of the link.
    
    ```javascript
    const link = document.querySelector("a");
    link.href = "https://example.com";
    ```
    
5. **`disabled`**
    
    - Disables an input or button.
    
    ```javascript
    const button = document.getElementById("submitButton");
    button.setAttribute("disabled", "true");
    button.disabled = true; // Alternative
    ```
    
6. **`style`**
    
    - Used to apply inline styles.
    
    ```javascript
    element.style.color = "red";
    element.style.backgroundColor = "yellow";
    ```
    
7. **Custom Attributes**
    
    - Accessed and modified like any other attribute.
    
    ```javascript
    const element = document.querySelector("[data-custom-attribute]");
    console.log(element.getAttribute("data-custom-attribute"));
    element.setAttribute("data-custom-attribute", "newValue");
    ```

---

# Some Notes to put in consideration


## Difference between direct property access and accessing with attribute functions

```js
let inField = document.getElementById("input");

inField.value = "Hello";

inField.setAttribute("value", "Hello");
```


***The difference*** between `inField.value = "Hello";` and `inField.setAttribute("value", "Hello");` lies in how they interact with the `DOM` element's _property_ versus its _attribute_:

### 1. **`inField.value = "Hello";`**

- This directly sets the **value property** of the `DOM` element.

- The `value` property reflects the **current value** of the input field, which is what the user sees and can interact with in the `UI`.

- Changing the `value` property updates the displayed value in the input field but does **not** update the `value` attribute in the HTML source.

***Example:***

```html
<input id="inField" value="Default Value">
```

```js
const inField = document.getElementById("inField");
inField.value = "Hello";
console.log(inField.getAttribute("value")); // "Default Value"
```

- Here, the input field will show `Hello`, but the `value` attribute in the HTML remains `"Default Value"`.


