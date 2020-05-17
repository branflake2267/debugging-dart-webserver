import 'dart:io';

/// Use a VS Code launcher to launch this
/// OR use dart CLI Run `dart ./lib/server.dart`
main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    handleRequest(request);
  }
}

void handleRequest(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGet(request);
    } else {
       request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${request.method}.')
        ..close();
    }
  } catch (e) {
    print('Exception in handleRequest: $e');
  }
}

void handleGet(HttpRequest request) {
  final uri = request.uri;
  if (uri.path == '/api') {
     request.response
      ..headers.contentType = ContentType.json
      ..write('{ "Message": "The board is green." }')
      ..close();
  } else {
      request.response
      ..headers.contentType = ContentType.text
      ..write('Works...')
      ..close();
  }
}
