import Foundation

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105

    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var simpleClass = SimpleClass()
print(simpleClass.simpleDescription)
simpleClass.adjust()
simpleClass.adjust()

print(simpleClass.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var simpleStruct = SimpleStructure()
print(simpleStruct.simpleDescription)
simpleStruct.adjust()
print(simpleStruct.simpleDescription)

enum SimpleEnumerate: ExampleProtocol {
    case haveValue(String)

    var simpleDescription: String {
        switch self {
        case .haveValue(let description):
            return description
        }
    }

    mutating func adjust() {
        switch self {
        case .haveValue:
            self = .haveValue(simpleDescription + " (adjust!)")
        }
    }
}

var simpleEnum = SimpleEnumerate.haveValue("This is a message")
print(simpleEnum.simpleDescription)
simpleEnum.adjust()
print(simpleEnum.simpleDescription)


enum SimpleEnum: ExampleProtocol {
    case base
    case adjusted

    var simpleDescription: String {
        switch self {
        case .base:
            return "This is a message"
        case .adjusted:
            return "This is adjusted message."
        }
    }

    mutating func adjust() {
        self = .adjusted
    }
}

var simpleE = SimpleEnum.base
print(simpleE.simpleDescription)
simpleE.adjust()
print(simpleE.simpleDescription)

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

var seven = 7
print(seven.simpleDescription)
seven.adjust()
print(seven.simpleDescription)

extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "This number is \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}

var d = -52.98
d.adjust()
print(d.absoluteValue)
print(d)

var protocolValues: [ExampleProtocol] = [9, SimpleClass(), SimpleEnum.base]
for v in protocolValues {
    print(v.simpleDescription)
}

for i in 0..<protocolValues.count {
    protocolValues[i].adjust()
}

for v in protocolValues {
    print(v.simpleDescription)
}
