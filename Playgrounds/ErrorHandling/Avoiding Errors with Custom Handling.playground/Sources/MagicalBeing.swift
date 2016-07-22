public protocol MagicalBeing: MagicalTutorialObject {
    var name: String? { get set }
    var familiar: Familiar? { get set}
    var spells: [Spell] { get set }
    
    func turnFamiliarIntoToad() throws -> Toad
}
