# DeksHelper

A description of this package.

## Samples

Model struct

```swift
struct Developer: Decodable {
    var name: String
    var department: String
}
```

### Sample 1 - Model from Dictionary

```swift
let dict = [
    "name": "deks",
    "department": "tech"
]

let developer: Developer? = try? DeksHelper.Parser.setupModel(collection: dict)

```

### Sample 2 - Model from Array

```swift
let arr = [
    [
        "name": "deks",
        "department": "tech"
    ],
    [
        "name": "omen",
        "department": "tech"
    ],
    [
        "name": "eman",
        "department": "tech"
    ],
    [
        "name": "simon",
        "department": "tech"
    ],
]

let developers: [Developer] = try DeksHelper.Parser.setupModel(collection: arr)

```

### Sample 3 - Model from String Dictionary/Array

```swift
let string = """
{
    "name": "deks",
    "department": "tech"
}
"""

let developer: Developer = try DeksHelper.Parser.setupModel(collection: string)
```

### Sample 4 - Model from JSON/YAML file

JSON

```swift
let models: [Developer] = try DeksHelper.Parser.setupModel(fileName: "developers", type: .json)
```

YAML

```swift
let models: [Developer] = try DeksHelper.Parser.setupModel(fileName: "developers", type: .yaml)
```


## Public Interface

```swift
import Foundation
import Yams

public struct DeksHelper {

    public struct Parser {
    }
}

public extension DeksHelper.Parser {

    public enum ParseError : Error {

        case notExists(fileName: String)

        case general(message: String)
    }

    public enum FileType {

        case json

        case yaml
    }

    public static func setupModel<T>(fileName: String, type: FileType, bundle: Bundle = Bundle.main) throws -> T where T : Decodable

    public static func setupModel<T>(collection: Any) throws -> T where T : Decodable
}

```
