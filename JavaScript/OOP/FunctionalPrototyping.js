//Class and Prototyping
const Car = function(color){
    // this will be constructor of the Car class
    // it takes the argument color
    // we can restrict the user for defining this class as a function(without new keyword)
    // as  
    if (!new.target) throw "Car is a class. Use new keyword to initialize it";
    this._color = color;// this suggests that the _color is internal property of the Car class
    
  }
  
  const blueCar = new Car('blue');
  console.log(blueCar);
  
  const grayCar = Car('gray');
  //above line call Car as function which has return undefined
  
  