const obj = {x:1,y:2}

let {x,z,y}=obj; //this requires same name as key

let {x:x1,y:y1} = obj;

console.log(z,x,y);
console.log(x1,y1);