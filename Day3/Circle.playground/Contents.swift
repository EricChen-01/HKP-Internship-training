import UIKit

struct Circle {
    
    var radius: Double

    func getArea() -> Double {
        return pow(radius, 2)
    }
    func getCircumference() -> Double {
        return 2 * radius
    }
    
    
}

let smallCircle = Circle(radius: 3)
print("The area is \(smallCircle.getArea())π and the circumference is \(smallCircle.getCircumference())π")
