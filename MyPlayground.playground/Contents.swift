import UIKit

enum Color {
    case white
    case black
}

enum ChessFigures {
    case pawn
    case rook
    case knight
    case bishop
    case queen
    case king
}

struct Chessmen {
    var figure: ChessFigures
    var color: Color
    var coordinates: (String, UInt)?
    init(figure: ChessFigures, color: Color, coordinates: (String, UInt)?) {
        self.figure = figure
        self.color = color
        self.coordinates = coordinates != nil ? coordinates : nil
        print(figure, color, coordinates!)
    }
    mutating func setCoordina­tes(_ a1: String, _ a2: UInt){
        self.coordinates = (a1, a2)
        print("coordinates are \(coordinates!)")
    }
    
    mutating func kill() {
        self.coordinates = nil
        print("\(color) \(figure) was killed")
    }
}
var figure1 = Chessmen (figure: .bishop, color: .black, coordinates: ("A", 8))
figure1.setCoordina­tes("D", 3)
print(figure1.coordinates!)
figure1.kill()
print(figure1.coordinates)

/*https://www.codewars.com/kata/52fb87703c1351ebd200081f
func whatCentury(_ year: String) -> String {
    var y = Double(year)!
    y = y / 100
    y.round(.awayFromZero)
    let n = Int(y)
    
    return n == 13 || n == 15 || n == 12 || n == 11 ? String(n) + "th" : n % 10 == 3 ? String(n) + "rd" : n % 10 == 2 ? String(n) + "nd" : n % 10 == 1 ? String(n) + "st" : String(n) + "th"
    
}
whatCentury("1234")*/

/*https://www.codewars.com/kata/56a5d994ac971f1ac500003e

func longestConsec(_ strarr: [String], _ k: Int) -> String {
    if (strarr.count <= 0 || k <= 0) {
        return ""
    }
    let array = strarr
    var sotredArr = array.sorted() { $0.characters.count > $1.characters.count}
    var n = ""
    for i in 0...k-1 {
        n += sotredArr[0]
        sotredArr.remove(at: 0)
    }
    return n
}

longestConsec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1)*/


//  if let n = arr.max(by: {$1.count > $0.count}){print(n)}

/* https://www.codewars.com/kata/fizz-buzz-cuckoo-clock

func fizzBuzzCuckooClock(_ time: String) -> String {
    var arr = time.components(separatedBy: ":")
    var hours = Int(arr[0])
    let minutes = Int(arr[1])
    hours! = hours! > 12 ? hours! - 12 : hours! == 0 ? 12 : hours!
    var cuckoo = String(repeating: "Cuckoo ", count: hours!)
    cuckoo = String(cuckoo.characters.dropLast())
    return minutes! == 00 ? cuckoo : minutes! == 30 ? "Cuckoo" : minutes! % 3 == 0 && minutes! % 5 == 0 ? "Fizz Buzz" : minutes! % 3 == 0  ? "Fizz" : minutes! % 5 == 0 ? "Buzz" : "tick"
}
fizzBuzzCuckooClock ("00:17")
 */

/* John wants to decorate a room with wallpaper. He has been said that making sure he has the right amount of wallpaper is more complex than it sounds. He wants a fool-proof method to getting it right.
John knows that the rectangular room has a length of l meters, a width of w meters, a height of h meters. The standard width of the rolls he wants to buy is 52 centimeters. The length of a roll is 10 meters. He bears in mind however, that it’s best to have an extra length of wallpaper handy in case of mistakes or miscalculations so he wants to buy a length 15% greater than the one he needs.
Last time he did these calculations he caught a headache so could you help John? Your function wallpaper(l, w, h) should return as a plain English word in lower case the number of rolls he must buy.
#Example: wallpaper(4, 3.5, 3) should return "ten"
#Notes:
all rolls (even with incomplete width) are put edge to edge
0 <= l, w, h (floating numbers), it can happens that w x h x l is zero
the integer r (number of rolls) will always be less or equal to 20

func wallpaper(_ l: Double, _  w: Double,_  h: Double) -> String {
    
    let numbers = ["zero", "one", "two", "three", "four", "five",
                   "six", "seven", "eight", "nine", "ten",
                   "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                   "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
    
    return l*w*h == 0 ? "zero" : numbers[Int((l * 2 + w * 2) / 0.52 * h / 10 * 1.15) + 1]
}

wallpaper(6.1,2.0 ,3.15)*/

/* Create a function (or write a script in Shell) that takes an integer as an argument and returns "Even" for even numbers or "Odd" for odd numbers.

func evenOrOdd(_ number:Int) -> String {
    let str: String = (number % 2 == 0) ? "even" : "odd"
    return str
}

evenOrOdd (35)*/



/* Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 integers. No floats or empty arrays will be passed.
 
 For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.
 
 [10, 343445353, 3453445, 3453545353453] should return 3453455.

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    let sortedArray = array.sorted()
    return (sortedArray[0] + sortedArray[1])
}

sumOfTwoSmallestIntegersIn ([19, 5, 42, 2, 77])*/


/* typealias Chessman = [String: (alpha:Character, num:Int)?]
let chessmans: Chessman = ["Белый король": (alpha: "A", num: 4), "Белый ферзь": (alpha: "B", num: 7), "Черная пешка": nil]

if let c1 = chessmans["Белый король"] ?? nil {
    print (c1)
} else {
    print ("Белый король нету")
}

if let c2 = chessmans["Белый ферзь"] ?? nil {
    print (c2)
} else {
    print ("Белый ферзь нету")
}

if let c3 = chessmans["Черная пешка"] ?? nil {
    print (c3)
} else {
    print ("Черная пешка нету")
}*/


/* 1 задание стр 100
var s = Int8.min
var q = UInt8.max

var a = 12
var b:Int = 16
var c:Int = 0
print (a, b)
c = a
a = b
b = c
print ("a теперь =  \(a), b теперь = \(b)")
 */

/* 1 задание стр 102
let a = 0.2
let b: Float = 0.0
var c: Double = 0.0

c = 4.5555

print (a, b, c)
 */

/* 1 задание стр 116
let a: Int = 18, b: Float = 16.4, c: Double = 5.7
print (a, b, c)
var d: Float = Float(a) + b + Float(c)
print (d)
var e: Int = Int (a) * Int (b) * Int (c)
print (e)
var g: Int = Int (b) % Int (c)
print (Double(g))
 */

/* 2 задание стр 117
var a = 2, b = 3
var c = (a + 4 * b) * (a - 3 * b) + a * a
print (c)
 */

/* 3 задание стр 117
var c: Float = 1.75, d: Float = 3.25
var a = 2 * (c + 1) * (c + 1) + 3 * (d + 1)
 */

/* 4 задание стр 117
let length = 2
let s = pow (2, length)
let c = 3.14 * 2 * Double (length)
 */

/* 1 задание стр 130
var str = String ("Hello")
let chr = "e"
var a = 5, b = 45
let res = "\(str) \(chr) \(a + b)"
 */

/* 2 задание стр 130
var star = Character("*")
var res = "\(star)  \(star)  \(star)"
    " \(star)\(star)\(star)\(star)"
    "  \(star) \(star)"
 */

/* 3 задание стр 131
var day = 13
var month = "November"
var year = 2018
var date = "\(year) \(month) \(day)"
 */

/* 1 задание стр 137
var v1 = true, v2 = false
var res1 = v1 || v2
var res2 = v1 && v2
 */

/* 1 задание стр 140
let str = "Liliya"
var w: Double = 57
var h: Int = 170

var imt = w / ((170*170)/10000)
 */

/* 1 задание стр 161
var krt1 = ("The 1970's", 7, "manty")
let film = krt1.0, num = krt1.1, food = krt1.2
var krt2 = ("Pianist", 98, "plov")
var krt3 = (krt1.0, krt1.1, krt1.2)
krt1 = krt2
krt2 = krt3
var krt4 = (krt1.1, krt2.1, krt2.1 - krt1.1)
 */

/* опционалы
var i: Int = 0
var str: String?
var btn: UIButton?

i = 7


func testI(k: Int?, zx: Int?) {
    var z = 5
    z += (k ?? 10) + (zx ?? 10)
    print("\(z)")
}



class TestClass {
    var i: Int
    var z: Int
    
    init(i: Int, z: Int) {
        self.i = i
        self.z = z
    }
}

var test = TestClass(i: 5, z: 4)
test.i
 */


/* 1 199
typealias Test = String
let a: Test = "12", b: Test = "34", c: Test = "12g2"

if (Int(a) != nil) {
    print (a)
}

if (Int(b) != nil) {
    print (b)
}

if (Int(c) != nil) {
    print (c)
}

typealias TupleType = (numberOne: Test?, numberTwo: Test?)?
var v1: TupleType = ("190", "67")
var v2: TupleType = ("100", nil)
var v3: TupleType = ("-65", "70")


if let(q1, q2) = v1{
    if q1 != nil && q1 != nil {
        print (q1!, q2!)
    }
}

if let(q3, q4) = v2{
    if q3 != nil && q4 != nil {
        print (q3!, q4!)
    }
}

if let(q5, q6) = v3{
    if q5 != nil && q6 != nil {
        print (q5!, q6!)
    }
} */
