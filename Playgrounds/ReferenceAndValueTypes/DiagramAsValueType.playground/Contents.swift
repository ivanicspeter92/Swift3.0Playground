// A playground presenting how to implement a drawable Diagram type using structs.
// Source: https://developer.apple.com/videos/play/wwdc2015/414/

import UIKit

var a = Circle(center: CGPoint(x: 0, y: 0), radius: 5), b = Circle(center: CGPoint(x: -1, y: -1), radius: 5);
a == b;
b = a;
a == b;
