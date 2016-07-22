public enum ChangoSpellError: ErrorProtocol {
    case HatMissingOrNotMagical
    case NoFamiliar
    case FamiliarAlreadyAToad
    case SpellFailed(reason: String)
    case SpellNotKnownToWitch
}
