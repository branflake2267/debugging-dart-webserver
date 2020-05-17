# debugging-dart-webserver
Debugging a Dart HTTP web server.


## Debugging

* Run `pub get` to initialize the project.

## Debugging with Dart CLI

* Run `dart ./lib/server.dart`

## Debugging with VS Code

* Run the VS Code Launcher `Launch Web Server`



## Init Reference

### Install Dart
The dart tools are required to use this project. 

* [Install Dart](https://dart.dev/get-dart)

### Install VS Code Dart Plugin
Install the Dart VS Code plugin. 

Add the program launcher, to launch the web server.
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Web Server",
      "program": "lib/server.dart",
      "request": "launch",
      "type": "dart"
    }
  ]
}
```

