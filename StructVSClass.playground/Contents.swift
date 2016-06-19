class Number {
    var myNumber: Int;
    
    init(myNumber: Int) {
        self.myNumber = myNumber;
    }
}

func addOne(toNumber: Number) {
    toNumber.myNumber += 1;
}

let a = Number(myNumber: 1);
a.myNumber;
addOne(toNumber: a);
a.myNumber;