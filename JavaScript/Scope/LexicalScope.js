let globalVar = "I am Global Varibale";
if (true){
  let fromIf = 1;
  {
    console.log(fromIf);
    //fromIf is lexically available for the inside block
    //The varibales can be accessed from within 
  }
  {
    console.log(globalVar);
  }
}