//: Enumeration and Structrues

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.rawValue
}

if let convertedRank = Rank(rawValue: 14) {
    fatalError("")
} else {
    print("Yes! It out of range, it should be nil.")
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> Color {
        switch self {
        case .spades, .clubs:
            return .black
        case .diamonds, .hearts:
            return .red
        }
    }

    enum Color: String {
        case red, black
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse: Equatable {
    case success(String)
    case failure((httpStatus: Int, message: String))

    var message: String {
        switch self {
        case .success(let message):
            return message
        case .failure(let error):
            return error.message
        }
    }

    static func == (lhs: ServerResponse, rhs: ServerResponse) -> Bool {
        switch (lhs, rhs) {
        case (let .success(lMessage), let .success(rMessage)):
            return lMessage == rMessage
        case (let .failure(lError), let .failure(rError)):
            return lError.httpStatus == rError.httpStatus
                && lError.message == rError.message
        default:
            return false
        }
    }
}

let success = ServerResponse.success("Updated")
let fails = ServerResponse
    .failure((httpStatus: 500, message: "Internal Server Error"))

switch fails {
case .success(let message):
    print(message)
case .failure(let error):
    print("\(error.httpStatus): \(error.message)")
}

print(fails.message)
print(success.message)

