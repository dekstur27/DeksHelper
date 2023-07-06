import Foundation
import Yams

public struct DeksHelper {
    public struct Parser {}
}


public extension DeksHelper.Parser {
    
    enum ParseError: Error {
        case notExists(fileName: String)
        case general(message: String)
    }
    
    enum FileType {
        case json
        case yaml
    }
    
    static func setupModel<T>(fileName: String, type: FileType, bundle: Bundle = Bundle.main) throws -> T where T: Decodable {
        
        let data: Data
        
        switch type {
        case .json:
            data = try dataFrom(json: fileName, bundle: bundle)
            return try JSONDecoder().decode(T.self, from: data)
        case .yaml:
            data = try dataFrom(yaml: fileName, bundle: bundle)
            return try YAMLDecoder().decode(T.self, from: data)
        }
    }
    
    static func setupModel<T>(collection: Any) throws -> T where T: Decodable {
        
        let data: Data
        
        if let _ = collection as? Dictionary<AnyHashable, Any> {
            data = try JSONSerialization.data(withJSONObject: collection, options: .fragmentsAllowed)
        } else if let _ = collection as? Array<Any> {
            data = try JSONSerialization.data(withJSONObject: collection, options: .fragmentsAllowed)
        } else if let string = collection as? String {
            if let stringData = string.data(using: .utf8, allowLossyConversion: false) {
                data = stringData
            } else {
                throw ParseError.general(message: "Unable to encode string using UTF8: \(string)")
            }
        } else {
            throw ParseError.general(message: "Is not a collection: \(collection)")
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    }
    
    private static func dataFrom(json: String, bundle: Bundle) throws -> Data {
        
        guard let url = bundle.url(forResource: json, withExtension: "json") else {
            throw ParseError.notExists(fileName: json)
        }

        return try Data(contentsOf: url)
    }
    
    private static func dataFrom(yaml: String, bundle: Bundle) throws -> Data {
        
        guard let url = bundle.url(forResource: yaml, withExtension: "yaml") else {
            throw ParseError.notExists(fileName: yaml)
        }

        return try Data(contentsOf: url)
    }
}



