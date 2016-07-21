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

protocol MagicalTutorialObject {
  var avatar: String { get }
}

enum MagicWords: String {
  case Abracadbra = "abracadabra"
  case Alakazam = "alakazam"
  case HocusPocus = "hocus pocus"
  case PrestoChango = "presto chango"
}

struct Spell: MagicalTutorialObject {
  
  var magicWords: MagicWords = .Abracadbra
  var avatar = "💫"
  
  // If words are considered magical, we can create a spell
  init?(words: String) {
    guard let incantation = MagicWords(rawValue: words) else {
      return nil
    }
    self.magicWords = incantation
  }
  
  init?(magicWords: MagicWords) {
    self.magicWords = magicWords
  }
}


// ----------------------------------------------------------------------------
// Example Two - Avoiding Errors with Custom Handling - Pyramids of Doom
// ----------------------------------------------------------------------------

// Familiars

protocol Familiar: MagicalTutorialObject {
  var noise: String { get }
  var name: String? { get set }
  init()
  init(name: String?)
}

extension Familiar {
  init(name: String?) {
    self.init()
    self.name = name
  }
  func speak() {
    print(avatar, "* \(noise)s *")
  }
}


struct Cat: Familiar {
  var name: String?
  var noise  = "purr"
  var avatar = "🐱"
}

struct Bat: Familiar {
  var name: String?
  var noise = "screech"
  var avatar = "[bat]" // Sadly there is no bat avatar
  func speak() {
    print(avatar, "* \(noise)es *") // Different verb conjugation suffix than the protocol implementation
  }
}

struct Toad: Familiar {
  var name: String?
  var noise  = "croak"
  var avatar = "🐸"
}

// Magical Things

struct Hat {
  enum HatSize {
    case Small
    case Medium
    case Large
  }
  
  enum HatColor {
    case Black
  }
  
  var color: HatColor = .Black
  var size: HatSize = .Medium
  var isMagical = true
}


protocol MagicalBeing: MagicalTutorialObject {
  var name: String? { get set }
  var familiar: Familiar? { get set}
  var spells: [Spell] { get set }
  
  func turnFamiliarIntoToad() -> Toad
}

struct Witch: MagicalBeing {
  var avatar = "👩🏻"
  var name: String?
  var familiar: Familiar?
  var spells: [Spell] = []
  var hat: Hat?
  
  init(name: String?, familiar: Familiar?) {
    self.name = name
    self.familiar = familiar
    
    if let s = Spell(magicWords: .PrestoChango) {
      self.spells = [s]
    }
  }
  
  init(name: String?, familiar: Familiar?, hat: Hat?) {
    self.init(name: name, familiar: familiar)
    self.hat = hat
  }
  
  func turnFamiliarIntoToad() -> Toad {
    if let hat = hat {
      if hat.isMagical { // When have you ever seen a Witch perform a spell without her magical hat on ? :]
        if let familiar = familiar {   // Check if witch has a familiar
          if let toad = familiar as? Toad {  // Check if familiar is already a toad - no magic required
            return toad
          } else {
            if hasSpell(type: .PrestoChango) {
              if let name = familiar.name {
                return Toad(name: name)
              }
            }
          }
        }
      }
    }
    return Toad(name: "New Toad")  // This is an entirely new Toad.
  }
  
  func hasSpell(type: MagicWords) -> Bool { // Check if witch currently has appropriate spell in their spellbook
    return spells.contains { $0.magicWords == type }
  }
}
