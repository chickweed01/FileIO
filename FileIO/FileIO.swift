//
//  FileIO.swift
//  FileIO
//
//  Created by SandpiperTechSolutions, LLC on 2/27/19.
//  Copyright © 2019 SandpiperTechSolutions, LLC. All rights reserved.
//

import Foundation

public final class FileIO{
    let name = "FileIO"
    
    public func returnHelloWorld() -> String{
        return "HELLO WORLD!"
    }
    
    public func readFile(fileName:String, fileExtension:String = "txt") throws -> String {
        /* Bundles are read only. You can use Bundle.main.path(forResource: fileName, ofType: "txt")
         to access the file as read-only, but for read-write access you need to copy your document to Documents folder or tmp folder.
         path to file for writing is the "documentsDirectory" */
        
        var content = ""

        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            let fileURL = documentsDirectory.appendingPathComponent("\(fileName).txt")
            do {
                content = try String(contentsOfFile:fileURL.path, encoding: String.Encoding.utf8)
            } catch {
                print("Error reading file: \(error)")
                throw error
            }
        }
        
        return content
    }
    
    public func writeToFile(writeString:String, fileName:String, fileExtension:String = "txt")  throws -> Bool{
        /*
         1) Bundles are read only. You can use Bundle.main.path(forResource: fileName, ofType: "txt") to
         access the file as read-only, but for read-write access you need to copy your document to Documents folder or tmp folder.
         
         2) path to file for writing is the "documentsDirectory" */
    
        var result = false
            
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            let fileURL = documentsDirectory.appendingPathComponent("\(fileName).txt")
            do{
                let fileHandle = try FileHandle(forWritingTo: fileURL)
                
                let data = writeString.data(using: .utf8)
                
                fileHandle.write(data!)
                fileHandle.closeFile()
                
                result = true
            }
            catch{
                print("Error writing to file: \(error)")
                throw error
            }
        }
            
        return result
    }
}
