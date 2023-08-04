// 1. Introduction and Setup
// JavaScript (often abbreviated as JS) is a high-level, interpreted programming language. It's a multi-paradigm language that supports event-driven, functional, and imperative programming styles.

// To start writing JavaScript, all you need is a modern web browser and a text editor. Web browsers have JavaScript engines that can interpret and run your code.

// 2. Basic Syntax
// JavaScript syntax is the set of rules, how JavaScript programs are constructed:

// Variables: Variables are containers for storing data values. In JavaScript, you can declare a variable using let, const, or var.

let name = "John"; // This is a string variable
const pi = 3.14; // This is a number variable

// Data Types: JavaScript has dynamic types. The same variable can be used to hold different data types. The most common data types are: `Number`, `String`, `Boolean`, `Object`, `Null`, and `Undefined`.

let num = 25; // Number
let str = "Hello World"; // String
let isTrue = false; // Boolean
let person = {firstName:"John", lastname:"Doe"}; // Object
let empty = null; // Null
let notDefined; // Undefined

// Functions: Functions are block of code designed to perform a particular task. A JavaScript function is defined with the function keyword, followed by a name, followed by parentheses ().
// Console.log is not the same as write-host in powershell.
function sayHello() {
    console.log("Hellow, world!");
}

// You can call this function using its name followed by parentheses.

sayHello(); // Outputs: "Hello, world!"

// Arrays: Arrays are used to store multiple values in a single variable
let fruits = ["Apple", "Banana", "Mango"];

// Operators: JavaScript has airthmetic, comparison, logical, assignment, and other operators
let x = 10;
let y = 20;

console.log(x+y); //Arithmetic operator
console.log(x==y); // Comparison Operator
console.log(x < y && x !== y); // Logical and comparison operator
x = y; // Assignment operator

// Control Structures: JavaScript supports `if`, `else`, `switch` for codtiional operators and `for`, `do while` loops for iterative operations
// If-else statement
let time = 20;
if (time < 18) {
    console.log("Good day");
} else {
    console.log("Good Evening");
}

// For Loop
for(let i = 0; i < 5; i++) {
    console.log(i);
}

// 3. Intermediate and Advanced Concepts
// As you progress, you'll want to learn about more advanced topics like:

// Object Oriented Programming in JavaScript (Objects, Prototypes)
// Functional Programming (First class functions, closures)
// Asynchronous JavaScript (Promises, Async/Await, AJAX)
// ES6 and later features (Arrow functions, Destructuring, Template Literals, Modules, etc.)
// Error Handling and Debugging
// A key part of learning JavaScript is practice, so I recommend trying out all these concepts in code, and working on projects that make you think about how to structure and design your code.

// There are also many resources available online, such as the Mozilla Developer Network, that have comprehensive tutorials and documentation on JavaScript.

// Let me know if you have any specific questions or if there's a particular area you want to dive deeper into!

// 1. Objects

// In JavaScript, objects are king. If you understand objects, you understand JavaScript. An object is a standalone entity, with properties and type. Objects can contain many values as properties.

let person = {
    firstname: "John",
    lastname: "Doe",
    age: 50,
    eyecolor: "blue"

};
