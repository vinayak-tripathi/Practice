const array = [{name:"john", age :30},
              {name:"peter", age:20},
              {name:"jill", age:90}];
//below is the call function for the sort function
// it takes two arguments since sorting requires two number
const cb = function(a,b){
  return a-b;
  // sorts based on the sign of the difference
  // reverse the oredr of the subtraction to revesre the sorting direction
}

const cbObject = function(a,b){
  return a.age-b.age;
  }

array.sort(cbObject);

console.log(array);