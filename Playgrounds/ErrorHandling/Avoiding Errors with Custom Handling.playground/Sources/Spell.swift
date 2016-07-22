public struct Spell: MagicalTutorialObject {
    public var magicWords: MagicWords = .Abracadbra
    public var avatar = "💫"
    
    public init?(words: String) {
        guard let incantation = MagicWords(rawValue: words) else {
            return nil
        }
        self.magicWords = incantation
    }
    
    public init?(magicWords: MagicWords) {
        self.magicWords = magicWords
    }
}
