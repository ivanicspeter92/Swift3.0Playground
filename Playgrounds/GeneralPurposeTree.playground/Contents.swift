// Playground for implementing a general purpose tree data structure
// Source: https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure

let beverages = Node(value: "beverages");

let hotBeverages = Node(value: "hot");
beverages.addChild(node: hotBeverages);

let tea = Node(value: "tea"), coffee = Node(value: "coffee"), cocoa = Node(value: "cocoa");
hotBeverages.addChild(nodes: [tea, coffee, cocoa]);

let black = Node(value: "black"), green = Node(value: "green"), chai = Node(value: "chai");
tea.addChild(nodes: [black, green, chai]);

let coldBeverages = Node(value: "cold");
beverages.addChild(node: coldBeverages);

let soda = Node(value: "soda"), milk = Node(value: "milk");
coldBeverages.addChild(nodes: [soda, milk]);

let ginger = Node(value: "ginger ale"), lemon = Node(value: "bitter lemon");
soda.addChild(nodes: [ginger, lemon]);

print(beverages);

beverages.search(value: "tea");
