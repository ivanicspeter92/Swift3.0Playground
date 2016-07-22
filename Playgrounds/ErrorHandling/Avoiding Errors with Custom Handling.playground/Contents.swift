/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// ----------------------------------------------------------------------------
// Playground that includes Witches.
//
// These magical beings may be created and may cast spells on each other
// & their familiars (i.e. cats, bats, toads).
// ----------------------------------------------------------------------------

// All objects in this tutorial need an avatar, to make things exciting.
// Source: https://www.raywenderlich.com/130197/magical-error-handling-swift

// ----------------------------------------------------------------------------
// Example Two - Avoiding Errors with Custom Handling - Pyramids of Doom
// ----------------------------------------------------------------------------

func exampleOne() {
    print("") // Add an empty line in the debug area
    
    // 1
    let salem = Cat(name: "Salem Saberhagen")
    salem.speak()
    
    // 2
    let witchOne = Witch(name: "Sabrina", familiar: salem)
    do {
        // 3
        try witchOne.turnFamiliarIntoToad()
    }
        // 4
    catch let error as ChangoSpellError {
        handleSpellError(error: error)
    }
        // 5
    catch {
        print("Something went wrong, are you feeling OK?")
    }
}

func exampleTwo() {
    print("") // Add an empty line in the debug area
    
    let toad = Toad(name: "Mr. Toad")
    toad.speak()
    
    let hat = Hat()
    let witchTwo = Witch(name: "Elphaba", familiar: toad, hat: hat)
    
    let newToad = try? witchTwo.turnFamiliarIntoToad()
    if newToad != nil { // Same logic as: if let _ = newToad
        print("Successfully changed familiar into toad.")
    } else {
        print("Spell failed.")
    }
}

func exampleThree() {
    print("") // Add an empty line in the debug area
    
    let witchThree = Witch(name: "Hermione", familiar: nil, hat: nil)
    witchThree.speak()
}

func handleSpellError(error: ChangoSpellError) {
    let prefix = "Spell Failed."
    switch error {
    case .HatMissingOrNotMagical:
        print("\(prefix) Did you forget your hat, or does it need its batteries charged?")
        
    case .FamiliarAlreadyAToad:
        print("\(prefix) Why are you trying to change a Toad into a Toad?")
        
    default:
        print(prefix)
    }
}

exampleOne()
exampleTwo()
exampleThree()
