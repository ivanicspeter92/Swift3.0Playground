import UIKit

class Temperature {
    var celsius: Double = 0;
    var fahrenheit: Double {
        get { return celsius * 9 / 5 + 32; }
        set { self.celsius = (newValue - 32) * 5 / 9; }
    }
}

class House {
    var temperature = Temperature();
}

class Oven {
    var temperature = Temperature();
}

let temp = Temperature();
temp.fahrenheit = 75;

let home = House();
home.temperature = temp;
home.temperature.fahrenheit

temp.fahrenheit = 275;

let oven = Oven();
oven.temperature = temp;
oven.temperature.fahrenheit
home.temperature.fahrenheit // the home's temperature is changing as well, because it is a reference type