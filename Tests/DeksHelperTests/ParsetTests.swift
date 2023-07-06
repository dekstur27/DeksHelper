//
//  ParsetTests.swift
//  
//
//  Created by Ss on 7/5/23.
//

import XCTest
import DeksHelper

class ParsetTests: XCTestCase {
    
    let developerJSON = "developer"
    let developerYAML = "developer.yml"
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testParserJSON() throws {
        let models: [Developer] = try DeksHelper.Parser.setupModel(fileName: developerJSON, type: .json, bundle: Bundle.module)

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

        for (index, model) in models.enumerated() {
            let developer = arr[index]
            guard let name = developer["name"],
                  let department = developer["department"] else
                  {
                      XCTFail()
                      return
                  }

            if model.name != name || model.department != department {
                XCTFail()
            }
        }
    }
    // should succeed
    func testParseDictionary() throws {
        let dict = [
            "name": "deks",
            "department": "tech"
        ]
        
        let developer: Developer = try DeksHelper.Parser.setupModel(collection: dict)
        
        if dict["name"] != developer.name || dict["department"] != developer.department {
            XCTFail()
        }
    }
    
    func testParseArray() throws {
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

        
        for (index, model) in developers.enumerated() {
            let developer = arr[index]
            guard let name = developer["name"],
                  let department = developer["department"] else
                  {
                      XCTFail()
                      return
                  }

            if model.name != name || model.department != department {
                XCTFail()
            }
        }
    }

    func testParseStringDictionaryFail() throws {
        let string = """
        {
            "name": "deks",
            "department": "tech"
        }
        """

        do {
            let developer: Developer = try DeksHelper.Parser.setupModel(collection: string)
        } catch let error {
            XCTFail()
        }
    }
    
    func testParseStringArrayFail() throws {
        let string = """
        [
            {
                "name": "deks",
                "department": "tech"
            },
            {
                "name": "omen",
                "department": "tech"
            },
            {
                "name": "eman",
                "department": "tech"
            },
            {
                "name": "simon",
                "department": "tech"
            },
        ]
        """
        
        do {
            let developer: [Developer] = try DeksHelper.Parser.setupModel(collection: string)
        } catch {
            XCTFail()
        }
    }
}
