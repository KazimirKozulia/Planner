// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Or {
    public enum Label {
      /// Или
      public static let text = L10n.tr("Localizable", "or.label.text", fallback: "Или")
    }
  }
  public enum SignIn {
    public enum Button {
      /// Войти
      public static let text = L10n.tr("Localizable", "signIn.button.text", fallback: "Войти")
    }
  }
  public enum SignUp {
    public enum Button {
      /// Регистрация
      public static let text = L10n.tr("Localizable", "signUp.button.text", fallback: "Регистрация")
    }
  }
  public enum Welcome {
    public enum Label {
      /// Localizable.strings
      ///   Project
      /// 
      ///   Created by Ghost on 23.03.23.
      public static let text = L10n.tr("Localizable", "welcome.label.text", fallback: "Привет")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
