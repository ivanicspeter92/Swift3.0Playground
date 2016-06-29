class Number {
    var myNumber: Int;
    
    init(myNumber: Int) {
        self.myNumber = myNumber;
    }
}

func addOne(_ toNumber: Number) {
    toNumber.myNumber += 1;
}

let a = Number(myNumber: 1);
a.myNumber;
addOne(a);
a.myNumber;
