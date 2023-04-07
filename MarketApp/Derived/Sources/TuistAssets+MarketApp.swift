// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum MarketAppAsset {
  public enum Assets {
    public static let abc = MarketAppImages(name: "ABC")
    public static let nike = MarketAppImages(name: "Nike")
    public static let backgroundColor = MarketAppColors(name: "BackgroundColor")
    public static let beige = MarketAppColors(name: "Beige")
    public static let black = MarketAppColors(name: "Black")
    public static let blueGray = MarketAppColors(name: "BlueGray")
    public static let gray = MarketAppColors(name: "Gray")
    public static let lightBlack = MarketAppColors(name: "LightBlack")
    public static let lightGray = MarketAppColors(name: "LightGray")
    public static let mainColor = MarketAppColors(name: "MainColor")
    public static let navy2 = MarketAppColors(name: "Navy2")
    public static let sliver = MarketAppColors(name: "Sliver")
    public static let white = MarketAppColors(name: "White")
    public static let mauve = MarketAppColors(name: "mauve")
    public static let mauve2 = MarketAppColors(name: "mauve2")
    public static let fontColor = MarketAppColors(name: "FontColor")
    public static let secondaryTextColor = MarketAppColors(name: "SecondaryTextColor")
    public static let appIcon = MarketAppImages(name: "appIcon")
    public static let googleLogo = MarketAppImages(name: "google_logo")
    public static let blue = MarketAppImages(name: "blue")
    public static let pink = MarketAppImages(name: "pink")
    public static let shoes = MarketAppImages(name: "shoes")
    public static let yellow = MarketAppImages(name: "yellow")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class MarketAppColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension MarketAppColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: MarketAppColors) {
    let bundle = MarketAppResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: MarketAppColors) {
    let bundle = MarketAppResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct MarketAppImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = MarketAppResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension MarketAppImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the MarketAppImages.image property")
  convenience init?(asset: MarketAppImages) {
    #if os(iOS) || os(tvOS)
    let bundle = MarketAppResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: MarketAppImages) {
    let bundle = MarketAppResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: MarketAppImages, label: Text) {
    let bundle = MarketAppResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: MarketAppImages) {
    let bundle = MarketAppResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
