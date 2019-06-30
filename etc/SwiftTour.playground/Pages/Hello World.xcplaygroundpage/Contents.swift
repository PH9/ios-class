//: A swift Tour

// Print Hello World
print("Hello, world!")

//: Simple Values
var distance = 10
distance = 20
let distanceConst = 30

// `error: Cannot assign to value: 'distanceConst' is a 'let'`
//distanceConst = 20


// implicit
let implicitInteger = 10
let imclicitDouble = 10.0


let label = "The width is "
let width = 94
// let withLabel = label + String.init(width)
let withLabel = label + String(width)
print(withLabel)

let apples = 3
let oranges = 5

let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let quotation = """
I said "I have \(apples)."
And then I said "I have \(apples + oranges)
 pieces of fruits."
"""

var shoppingList = [
    "catfish", "water", "tulips", "blue paint"
]

shoppingList[1] = "bottle of water"
print(shoppingList)


var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Machanic",
]

occupations["Jayne"] = "Public Relations"
occupations

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// Explicit style
shoppingList = []
occupations = [:]


//: Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

// Optional Value
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}

// Default value for optional value

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

// Switch

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Eveything tates good in soup.")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]


var largest = Int.min
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0 ..< 4 {
    total += i
}
print(total)

var newTotal = 0
for i in 0...4 {
    newTotal += i
}
print(newTotal)

// Functions
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}

greet(person: "Bob", day: "Thursday")

// Function with ignore and custom label
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

greet("John Doe", on: "Sunday")

// Tuples
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score < min {
            min = score
        } else if score > max {
            max = score
        }

        sum += score
    }

    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.min)
print(statistics.max)
print(statistics.2)

// Nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Function that return another function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }

    return addOne
}

var increment = makeIncrementer()
increment(7)


var numbers3 = [10,20,5]
let a = numbers3.sorted(by: >)
print(a)


