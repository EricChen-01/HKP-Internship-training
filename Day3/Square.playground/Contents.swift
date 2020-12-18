import UIKit

class Square {
    
    var side: Double
    func getArea() -> Double{
        return side * side
    }
    
    func getPerimeter() -> Double{
        return 4 * side
    }
    
    init(side: Double){
        self.side = side
    }
}

let smallSquare = Square(side: 3)

print("The area is \(smallSquare.getArea()) and the perimeter is \(smallSquare.getPerimeter())")


