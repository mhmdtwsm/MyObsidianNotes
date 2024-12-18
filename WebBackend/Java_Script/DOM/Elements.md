# Accessing HTML Elements from JavaScript

In this document, we'll explore how to interact with HTML elements using JavaScript. By accessing and manipulating HTML elements, you can create dynamic and interactive web pages.

## Methods to Access HTML Elements

JavaScript provides several methods to select and work with elements in the `DOM` (Document Object Model). Below are the most commonly used methods:

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

## Some Notes to put in consideration


### Difference between direct property access and accessing with attribute functions

```js
let inField = document.getElementById("input");

inField.value = "Hello";

inField.setAttribute("value", "Hello");
```


***The difference*** between `inField.value = "Hello";` and `inField.setAttribute("value", "Hello");` lies in how they interact with the `DOM` element's _property_ versus its _attribute_:

#### 1. **`inField.value = "Hello";`**

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


#### 2. **`inField.setAttribute("value", "Hello");`**

- This sets the **value attribute** in the HTML markup, not the `value` property.

- The `value` attribute represents the **default value** of the input field, which is set when the page loads or when the form is reset.

- Changing the `value` attribute does **not immediately** update what the user sees in the UI unless the field is re-rendered or reset.

***Example:***

```html
<input id="inField" value="Default Value">
```

```js
const inField = document.getElementById("inField");
inField.setAttribute("value", "Hello");
console.log(inField.value); // "Default Value"
```

- Here, the `value` attribute in the HTML becomes `"Hello"`, but the input field still displays `"Default Value"` until re-rendered.


#### Key Points:

- **`value` property** reflects the current live value (what the user sees).

- **`value` attribute** defines the initial default value and does not change with user interaction unless explicitly updated.

- Use `inField.value` to interact with or set the visible value directly.

- Use `inField.setAttribute("value", "value");` to update the default value in the HTML.

---

## `DOM` and attributes are Object and properties in `JS` 

***Accessing an attribute*** of an HTML element from the JavaScript ***`DOM`*** is somewhat similar to accessing a property of an object. However, there are key differences:

- **HTML Attributes vs `DOM` Properties:**
    
    - **Attributes** are the values defined in the HTML markup (e.g., `<div id="myDiv" class="example">`).
    
	- **Properties** are part of the `DOM` objects that JavaScript works with. They represent the current state of an element, and can reflect changes to the `DOM` (e.g., `<div id="myDiv" class="newClass">` might change dynamically).

- **Accessing Attributes:** You access an HTML element's attribute using `getAttribute()` and `setAttribute()` methods:
```js
let element = document.getElementById('myDiv');
let id = element.getAttribute('id');  // Accessing an attribute
element.setAttribute('id', 'newId');  // Modifying an attribute
```

- **Accessing Properties:** You access a property directly, like an object property:
```js
let element = document.getElementById('myDiv');
let id = element.id;  // Accessing the DOM property
element.id = 'newId';  // Modifying the DOM property
```

**Differences in Behavior:**
    
- ***Attributes*** in HTML are static values set at page load. ***Properties*** represent the current state of an element in the `DOM`.
    
- Some ***attributes*** (like `checked` for `checkboxes` or `value` for form elements) are often automatically synchronized with their corresponding properties.
    
- When you modify an ***attribute*** via `setAttribute()`, it doesn't always reflect immediately in the `DOM` properties (and vice versa), especially for dynamic elements like `<input>`.


---

## Editing the Style of an Element


### **Editing the Style**

Once you've accessed the element, you can modify its inline style using the `style` property. The `style` property represents the inline styles applied to an element.

#### **Setting Styles**

To set a style, you directly assign the desired value to the style property:

```js
element.style.propertyName = 'value';
```

- **`propertyName`**: The CSS property you want to modify (written in camelCase).
- **`value`**: The value you want to assign to the property.

***Examples:***
```js
// Change background color
element.style.backgroundColor = 'blue';

// Change font size
element.style.fontSize = '20px';

// Change width
element.style.width = '100px';

// Change text color
element.style.color = 'white';
```

### **Accessing Current Styles**

If you want to read the current computed style of an element (the final, effective style after all CSS rules and inline styles have been applied), you can use the `getComputedStyle()` method:

```js
let computedStyle = window.getComputedStyle(element);

// Get the computed value of a specific property
let backgroundColor = computedStyle.backgroundColor;
let fontSize = computedStyle.fontSize;
```

### **Adding or Removing CSS Classes**

Instead of directly manipulating the `style` property, you can add or remove CSS classes that are defined in your `stylesheet`. This can be more efficient and maintainable.

**Adding a Class**
```js
element.classList.add('new-class');
```

**Removing Class**
```js
element.classList.remove('old-class');
```

**Toggling a Class**

You can toggle a class (add it if it doesn't exist, remove it if it does) using
```js
element.classList.toggle('toggle-class');
```

***By doing this you will apply or remove styles fast from the elements you want in the page.***


### **Removing Inline Styles**

To remove a specific style, you can set it to an empty string:
```js
element.style.backgroundColor = ''; // Removes the background color
```

You can also remove all inline styles at once:
```js
element.removeAttribute('style'); // Removes all inline styles
```

### **Considerations**

- **Inline Styles vs CSS**: Modifying styles through JavaScript only affects the inline styles. These changes will override any CSS rules applied via external stylesheets or `<style>` tags, but they can be overridden again if other inline styles or stylesheets are applied afterward.

- **CSS Variables**: If you're working with CSS variables, you can manipulate them using JavaScript:


```js
document.documentElement.style.setProperty('--main-color', 'green');
```

**Reflow and Repaint**: Changing styles can trigger reflow and repaint processes in the browser, which might impact performance if done frequently. ***Be mindful when making style changes in loops or on multiple elements.***

