# pokedex

App to simulate a Pokedex

### :star: Compilação Bundle release da loja android

```sh
    flutter build appbundle
```

### :star2: Compilação APK release com ofuscação de codigo

```sh
    flutter build apk --split-per-abi
```

## :gear: Flutter Setup
```sh
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build
    flutter run
```

## :bulb: Caso algo não estiver funcionando adequadamente
```sh
    flutter clean
    rm -rf pubspec.lock
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run
```

### :star: Executar os testes

```sh
    flutter test test/folder/file_name.dart
    flutter test test/folder/
    flutter test test/
```
