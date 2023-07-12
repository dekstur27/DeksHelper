//
//  File.swift
//  
//
//  Created by Ss on 7/12/23.
//

import Foundation

extension DeksHelper.Shell {
    /// Execute shell command using string.
    ///
    /// Reference: https://stackoverflow.com/a/50035059/22212724
    /// - Parameter command: command line input
    /// - Throws: command line error message
    /// - Returns: command line output
//    @discardableResult // Add to suppress warnings when you don't want/need a result
//    func execute(_ command: String) throws -> String {
//        let task = Process()
//        let pipe = Pipe()
//
//        task.standardOutput = pipe
//        task.standardError = pipe
//        task.arguments = ["-c", command]
//        task.executableURL = URL(fileURLWithPath: "/bin/zsh") //<--updated
//        task.standardInput = nil
//
//        try task.run() //<--updated
//
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: .utf8)!
//
//        return output
//    }
}
