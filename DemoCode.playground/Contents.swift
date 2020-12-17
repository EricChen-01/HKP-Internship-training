import UIKit


//pyramid
print("Hello, world")

for i in 1...4{
    for _ in 1...i{
        print("*",terminator: "")
    }
    print()
}

print(multiply(3,6))

print(factorial(number: 5))



func multiply(_ x: Int,_ y: Int) -> Int{
    return x * y
}


func factorial(number: Int) -> Int{
    let result = number
    if(number == 0){
        return 1
    }else{
        return result * factorial(number: number - 1)
    }
}
