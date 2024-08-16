const setCookie = (key, val, days)=>{
    let date = new Date();
    date.setTime(date.getTime()+days*24*60*60*1000);
    document.cookie = `${key}=${val};expires=${date.toGMTString()}`;
  }
  
  const getCookie = (key)=>{
    const all = document.cookie.split(";");
    let value =null;
    all.forEach((val)=>{
      const cookie = val.trim();
      const cookieArray = cookie.split('=');
      if(cookieArray[0]===key){
        value = cookieArray[1];
      }
    })
    if(value){
      return value;
    }
    else{
      return 'Cookie not found';
    }
  }
  console.dir(document);
  document.cookie = "name=Vinayak";
  document.cookie = "age = 21";
  document.cookie = "country = india;path=/";
  
  setCookie('dinner','pizza',2);
  console.log(document.cookie);
  console.log(getCookie('dinner'));