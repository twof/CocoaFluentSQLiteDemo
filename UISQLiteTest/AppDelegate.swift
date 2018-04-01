//
//  AppDelegate.swift
//  UISQLiteTest
//
//  Created by fnord on 4/1/18.
//  Copyright © 2018 twof. All rights reserved.
//

import Cocoa
import FluentSQLite

//public var db: SQLiteDatabase?

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
//        do {
//            let dbPath = "\(NSHomeDirectory())/test.db"
//            db = try SQLiteDatabase(storage: .file(path: dbPath))
//
//            guard let db = db else { return }
//
//            _ = db
//                .makeConnection(on: MultiThreadedEventLoopGroup(numThreads: 1).next())
//                .map { (conn) in
//                    return User.prepare(on: conn).transform(to: ())
//            }
//        } catch {
//            print(error)
//        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

