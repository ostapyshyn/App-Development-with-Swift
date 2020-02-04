/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "\(name), \(age)"
    }
    
    static func ==(lhs: Human, rhs: Human) -> Bool {
      return lhs.name == rhs.name && lhs.age ==
      rhs.age
    }
    
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
}

let hum1 = Human(name: "Walter", age: 21)
let hum2 = Human(name: "Petro", age: 31)


/*:
 Make the `Human` class adopt the `CustomStringConvertible`. Print both of your previously initialized `Human` objects.
 */
print(hum1)
print(hum2)


/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
 */
print(hum1 == hum2)
print(hum1 != hum2)

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let hum3 = Human(name: "Ivan", age: 75)
let hum4 = Human(name: "Mykola", age: 45)
let hum5 = Human(name: "Anatoliy", age: 55)

let people: [Human] = [hum1, hum2, hum3, hum4, hum5]
let sortedPeople: [Human] = people.sorted(by:<)

print(sortedPeople)




/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()

if let jsonData = try? jsonEncoder.encode(hum1), let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}
//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
