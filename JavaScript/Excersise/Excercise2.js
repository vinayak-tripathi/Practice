number=454
isPrime = true
if (number === 1) {
    console.log("1 is neither prime nor composite number.");
}
else if (number%2==0){
    isPrime=false;
    console.log(`${number} is a not prime number`);
}
else if (number > 1) {
    for (let i = 2; i <= number**0.5; i++) {
        if (number % i == 0) {
            isPrime = false;
            break;
        }
    }
    if (isPrime) {
        console.log(`${number} is a prime number`);
    } 
  else {
        console.log(`${number} is a not prime number`);
    }
}
else {
    console.log("The number is not a prime number.");
}