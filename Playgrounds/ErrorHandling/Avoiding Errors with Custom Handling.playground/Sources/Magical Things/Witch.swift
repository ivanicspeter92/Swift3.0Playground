public struct Witch: MagicalBeing {
    public var avatar = "👩🏻"
    public var name: String?
    public var familiar: Familiar?
    public var spells: [Spell] = []
    public var hat: Hat?
    
    public init(name: String?, familiar: Familiar?) {
        self.name = name
        self.familiar = familiar
        
        if let s = Spell(magicWords: .PrestoChango) {
            self.spells = [s]
        }
    }
    
    public init(name: String?, familiar: Familiar?, hat: Hat?) {
        self.init(name: name, familiar: familiar)
        self.hat = hat
    }
    
    public func turnFamiliarIntoToad() throws -> Toad {
        guard let hat = hat where hat.isMagical else {
            throw ChangoSpellError.HatMissingOrNotMagical
        }
        guard let familiar = familiar else {
            throw ChangoSpellError.NoFamiliar
        }
        if familiar is Toad {
            throw ChangoSpellError.FamiliarAlreadyAToad
        } else {
            guard hasSpell(type: .PrestoChango) else {
                throw ChangoSpellError.SpellNotKnownToWitch
            }
            
            guard let name = familiar.name else {
                let reason = "Familiar doesn’t have a name."
                throw ChangoSpellError.SpellFailed(reason: reason)
            }
            
            return Toad(name: name)
        }
    }
    
    public func hasSpell(type: MagicWords) -> Bool {
        return spells.contains { $0.magicWords == type }
    }
    
    public func speak() {
        defer { // runs after the scope of this function is finished
            print("*cackles*")
        }
        defer { // this will be executed before the defer statement above
            print("*screeches*")
        }
        print("Hello my pretties.")
    }
}
