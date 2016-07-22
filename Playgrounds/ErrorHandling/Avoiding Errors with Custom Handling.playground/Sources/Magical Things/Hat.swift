public struct Hat {
    public enum HatSize {
        case Small
        case Medium
        case Large
    }
    
    public enum HatColor {
        case Black
    }
    
    public var color: HatColor = .Black
    public var size: HatSize = .Medium
    public var isMagical = true
    
    public init() {
    }
}
