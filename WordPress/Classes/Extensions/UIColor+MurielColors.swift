/// Generates the names of the named colors in the ColorPalette.xcasset
enum MurielColorName: String, CustomStringConvertible {
    // MARK: - Base colors
    case blue
    case celadon
    case gray
    case green
    case hotBlue = "Hot-Blue"
    case hotGreen = "Hot-Green"
    case hotOrange = "Hot-Orange"
    case hotPink = "Hot-Pink"
    case hotPurple = "Hot-Purple"
    case hotRed = "Hot-Red"
    case hotYellow = "Hot-Yellow"
    case jetpackGreen = "Jetpack-Green"
    case orange
    case pink
    case purple
    case red
    case wooPurple = "Woo-Purple"
    case yellow

    var description: String {
        return rawValue.capitalized
    }
}

/// Value of a Muriel color's shade
///
/// Note: There are a finite number of acceptable values. Not just any Int works.
///       Also, enum cases cannot begin with a number, thus the `shade` prefix.
enum MurielColorShade: Int, CustomStringConvertible {
    case shade0 = 0
    case shade50 = 50
    case shade100 = 100
    case shade200 = 200
    case shade300 = 300
    case shade400 = 400
    case shade500 = 500
    case shade600 = 600
    case shade700 = 700
    case shade800 = 800
    case shade900 = 900

    var description: String {
        return "\(rawValue)"
    }
}

struct MurielColorIdentifier {
    let name: MurielColorName
    let shade: MurielColorShade

    init(name: MurielColorName, shade: MurielColorShade = .shade500) {
        self.name = name
        self.shade = shade
    }

    init(from identifier: MurielColorIdentifier, shade: MurielColorShade) {
        self.name = identifier.name
        self.shade = shade
    }

    // MARK: - Muriel's semantic colors
    static let accent = MurielColorIdentifier(name: .hotPink)
    static let divider = MurielColorIdentifier(name: .gray, shade: .shade50)
    static let error = MurielColorIdentifier(name: .hotRed)
    static let neutral = MurielColorIdentifier(name: .gray)
    static let primary = MurielColorIdentifier(name: .blue)
    static let success = MurielColorIdentifier(name: .green)
    static let text = MurielColorIdentifier(name: .gray, shade: .shade800)
    static let textSubtle = MurielColorIdentifier(name: .gray, shade: .shade500)
    static let warning = MurielColorIdentifier(name: .hotYellow)

    // MARK: - Additional iOS semantic colors
    static let navigationBar = MurielColorIdentifier(name: .blue)
    static let navigationBarShadow = MurielColorIdentifier(name: .blue, shade: .shade800)

    /// The full name of the color, with required shade value
    func assetName() -> String {
        return "\(name)-\(shade)"
    }
}

extension UIColor {
    /// Get a UIColor from the Muriel color palette
    ///
    /// - Parameters:
    ///   - color: an instance of a MurielColorIdentifier
    ///   - shade: an optional shade value
    /// - Returns: UIColor. Red in cases of error
    class func muriel(color colorID: MurielColorIdentifier) -> UIColor {
        let assetName = colorID.assetName()
        guard let color = UIColor(named: assetName) else {
            return .red
        }
        return color
    }

    /// Muriel accent color
    static var accent = muriel(color: .accent)
    class func accent(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .accent, shade: shade))
    }

    /// Muriel divider color
    static var divider = muriel(color: .divider)

    /// Muriel error color
    static var error = muriel(color: .error)
    class func error(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .error, shade: shade))
    }

    /// Muriel neutral color
    static var neutral = muriel(color: .neutral)
    class func neutral(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .neutral, shade: shade))
    }

    /// Muriel primary color
    static var primary = muriel(color: .primary)
    class func primary(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .primary, shade: shade))
    }

    /// Muriel success color
    static var success = muriel(color: .success)
    class func success(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .success, shade: shade))
    }

    /// Muriel text color
    static var text = muriel(color: .text)

    /// Muriel text subtle color
    static var textSubtle = muriel(color: .textSubtle)

    /// Muriel warning color
    static var warning = muriel(color: .warning)
    class func warning(shade: MurielColorShade) -> UIColor {
        return muriel(color: MurielColorIdentifier(from: .warning, shade: shade))
    }

    /// Muriel/iOS navigation color
    static var navigationBar = muriel(color: .navigationBar)

    /// Muriel/iOS navgiation shadow color
    static var navigationBarShadow = muriel(color: .navigationBarShadow)
}
