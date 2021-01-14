/*:
 ## Exercise - Extensions

 Define an extension to `Character` that includes a function `isVowel()`. The function returns `true` if the character is a vowel (a, e, i, o, or u), and `false` otherwise. Be sure to properly handle uppercase and lowercase characters.
 */
extension Character {
    
    func isVowel() -> Bool {
        let vowels: [Character] = ["a","e","i","o","u"]
        if vowels.contains(Character(self.lowercased())) {
            return true
        } else {
            return false
        }
    }
}
let character: Character = "Q"
character.isVowel()
/*:
 Create two `Character` constants, `myVowel` and `myConsonant`, and set them to a vowel and a consonant, respectively. Use the `isVowel()` methods on each constant to determine whether it's a vowel.
 */
let myVowel: Character = "A"
let myConsonant: Character = "t"
print(myVowel.isVowel())
print(myConsonant.isVowel())
/*:
 Create a `Rectangle` struct with two variable properties, `length` and `width`, both of type `Double`. Below the definition, write an extension to `Rectangle` that includes a function `half()`. This function returns a new `Rectangle` instance with half the length and half the width of the original rectangle.
 */
struct Rectangle {
    var length: Double
    var width: Double
}

extension Rectangle {
    func half() -> Rectangle {
        return Rectangle(length: self.length / 2, width: self.width / 2)
    }
    mutating func halved() {
        self = half()
    }
}

/*:
 Within the existing `Rectangle` extension, add a new mutating function `halved()` that updates the original rectangle to have half the length and half the width. Use the `half()` function as part of the implementation for `halved()`.
 */
//+

/*:
 Create a variable `Rectangle` called `myRectangle`, and set its length to 10 and its width to 5. Create a second instance, `mySmallerRectangle`, that's the result of calling `half()` on `myRectangle`. Then update the values of `myRectangle` by calling `halved()` on itself. Print each of the instances.
 */
var myRectangle = Rectangle(length: 10, width: 5)
var mySmallerRectangle = myRectangle.half()

myRectangle.halved()
print(myRectangle)

print(mySmallerRectangle)
//: page 1 of 2  |  [Next: App Exercise - Workout Extensions](@next)
