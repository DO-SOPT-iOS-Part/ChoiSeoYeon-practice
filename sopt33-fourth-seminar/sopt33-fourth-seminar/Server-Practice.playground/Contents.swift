import Foundation

struct SOPTDataModel: Encodable {
    var name: String
    var age: Int
}

let soptPerson = SOPTDataModel(name: "최서연", age: 23)

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let data = try jsonEncoder.encode(soptPerson)
    print(String(data: data, encoding: .utf8))
} catch {
    print(error)
}

enum SampleError: Error {
    case invalidNumber
    case invalidUser
}

func printNumber(_ number: Int) throws -> Int {
    if number < 0 {
        throw SampleError.invalidNumber
    }
    return number
}

do {
    let resultNumber = try printNumber(-1) // throw한내용을 밑의 catch에서 수행해준다.
    print(resultNumber)
} catch {
    switch error {
    case SampleError.invalidNumber:
        print("invalid number Error")
    case SampleError.invalidUser:
        print("invalid number user")
    default:
        print("unknown error")
    }
}

