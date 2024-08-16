let list = ['bread','milk','milk','milk','eggs','tomato'];

console.log(Array.isArray(list),list.constructor == Array)

console.log(list.indexOf("milk",3));
// returns the index of 3rd instance of milk
//returns -1 if the instance number exceeds the number of occurence

//const will avoid re assigning of the value
// but list can be modified not re assigned

list.push("candy");
console.log(list);

console.log(list.pop());
console.log(list);

list.unshift("candy");

console.log(list);

console.log(list.shift());
console.log(list);

list.splice(1,1,"spinach");

list.splice(1,1,"spinach");

list.splice(3,2,"vt",'tv');
console.log(list);
list.splice(3,0,"Hello");

console.log(list);


for(let i =0 ; i<list.length;i++){
  console.log(`${i}->${list[i]}`);
}

list.forEach((item,index)=> console.log(`${index}->${item}`));

for (let [index,item] of list.entries()){
  console.log(`${index}->${item}`);
}


