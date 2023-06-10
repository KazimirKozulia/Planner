// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Ad {
    public enum Label {
      /// (Могла быть ваша реклама)
      public static let text = L10n.tr("Localizable", "ad.label.text", fallback: "(Могла быть ваша реклама)")
    }
  }
  public enum AddToMap {
    public enum Button {
      /// Перейти на карту
      public static let title = L10n.tr("Localizable", "addToMap.button.title", fallback: "Перейти на карту")
    }
  }
  public enum Alert {
    public enum Cancel {
      /// Отмена
      public static let title = L10n.tr("Localizable", "alert.cancel.title", fallback: "Отмена")
    }
    public enum Continue {
      /// Продолжить
      public static let title = L10n.tr("Localizable", "alert.continue.title", fallback: "Продолжить")
    }
    public enum Create {
      /// Вы хотите создать новый аккаунт
      public static let label = L10n.tr("Localizable", "alert.create.label", fallback: "Вы хотите создать новый аккаунт")
      /// Создать аккаунт
      public static let title = L10n.tr("Localizable", "alert.create.title", fallback: "Создать аккаунт")
    }
  }
  public enum Calendar {
    public enum TabBarItem {
      /// Календарь
      public static let title = L10n.tr("Localizable", "calendar.tabBarItem.title", fallback: "Календарь")
    }
  }
  public enum ConfirmPassword {
    public enum Placeholder {
      /// Повторите пароль
      public static let text = L10n.tr("Localizable", "confirmPassword.placeholder.text", fallback: "Повторите пароль")
    }
  }
  public enum Create {
    public enum Label {
      /// C
      public static let firstLetter = L10n.tr("Localizable", "create.label.firstLetter", fallback: "C")
      /// оздать Новый 
      /// Аккаунт
      public static let halfText = L10n.tr("Localizable", "create.label.halfText", fallback: "оздать Новый \nАккаунт")
    }
  }
  public enum Date {
    public enum Label {
      /// Дата
      public static let text = L10n.tr("Localizable", "date.label.text", fallback: "Дата")
    }
  }
  public enum Email {
    public enum Placeholder {
      /// Введите почту
      public static let text = L10n.tr("Localizable", "email.placeholder.text", fallback: "Введите почту")
    }
  }
  public enum EnterPassword {
    public enum Placeholder {
      /// Введите пароль
      public static let text = L10n.tr("Localizable", "enterPassword.placeholder.text", fallback: "Введите пароль")
    }
  }
  public enum General {
    /// Или
    public static let or = L10n.tr("Localizable", "general.or", fallback: "Или")
  }
  public enum GoToSetting {
    public enum Button {
      /// прейти в настройки и включить геолокацию
      public static let title = L10n.tr("Localizable", "goToSetting.button.title", fallback: "прейти в настройки и включить геолокацию")
    }
  }
  public enum Login {
    public enum Button {
      /// Войти как гость
      public static let title = L10n.tr("Localizable", "login.button.title", fallback: "Войти как гость")
    }
  }
  public enum Logout {
    public enum Button {
      /// Выйти
      public static let title = L10n.tr("Localizable", "logout.button.title", fallback: "Выйти")
    }
  }
  public enum NewNote {
    public enum Label {
      /// Новая Заметка
      public static let text = L10n.tr("Localizable", "newNote.label.text", fallback: "Новая Заметка")
    }
    public enum Vc {
      /// Новая заметка
      public static let title = L10n.tr("Localizable", "newNote.vc.title", fallback: "Новая заметка")
    }
  }
  public enum NoNotesYet {
    public enum Label {
      /// Пока что нету заметок
      public static let text = L10n.tr("Localizable", "noNotesYet.label.text", fallback: "Пока что нету заметок")
    }
  }
  public enum Notes {
    public enum TabBarItem {
      /// Заметки
      public static let title = L10n.tr("Localizable", "notes.tabBarItem.title", fallback: "Заметки")
    }
  }
  public enum Reference {
    public enum Label {
      /// Ссылки:
      public static let text = L10n.tr("Localizable", "reference.label.text", fallback: "Ссылки:")
    }
  }
  public enum Save {
    public enum Button {
      /// Сохранить
      public static let title = L10n.tr("Localizable", "save.button.title", fallback: "Сохранить")
    }
    public enum NavigationItem {
      /// Сохранить
      public static let title = L10n.tr("Localizable", "save.navigationItem.title", fallback: "Сохранить")
    }
  }
  public enum Settings {
    public enum Label {
      /// Н
      public static let firstLetter = L10n.tr("Localizable", "settings.label.firstLetter", fallback: "Н")
      /// астройки
      public static let halfText = L10n.tr("Localizable", "settings.label.halfText", fallback: "астройки")
    }
    public enum TabBarItem {
      /// Настройки
      public static let title = L10n.tr("Localizable", "settings.tabBarItem.title", fallback: "Настройки")
    }
  }
  public enum SignUp {
    public enum Button {
      /// Регистрация
      public static let title = L10n.tr("Localizable", "signUp.button.title", fallback: "Регистрация")
    }
  }
  public enum TextField {
    public enum Placeholder {
      /// Заголовок
      public static let title = L10n.tr("Localizable", "textField.placeholder.title", fallback: "Заголовок")
    }
  }
  public enum Theme {
    public enum Label {
      /// Тема
      public static let text = L10n.tr("Localizable", "theme.label.text", fallback: "Тема")
    }
  }
  public enum Welcome {
    public enum Label {
      /// Localizable.strings
      ///   Project
      /// 
      ///   Created by Ghost on 23.03.23.
      public static let firstLetter = L10n.tr("Localizable", "welcome.label.firstLetter", fallback: "П")
      /// ривет
      public static let halfText = L10n.tr("Localizable", "welcome.label.halfText", fallback: "ривет")
    }
  }
  public enum YourNotes {
    public enum Label {
      /// Ваши Заметки
      public static let text = L10n.tr("Localizable", "yourNotes.label.text", fallback: "Ваши Заметки")
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
