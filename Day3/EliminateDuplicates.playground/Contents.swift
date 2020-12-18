import UIKit

var list1 = [1,2,3,4,4,4,4,5,6,7,2,1,2,12,2,100]


func removeDuplicates(list: Array<Int>) -> Array<Int>{
    var newList = [Int]()
    
    for int in 0..<list1.count{
        if(newList.contains(list[int])){
            continue
        }else {
            newList.append(list[int])
        }
    }
    
    
    return newList
}



print(removeDuplicates(list: list1))
