
// console.log("vt");

const EventBubbling = function(){
    const main = document.getElementById("main");
    const one = document.getElementById("one");
    const two = document.getElementById("two");
    main.addEventListener("click", e=>{
        console.log("main CLicked");
    },true)

    one.addEventListener("click", e=>{
        console.log("one CLicked");
    },true)

    two.addEventListener("click", e=>{
        console.log("two CLicked");
    },true)
}

const DOMEvents = function(){
    const elementmain = document.getElementById("main");
    console.log(elementmain)
    const buttons = document.querySelectorAll("button");
    /*button.addEventListener("click",e=>{
        console.log(e.target.innerHTML);
    })*/
    const clickHandle = e=>{
        console.log(e.target.innerHTML);
    }
    buttons.forEach(element => {
        element.addEventListener("click",clickHandle)
    });

    setTimeout(()=>{
        console.log("removed");
        buttons.forEach(element =>{
            element.removeEventListener("click",clickHandle);
        })
    },10000);
}

const debounce = (fn, delay)=>{
    let timeoutId;
    return function(...args){
        if(timeoutId){
            clearTimeout(timeoutId);
        }
        timeoutId = setTimeout(()=>{
            fn(...args)
        }, 
        delay);
    }
}

const Debouncing = function(){

    document.getElementById("debounce").addEventListener("click", debounce(e=>{
        console.log("clicked");
    },1000));
}

const throttle = (fn, delay)=>{
    // let timeoutId;
    // return function(...args){
    //     if(timeoutId){
    //         clearTimeout(timeoutId);
    //     }
    //     timeoutId = setTimeout(()=>{
    //         fn(...args)
    //     }, 
    //     delay);
    // }
    let last = 0;
    return (...args)=>{
        const now = new Date().getTime();
        if (now -last<delay){
            return;
        }
        last = now;
        return fn(...args);
    }
}

const Throttling = function(){
    document.getElementById("throttle").addEventListener("click",throttle(e=>{
        console.log("clicked");
    },5000));
}


window.onload = alert("VT is here")


