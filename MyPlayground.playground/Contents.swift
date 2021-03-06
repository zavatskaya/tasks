import UIKit


import Foundation
import UIKit

public class Balls: UIView {
    
    private var colors: [UIColor]
    private var balls: [UIView] = []
    private var ballSize: CGSize = CGSize(width: 40, height: 40)
    private var animator: UIDynamicAnimator?
    private var snapBehavior: UISnapBehavior?
    private var collisionBehavior: UICollisionBehavior
    
    public init (colors: [UIColor]) {
        self.colors = colors
        collisionBehavior = UICollisionBehavior(items: [])
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        backgroundColor = UIColor.black
        animator = UIDynamicAnimator(referenceView: self)
        animator?.addBehavior(collisionBehavior)
        ballsView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ballsView() {
        for (index, color) in colors.enumerated() {
            let ball = UIView(frame: CGRect.zero)
            ball.backgroundColor = color
            addSubview(ball)
            balls.append(ball)
            let origin = 60 * index + 30
            ball.frame = CGRect(x: origin, y: origin, width: Int(ballSize.width), height: Int(ballSize.height))
            ball.layer.cornerRadius = ball.bounds.width / 2.0
            collisionBehavior.addItem(ball)
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            for ball in balls {
                if (ball.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                    snapBehavior?.damping = 0.5
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            if let snapBehavior = snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }
    
    
}






/*
struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet (newRadius) {
            print("Вместо значения \(self.radius) устанавливается значение \(newRadius)")
        }
        didSet (oldRadius) {
            print("Вместо значения \(oldRadius) установлено значение \(self.radius)")
        }
    }
    var perimeter: Float {
        get {
            return 2 * 3.14 * self.radius
        }
        set {
           self.radius = newValue / (2 * 3.14)
        }
    }
}

var obj = Circle (coordinates: (1, 0), radius: 10)
obj.perimeter
obj.perimeter = 31.4
obj.radius



struct AudioChannel {
    static var maxValue = 5
    var value: Int {
        didSet {
            if value > AudioChannel.maxValue {
                value = AudioChannel.maxValue
                print(value)
                print(AudioChannel.maxValue)
            }
        }
    }
}

var leftVolume = AudioChannel(value: 2)
var rightVolume = AudioChannel(value: 3)
leftVolume.value
leftVolume.value = 6
leftVolume.value
AudioChannel.maxValue = 10
AudioChannel.maxValue
leftVolume.value = 9
leftVolume.value


class Quadruped {
    var type = ""
    var name = ""
    func walk(){
        print("walk")
    }
}

class Dog: Quadruped {
    func bark(){
        print("woof")
    }
}

class NoisyDog: Dog{
    override func bark(){
        for _ in 1...3 {
            super.bark()
        }
    }
}

var dog = Dog()
dog.type = "dog"
dog.walk()
dog.bark()

var badDog = NoisyDog()
badDog.bark()


var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case let someString as String:
            print("a string value of \" \(someString)\" ")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let stringConverter as (String) -> String:
            print(stringConverter("Troll"))
        default:
            print("something else")
    }
}


class Dogg: Quadruped {
    override init() {
        super.init()
        self.type = "dog"
    }
    
    convenience init(text: String) {
        self.init()
        print(text)
    }
    
    func bark() {
        print("woof")
    }
}

var d = Dogg(text: "hello, it's me")



class Rectangle {
    var height: Int
    var weight: Int
    init? (height h: Int, weight w: Int) {
        self.height = h
        self.weight = w
        if (h < 0 || w < 0) {
            return nil
        }
    }
}

var r = Rectangle(height: 12, weight: -12)



enum TempUnit {
    case Kelvin, Celsius, Fahrenheit
    init? (symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let f = TempUnit(symbol: "F")


class superclass {
    init? (isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("экземпляр создан")
        }
    }
    deinit {
        print("деинициализатор суперкласса")
    }
}

class subclass: superclass {
    deinit {
        print("деинициализатор подкласса")
    }
}

var a = subclass(isNil: true)
a = nil


extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1000.0}
    var ft: Double {return self / 3.28084}
}

let oneInch = 25.4.mm
print("один фут это \(oneInch) метра")
let threeFeet = 3.ft
print("3 футра это \(threeFeet) метра")


struct Line {
    var firstPoint: (Double, Double)
    var secondPoint: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(pow((line.secondPoint.0 - line.firstPoint.0), 2) + pow(line.secondPoint.1 - line.firstPoint.1, 2))
    }
}

var myLine = Line (firstPoint: (10, 10), secondPoint: (14, 10))
var length = Double(line: myLine)


extension Int {
    func repititions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

5.repititions {
    print("text")
}




protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        return String(self)
    }
}

5.asText()



protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func happyBDay (celebrator: Named & Aged) {
    print("С днем рождения, \(celebrator.name), тебе уже \(celebrator.age) лет!")
}

let person = Person(name: "Катя", age: 20)
happyBDay(celebrator: person)


var str: String*/


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
