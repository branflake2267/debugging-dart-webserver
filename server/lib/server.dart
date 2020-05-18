import 'dart:io';

/// Use a VS Code launcher to launch this
/// OR use dart CLI Run `dart ./lib/server.dart`
main() async {
  // Note: Must listen on any IP address
  var server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
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

/// http://localhost:8080 - html response
/// http://localhost:8080/api - html response
/// http://localhost:8080/api/getMessage - json response
void handleGet(HttpRequest request) {
  final uri = request.uri;
  if (uri.path == '/api') {
     request.response
      ..headers.contentType = ContentType.html
      ..write('./api works. Try <a href="/api/getMessage">/api/getMessage</a>')
      ..close();
  } else if (uri.path == '/api/getMessage') {
     request.response
      ..headers.contentType = ContentType.json
      ..write('{ "Message": "The board is green." }')
      ..close();
  } else {
      request.response
      ..headers.contentType = ContentType.html
      ..write('The Dart web server works... Try <a href="./api">Try ./api</a>')
      ..close();
  }
}
