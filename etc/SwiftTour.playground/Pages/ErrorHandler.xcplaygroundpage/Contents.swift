//: Errro Handler

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

enum OtherError: Error {
    case indexOutOfBounds
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if job < 1 {
        throw OtherError.indexOutOfBounds
    }

    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }

    if printerName == "ON FIRE!!!!" {
        throw PrinterError.onFire
    }

    if printerName == "No paper printer" {
        throw PrinterError.outOfPaper
    }

    return "Job sent"
}

do {
    let printerResponse = try send(job: 1099, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1100, toPrinter: "Gutenberge")
    print("\(#file): \(#line) ->", printerResponse)
} catch PrinterError.onFire {
    print("\(#file): \(#line) ->", "I'll just put this over here with the rest of the fire.")
} catch let printerError as PrinterError {
    print("\(#file): \(#line) ->", "Printer error: \(printerError).")
} catch {
    print("\(#file): \(#line) ->", error)
}

do {
    let printerResponse = try send(job: 1101, toPrinter: "ON FIRE!!!!")
    print("\(#file): \(#line) ->", printerResponse)
} catch PrinterError.onFire {
    print("\(#file): \(#line) ->", "I'll just put this over here with the rest of the fire.")
} catch let printerError as PrinterError {
    print("\(#file): \(#line) ->", "Printer error: \(printerError).")
} catch {
    print("\(#file): \(#line) ->", error)
}

do {
    let printerResponse = try send(job: 1102, toPrinter: "No paper printer")
    print("\(#file): \(#line) ->", printerResponse)
} catch PrinterError.onFire {
    print("\(#file): \(#line) ->", "I'll just put this over here with the rest of the fire.")
} catch let printerError as PrinterError {
    print("\(#file): \(#line) ->", "Printer error: \(printerError).")
} catch {
    print("\(#file): \(#line) ->", error)
}

do {
    let printerResponse = try send(job: 0, toPrinter: "ON FIRE!!!!")
    print("\(#file): \(#line) ->", printerResponse)
} catch PrinterError.onFire {
    print("\(#file): \(#line) ->", "I'll just put this over here with the rest of the fire.")
} catch let printerError as PrinterError {
    print("\(#file): \(#line) ->", "Printer error: \(printerError).")
} catch {
    print("\(#file): \(#line) ->", error)
}

let printerSuccess = try? send(job: 1103, toPrinter: "Never broken")
print(printerSuccess)
let printerFailure = try? send(job: 1104, toPrinter: "Never Has Toner")
print(printerFailure)
