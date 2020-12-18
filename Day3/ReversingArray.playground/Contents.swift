import UIKit

func reverseInt(list: inout Array<Int>) -> Array<Int>{
    var low = 0
    var high = list.count - 1
    
     while(low < high){
        let temp = list[low]
        list[low] = list[high]
        list[high] = temp
        low += 1
        high -= 1
    }
    
    return list
}

var list1 = [1,2,3,4,5,6,7,8,9,10]

reverseInt(list: &list1)

print(list1)
