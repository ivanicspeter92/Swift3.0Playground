public struct Bat: Familiar {
    public var name: String?
    public var noise = "screech"
    public var avatar = "[bat]"
    
    public init() {
    }
    
    public func speak() {
        print(avatar, "* \(noise)es *") // Different verb conjugation suffix than the protocol implementation
    }
}
