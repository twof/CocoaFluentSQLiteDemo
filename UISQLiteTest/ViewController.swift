//
//  ViewController.swift
//  UISQLiteTest
//
//  Created by fnord on 4/1/18.
//  Copyright © 2018 twof. All rights reserved.
//

import Cocoa
import FluentSQLite
import Foundation

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let dbPath = "\(NSHomeDirectory())/test.db"
            let db = try SQLiteDatabase(storage: .file(path: dbPath))
            let jamie = User(id: nil, name: "Jaimie", age: 20)
            
            _ = db
                .makeConnection(on: MultiThreadedEventLoopGroup(numThreads: 1).next())
                .map { (conn) -> Future<User> in
                    _ = User.prepare(on: conn)
                    return jamie.save(on: conn).map{ (newUser) -> (User) in
                        print(newUser)
                        return newUser
                    }.catch { (err) in
                        print(err)
                    }
            }
        } catch {
            print(error)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

