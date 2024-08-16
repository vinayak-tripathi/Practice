//Find the max number
const numArray = [4,1,2,10,1000];

let maxValue =Number.NEGATIVE_INFINITY;

for(let val of numArray){
  maxValue = val>maxValue?val:maxValue
}

console.log(maxValue)

//find two max number
let max1 = Number.NEGATIVE_INFINITY;
let max2 = Number.NEGATIVE_INFINITY;

for(let val of numArray){
  if (val>max1){
    max2 = max1;
    max1 = val;
  }
  else if (val>max2){
      max2 = val;
  }
  
}
console.log(max1,max2)