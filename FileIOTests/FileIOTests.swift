//
//  FileIOTests.swift
//  FileIOTests
//
//  Created by admin on 2/26/19.
//  Copyright © 2019 SandpiperTechSolutions, LLC. All rights reserved.
//

import XCTest
@testable import FileIO

class FileIOTests: XCTestCase {

    var fileIO: FileIO!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fileIO = FileIO()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHelloWorld() {
        XCTAssertEqual(fileIO.returnHelloWorld(), "HELLO WORLD!")
        
    }
    
    func testReadFile(){
        
        var fileContents = ""
        
        do{
            fileContents = try fileIO.readFile(fileName: "helloWorld")
        }
        catch{
            print(error)
        }
        
        XCTAssertTrue(fileContents.count != 0)
    }
    
    func testWriteFile(){
        do{
            let result = try fileIO.writeToFile(writeString: "5\n6\n7\n8\n", fileName: "helloWorld")
            XCTAssertTrue(result == true)
        }
        catch{
            print(error)
        }
    }
}
