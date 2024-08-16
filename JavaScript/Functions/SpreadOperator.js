let str = "techsith";

let ary = [...str];

let obj = {...str}; //Spread operator
console.log(ary);
console.log(obj);
//Rest parameters (..nums) and (vt, ...nums) vt is the fixed parameter and nums is the rest parameter
let addAll= function(div,...nums){
  let sum = 0;
  for(let i =0 ; i<nums.length;i++){
    sum+=nums[i];
  }
  return sum/div;
}

console.log(addAll(87,1,2,2,3,43,4,32));