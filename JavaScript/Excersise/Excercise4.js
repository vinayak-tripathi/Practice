//Question 1

const add = function(a,b){
    return a+b;
  }
  
  const multiply = function(a,b){
    return a*b;
  }
  
  const calc = function(n=1, cb){
    if (n<1){
      return 0;
    }
    if(n===1){
      return 1;
    }
    
    let total = 1;
    for (let i=2;i<=n;i++){
      total = cb(total,i);
    }
    return total;
  };
  
  console.log(calc(4,add));
  
  console.log(calc(4,multiply));
  
  //Question 2
  
  let array = [1,2,3,4,5,6]
  
  const calcSpread = function(cb,nums=[]){
    if(nums.length==0){
      return 0;
    }
    if(nums.length==1){
      return nums[0];
    }
    let total = nums[0];
    for (let i=1; i<nums.length; i++){
      total = cb(total,nums[i]);
    }
    
    return total;
  }
  
  console.log(calcSpread(multiply,array));
  console.log(calcSpread(add,array));
  
  