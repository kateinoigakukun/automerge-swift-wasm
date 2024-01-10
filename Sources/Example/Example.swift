// The Swift Programming Language
// https://docs.swift.org/swift-book
import Automerge

let doc = Document()
let list = try! doc.putObject(obj: ObjId.ROOT, key: "colours", ty: .List)
try! doc.insert(obj: list, index: 0, value: .String("blue"))
try! doc.insert(obj: list, index: 1, value: .String("red"))

let doc2 = doc.fork()
try! doc2.insert(obj: list, index: 0, value: .String("green"))

try! doc.delete(obj: list, index: 0)

try! doc.merge(other: doc2) // `doc` now contains {"colours": ["green", "red"]}

print(try! doc.get(obj: list, index: 0)!) // "green"

