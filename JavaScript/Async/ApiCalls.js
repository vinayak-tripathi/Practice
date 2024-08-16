const getApiCall = async() => {
    try{
      const response = await fetch('https://api.github.com/users/vinayak-tripathi');
      return response.json();
    }
    catch(error){
      return error;
    }
  };
 
 //getApiCall().then(profile=> console.log(profile));
 
 
 const postApiCall = async() => {
   const rawResponse = await fetch("https://httpbin.org/post",{
     method: "POST",
     headers:{
       Accept:"application/json",
       "Content-Type":"application/json"
     },
     body:JSON.stringify({a:1, b: "Textual content"})
   });
   const content = await rawResponse.json();
   
   console.log(content);
 };
 
 postApiCall()