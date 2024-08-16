const array = [{num:1},{num:2},{num:3}]
const multiply2 = function(e){
  return e.num*2;
}

console.log(array.map(multiply2));

const even = function(e){
  return e.num%2===0? e.num:null;
}
console.log(array.filter(even));

const sum = function(acc, e){
  return acc+e.num;
}

console.log(array.reduce(sum,0));

