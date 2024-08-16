let mySet = new Set();
mySet.add(1);
mySet.add("Vt");
console.log(mySet);
console.log(mySet.has("Vt"));
console.log(mySet.delete("Vt")); //Return True if deleted
console.log(mySet.delete("vt")); //returns false if deleted is called for non existing value
console.log(mySet);


let array = [1,2,2,1,1,2,34,4,5,5,323];
let arraySet = new Set(array);
console.log(arraySet);

for(let val of arraySet){
  console.log(val)
}

