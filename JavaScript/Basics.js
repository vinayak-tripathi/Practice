let myDogsName = 'Cujo';
//debugger;
myDogsName = 1; 
//debugger;
console.log(myDogsName);

//var myDogsName1 = "Tom";//Older way of doing it\

myDogsName = "Tom";
//debugger;
const PI = 3.14;
console.log(PI);

let variableUndefined ; 
//Undefined is the by defult assignment by the 
// system for no value
// NUll is the empty value given by user
console.log(typeof(variableUndefined),variableUndefined);
variableUndefined = 'Cujo';
console.log(typeof(variableUndefined),variableUndefined);

// const CONSTANT; //Not Allowed
const CONSTANT = "VT";
console.log(typeof(CONSTANT),CONSTANT)

myDogsName = null;
console.log(typeof(myDogsName),myDogsName);

// Boolean Data Type
let iAmRight = true;
let theyAreRight = false;

console.log(typeof(iAmRight));

// String
myDogsName = 'cujo cujo Nice nice cujo';
console.log(typeof(myDogsName));
console.log(myDogsName.__proto__);

console.log(myDogsName.length);
console.log(myDogsName.charAt(2));
console.log(myDogsName.indexOf('cujo'));
console.log(myDogsName.lastIndexOf('cujo'));
console.log(myDogsName.split(" "));

let statement = 'I love \'cujo\'';
console.log(statement);

// template strings

let name = 'Vinayak';
let greetings = 'hello';

//let message = name+' '+greetings;

let  message = `${greetings} ${name}`;
console.log(message);

let a = 1;
let b = 2.2;

let total = `my total is ${a+b}`;
console.log(total)

// Number

let numberOfCars = 22;
let moneyInMyPocket = 2.5;
let wishfullIncome = 2e10;
console.log(wishfullIncome);

let x = 0xFF;
console.log(x);

console.log(Math);

console.log((36).toString(36))
console.log(parseInt('110110010111001100100010111001010010',2))
console.log(0b110110010111001100100010111001010010.toString(10))

//random
let rand = Math.random();//Outputs random from 0 to 1
console.log(rand);

let randInt = Math.floor(Math.random()*10);
console.log(randInt);

let min = 8;
let max = 10;
let randRanged = Math.floor(Math.random()*(max-min+1))+min;
console.log(randRanged);

// Symbol
let newVal = Symbol();
let newVal1 = Symbol()
const obj = {};
obj[newVal] = 1;
obj[newVal1] = 3;
console.log(obj)

// Convert to a number

let numString = "123"
console.log(+numString)
console.log(+true)

console.log(Boolean(""));
console.log(Boolean(" "));
console.log(Boolean(0));
console.log(Boolean(-1));