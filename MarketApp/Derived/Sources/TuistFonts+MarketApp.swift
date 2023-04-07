// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum MarketAppFontFamily {
  public enum NanumSquareNeo {
    public static let light = MarketAppFontConvertible(name: "NanumSquareNeoTTF-aLt", family: "NanumSquare Neo", path: "NanumSquareNeo-aLt.ttf")
    public static let regular = MarketAppFontConvertible(name: "NanumSquareNeoTTF-bRg", family: "NanumSquare Neo", path: "NanumSquareNeo-bRg.ttf")
    public static let bold = MarketAppFontConvertible(name: "NanumSquareNeoTTF-cBd", family: "NanumSquare Neo", path: "NanumSquareNeo-cBd.ttf")
    public static let extraBold = MarketAppFontConvertible(name: "NanumSquareNeoTTF-dEb", family: "NanumSquare Neo", path: "NanumSquareNeo-dEb.ttf")
    public static let heavy = MarketAppFontConvertible(name: "NanumSquareNeoTTF-eHv", family: "NanumSquare Neo", path: "NanumSquareNeo-eHv.ttf")
    public static let all: [MarketAppFontConvertible] = [light, regular, bold, extraBold, heavy]
  }
  public static let allCustomFonts: [MarketAppFontConvertible] = [NanumSquareNeo.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct MarketAppFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return Bundle.module.url(forResource: path, withExtension: nil)
  }
}

public extension MarketAppFontConvertible.Font {
  convenience init?(font: MarketAppFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}
// swiftlint:enable all
// swiftformat:enable all
