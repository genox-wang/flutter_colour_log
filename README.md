# colour_log

## Introduce

A sample logger tool for flutter. support logLevel config and log format. Hope making log colorful and logLevel based callback in the future

## How to Use

add dependence in pubspec.yaml

```
dependencies:
  flutter:
    sdk: flutter

  ...

  colour_log: ^0.2.0

```

```
import "package:colour_log/colour_log.dart"

...

  var log = Logger(); // default log level debug
  log.d("debug");
  log.i("info");
  log.e("warn");
  log.e("error");

  log.logLevel = LogLevel.INFO
  log.d("debug"); // will not show
  log.i("info");
  log.e("warn");
  log.e("error");

```