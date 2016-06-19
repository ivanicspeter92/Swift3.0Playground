import UIKit

struct Temperature {
    var celsius: Double = 0;
    var fahrenheit: Double {
        get { return celsius * 9 / 5 + 32; }
        set { self.celsius = (newValue - 32) * 5 / 9; }
    }
}

struct House {
    var temperature = Temperature();
}

struct Oven {
    var temperature = Temperature();
}

var temp = Temperature();
temp.fahrenheit = 75;

var home = House();
home.temperature = temp;
home.temperature.fahrenheit

temp.fahrenheit = 275;

var oven = Oven();
oven.temperature = temp;
oven.temperature.fahrenheit
home.temperature.fahrenheit // the home's temperature is not changing, because it is a value type