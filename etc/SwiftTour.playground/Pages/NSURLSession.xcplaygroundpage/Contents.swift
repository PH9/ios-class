import Foundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

let url = URL(string: "https://api.opendota.com/api/heroes")!
let session = URLSession.shared

let task = session.dataTask(with: url) { (data, response, error) in
    if let error = error {
        print(error)
    } else if let data = data {
        let text = String(data: data, encoding: .utf8)!
        print(text)
    }
}

print("starting...")
task.resume()

