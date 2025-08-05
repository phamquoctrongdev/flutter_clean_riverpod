# Flutter clean riverpod boilerplate

A lightweight Flutter starter template implementing **Clean architecture** with **Riverpod state management**

## 🎯 Features

- **Architecture**: Clean separation of concerns
- **Riverpod State Management**: Efficient and type-safe state management solution
- **Dark/Light Theme**: Built-in theme support
- **Localization**: Multi-language support
- **Routing**: Declarative routing with go_router

## 📚 Packages & Tools
| Category         | Package                                                                             | Purpose                                                                                                                   |
|------------------|-------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| State Management | [flutter_riverpod](https://pub.dev/packages/riverpod)                               | Reactive state management                                                                                                 |
| Navigation       | [go_router](https://pub.dev/packages/go_router)                                     | Declarative routing                                                                                                       |
| Local storage    | [shared_preferences](https://pub.dev/packages/shared_preferences)                   | Local key-value storage                                                                                                   |
| Network          | [dio](https://pub.dev/packages/dio)                                                 | HTTP client                                                                                                               |
| Localization     | [easy_localization](https://pub.dev/packages/easy_localization)                     | Internationalization                                                                                                      |
| Service locator  | [get_it](https://pub.dev/packages/get_it)                                           | Allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere |
| Utilities        |                                                                                     |                                                                                                                           |
|                  | [build_runner](https://pub.dev/packages/build_runner)                               | A build system for Dart code generation and modular compilation                                                           |
|                  | [freezed](https://pub.dev/packages/freezed)                                         | Code generation for immutable classes                                                                                     |
|                  | [adaptive_dialog](https://pub.dev/packages/adaptive_dialog)                         | Show alert dialog or modal action sheet adaptively according to platform.                                                 |
|                  | [cached_network_image](https://pub.dev/packages/cached_network_image)               | Load and cache network images                                                                                             |
|                  | [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) | Displaying and scheduling local notifications                                                                             |
|                  | [flutter_gen](https://pub.dev/packages/flutter_gen)                                 | Generator for your assets, fonts, colors,                                                                                 |

## 🏗 Project Structure

```
lib/
├── data/              # Contains classes for handling requests, responses, and clients to fetch data from network or local storage.
├── service/           # Contains common services used across the application.
├── presentation/      # Contains feature modules for the app.
│   ├── common/        # Shared components and logic used throughout the app.
│   ├── router/        # Manages navigation between screens in the app.
│   ├── theme/         # Contains settings for the app's appearance and theme.
│   ├── ui/            # Screens and widgets specific to the user interface.
└── service/           # Contains utility functions for common tasks.
```

## 🚀 Getting Started

## 1. All in one terminal: clean, get packages, generate necessary classes/files.
   ```bash
   (fvm) dart run tool/setup.dart
   ```

## 2. Run each command separately:
   ### 🚀 Delete the `build/` and `.dart_tool/` directories.:
   
   ```
   (fvm) flutter clean
   ```
   
   ### 🚀 Get dependencies:
   
   ```
   (fvm) flutter pub get
   ```
   
   ### 🚀 Generate localization files:
   
   ```
   (fvm) dart run easy_localization:generate -S assets/translations & (fvm) dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
   ```
   
   ### 🚀 Generate auto-generated files (such as `*.freezed.dart` , `*.g.dart` ...):
   ```
   (fvm) dart run build_runner build -d
   ```
   
   ### 🚀 Run unit test:
   ```
   (fvm) flutter test
   ```
   
   ### 🚀 Run test coverage and open the report on browser:
   ```
   (fvm) flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
   ```
   ---