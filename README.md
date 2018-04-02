# CocoaFluentSQLiteDemo

Tutorial followed to get SPM working with a Cocoa app:
https://www.ralfebert.de/ios-examples/xcode/ios-dependency-management-with-swift-package-manager/

The important bit in `ViewController.swift`:
```swift
do {
    let jamie = User(id: nil, name: "Jaimie", age: 20)

    try DatabaseManager.sharedConnection()
        .map { (conn) -> Future<User> in
            return jamie.save(on: conn).map{ (newUser) -> (User) in
                print(newUser)
                return newUser
            }.catch { (err) in
                print(err)
            }
        }.catch({ (err) in
            print(err)
        })
} catch {
    print(error)
}
```

Using FluentSQLite on the client-side over CoreData or Realm is important because it opens up the possibility of keeping models in a package that is shared between both client and server
