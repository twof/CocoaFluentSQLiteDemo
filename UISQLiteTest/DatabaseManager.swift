import FluentSQLite
import Cocoa

struct DatabaseManager {
    public static func sharedConnection() throws -> Future<SQLiteConnection> {
        let dbPath = "\(NSHomeDirectory())/test.db"
        print(dbPath)
        let db = try SQLiteDatabase(storage: .file(path: dbPath))

        return db
            .makeConnection(on: MultiThreadedEventLoopGroup(numThreads: 1).next())
            .flatMap(to: SQLiteConnection.self) { (conn) in
                let defaults = UserDefaults.standard
                
                if !defaults.bool(forKey: "UserMigrated") {
                    return User.prepare(on: conn).do {
                        defaults.set(true, forKey: "UserMigrated")
                    }.transform(to: conn)
                } else {
                    return Future.map(on: conn) {()}.transform(to: conn)
                }
        }
    }
}
