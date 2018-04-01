import FluentSQLite

public struct User: SQLiteModel, Migration {
    public var id: Int?
    public var name: String
    public var age: Int
}
