public protocol Familiar: MagicalTutorialObject {
    var noise: String { get }
    var name: String? { get set }
    init()
    init(name: String?)
}

extension Familiar {
    public init(name: String?) {
        self.init()
        self.name = name
    }
    
    public func speak() {
        print(avatar, "* \(noise)s *")
    }
}
