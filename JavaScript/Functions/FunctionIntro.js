//Function declaration
function add(num1, num2){
    return num1+num2;
  }
  
  let sum = add(1,2)
  
  console.log(sum)
  
  //Anonymous function
  //Function expression
  let addE = function(num1,num2){
    return num1+num2;
  }
  
  console.log(addE(1,2));
  
  let addAll = function(){
    let sum = 0;
    for(let i =0;i<arguments.length;i++){
      sum+=arguments[i];
    }
    return sum;
  }
  console.log(addAll(1,2,3,3,4,4,5,5));
  
  
  