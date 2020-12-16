import UIKit

//Day 1
// Variables -- declaration and printing
var str = "Hello, world!" //string variable
var integer: Int = 38 //integer variale

//string variable with multiline support
var string = """
This line
goes through
many lines
"""

// use \ to indicate to swift that you dont want to break at that line.
var string2 = """
This line \
does not break
"""


var pi = 3.14 //doubles
var boolean = true // booleans

var cool = "You can add variables inside strings like this this \(pi) "

// explicit declaration of swift
let bob: Bool = true
let ross: Int = 3
let eric: Double = 3.5
let chen: Character = "a"

//using let key word makes variable into CONSTANTS... kinda like final for java
let e = 2.71828









//Day2
//Arrays

var lst = [1,2,3,4,5,6,7,8,9,10]
print(lst[lst.count - 1]) // use lst[] to refer to specific element of an array

var names = ["bob","ross","Eric","Chen","Test","Test"]


//Sets

var lst2 = Set(["bob","ross","ross","test"]) // duplicates get ignored

//Tuples

let name = (first: "Bob" ,last: "Ross")
name.first
name.last
name.0
name.1

//Dictionaries like arrays but access them using anything we want: most common is strings
let test = [
    "Bob Ross": 3.14,
    "Ross Bob": 2.78
]

let test2 = [
    1: "TEST",
    2: "TEST2"
]

test["Bob Ross"]
test2[1]

test["eric",default: 0] // default values for elements not in dictionary is nil. use default: to change the default key.

var empty = [String: String]()//creating empty dictionary
empty["bob"] = "ross"

var arr = [Int]()//creating empty arrays


var settInt = Set<Int>()
var settString = Set<String>()


//Enums helps with group values with similar meaning
enum results {
    case success
    case failure
}

results.failure
results.success
print(results.failure)

//associated values in enumns
enum activity{
    case talking(topic: String)
    case walking(destination: String)
    case singing(volume: Int)
}

let talkingTopic = activity.talking(topic: "stuff")