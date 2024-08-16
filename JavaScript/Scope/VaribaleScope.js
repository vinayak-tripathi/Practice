if(true){
  
    let fromIf= 1;
    {
      //Here the varibale is reassigned within this scope 
      // so value from the above scope will be shadowed
      //console.log(fromIf); 
      //THis will give error
      //But if the below line is commented then the outer scope variable will be accessed
      let fromIf=34;
      console.log(fromIf);
      {
        console.log(fromIf);
      }
    }
    console.log(fromIf);
  }