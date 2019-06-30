// Higher order function
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

let numberTimeThree = numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}

print(numberTimeThree)
print(numbers)

let mappedNumbers = numbers.map({ number in
    3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

numbers.sorted()
numbers.sorted(by: >)

numbers.sorted { (left, right) -> Bool in
    return left > right
}

func isOddValue(number: Int) -> Bool {
    return number % 2 != 0
}

print(numbers.map {
    isOddValue(number: $0) ? 0 : $0
})
