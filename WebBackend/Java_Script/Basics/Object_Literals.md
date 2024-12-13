

**JavaScript objects are collections of key-value pairs, where the keys (also called properties) are strings or Symbols, and the values can be any type of data, including other objects, functions, or primitives.**

---

## Creating Objects

### Object Literals

The most common way to create objects in JavaScript is using object literals:

```javascript
const person = {
    name: "John",
    age: 30,
    greet() {
        console.log(`Hello, my name is ${this.name}`);
    }
};

person.greet(); // "Hello, my name is John"
```

### Using `Object` Constructor

```javascript
const obj = new Object();
obj.name = "Alice";
obj.sayHello = function () {
    console.log("Hello!");
};

obj.sayHello(); // "Hello!"
```

### Using `Object.create`

`Object.create` creates a new object with the specified prototype:

```javascript
const parent = {
    greet() {
        console.log("Hello from parent");
    }
};

const child = Object.create(parent);
child.sayHello = function () {
    console.log("Hello from child");
};

child.greet(); // "Hello from parent"
child.sayHello(); // "Hello from child"
```

---

## Accessing Properties

### Dot Notation

```javascript
console.log(person.name); // "John"
```

### Bracket Notation

Useful when property names are dynamic or not valid identifiers:

```javascript
const key = "age";
console.log(person[key]); // 30
```

---

## Modifying Objects

### Adding Properties

```javascript
person.job = "Developer";
console.log(person.job); // "Developer"
```

### Updating Properties

```javascript
person.age = 31;
console.log(person.age); // 31
```

### Deleting Properties

```javascript
delete person.age;
console.log(person.age); // undefined
```

---

## Prototypes and Inheritance

### Prototype Chain

Objects in JavaScript have an internal prototype (`[[Prototype]]`) that allows them to inherit properties and methods from another object.

### Setting Prototypes

#### Using `Object.create`

```javascript
const animal = {
    makeSound() {
        console.log("Some generic sound");
    }
};

const dog = Object.create(animal);
dog.bark = function () {
    console.log("Woof!");
};

dog.makeSound(); // "Some generic sound"
dog.bark(); // "Woof!"
```

#### Using `Object.setPrototypeOf`

```javascript
Object.setPrototypeOf(dog, animal);
dog.makeSound(); // "Some generic sound"
```

---

## Understanding `this`

The `this` keyword in JavaScript refers to the context in which a function is executed. Its value depends on how the function is called.

### In an Object Method

When a method is called on an object, `this` refers to the object itself:

```javascript
const user = {
    name: "Jane",
    greet() {
        console.log(`Hello, my name is ${this.name}`);
    }
};

user.greet(); // "Hello, my name is Jane"
```

### In a Regular Function

In non-strict mode, `this` defaults to the global object (`window` in browsers, `global` in Node.js). In strict mode, `this` is `undefined`:

```javascript
function showThis() {
    console.log(this);
}

showThis(); // Global object (or undefined in strict mode)
```

### With Arrow Functions

Arrow functions do not have their own `this`. They inherit `this` from their surrounding lexical scope:

```javascript
const user = {
    name: "Mike",
    greet: () => {
        console.log(`Hello, my name is ${this.name}`); // `this` is not the user object
    }
};

user.greet(); // "Hello, my name is undefined"
```

### Using `this` in Event Handlers

In event handlers, `this` refers to the element that received the event:

```javascript
const button = document.querySelector("button");
button.addEventListener("click", function () {
    console.log(this); // The button element
});
```

### Binding `this` Explicitly

You can explicitly set the value of `this` using `call`, `apply`, or `bind`:

```javascript
function greet() {
    console.log(`Hello, my name is ${this.name}`);
}

const person = { name: "Emma" };
greet.call(person); // "Hello, my name is Emma"
greet.apply(person); // "Hello, my name is Emma"

const boundGreet = greet.bind(person);
boundGreet(); // "Hello, my name is Emma"
```

---

## Built-in Object Methods

### `Object.keys`

Returns an array of the object's own property names:

```javascript
console.log(Object.keys(person)); // ["name", "greet"]
```

### `Object.values`

Returns an array of the object's own property values:

```javascript
console.log(Object.values(person)); // ["John", [Function: greet]]
```

### `Object.entries`

Returns an array of key-value pairs:

```javascript
console.log(Object.entries(person)); // [["name", "John"], ["greet", [Function: greet]]]
```

### `Object.assign`

Copies properties from one or more source objects to a target object:

```javascript
const target = {};
const source = { a: 1, b: 2 };
Object.assign(target, source);
console.log(target); // { a: 1, b: 2 }
```

### `Object.freeze`

Prevents modifications to an object:

```javascript
const obj = { name: "Alice" };
Object.freeze(obj);
obj.name = "Bob"; // Ignored
console.log(obj.name); // "Alice"
```

---

## Summary

Objects in JavaScript are flexible and form the backbone of most functionality in the language. They support:

- Dynamic addition and deletion of properties
- Prototypal inheritance for sharing behaviors
- Built-in methods for manipulation and introspection
- Context-aware usage of `this` for dynamic behaviors

Understanding objects is key to mastering JavaScript.

