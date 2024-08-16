const profile ={
    name:"Vinayak",
    age:21
  }
  
  const setProfile = function(name,age){
    this.name = name;
    this.age = age;
  }
  
  const boundProfile = setProfile.bind(profile);
  //above line binds the function to profile and return that bounded new object
  
  console.dir(boundProfile);
  boundProfile("Romeo",19);
  console.log(profile)
  
  setProfile.call(profile,"Tripathi",30);
  console.log(profile);
  
  let params = ["Peter",90];
  setProfile.apply(profile,params);
  console.log(profile);