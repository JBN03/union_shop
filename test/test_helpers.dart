import 'dart:async';
import 'dart:convert';
import 'dart:io';

class _FakeHttpClientRequest implements HttpClientRequest {
  @override
  final Uri uri;
  final _controller = StreamController<List<int>>();
  _FakeHttpClientRequest(this.uri);

  @override
  Encoding get encoding => utf8;

  @override
  set encoding(Encoding _){ }

  @override
  void abort([Object? exception, StackTrace? stackTrace]) {}

  @override
  void add(List<int> data) {}

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future addStream(Stream<List<int>> stream) => stream.pipe(_controller.sink);

  @override
  Future<HttpClientResponse> close() async {
    // Return a tiny 1x1 transparent PNG
    final png = base64Decode(
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=');
    _controller.add(png);
    await _controller.close();
    return _FakeHttpClientResponse(png.length);
  }

  @override
  HttpConnectionInfo? get connectionInfo => null;

  @override
  Future flush() => Future.value();

  @override
  HttpHeaders get headers => _FakeHttpHeaders();

  @override
  int get contentLength => 0;

  @override
  set contentLength(int _){ }

  // Unused members
  @override noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpClientResponse extends Stream<List<int>> implements HttpClientResponse {
  final int _length;
  _FakeHttpClientResponse(this._length);

  @override
  int get statusCode => 200;

  @override
  HttpHeaders get headers => _FakeHttpHeaders();

  @override
  X509Certificate? get certificate => null;

  @override
  int get contentLength => _length;

  @override
  StreamSubscription<List<int>> listen(void Function(List<int>)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    // Provide the 1x1 PNG bytes when listened
    final png = base64Decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=');
    final controller = StreamController<List<int>>();
    controller.add(png);
    controller.close();
    return controller.stream.listen(onData as void Function(List<int>), onError: onError as void Function(Object, StackTrace)?, onDone: onDone, cancelOnError: cancelOnError);
  }

  // Unused members
  @override noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpHeaders implements HttpHeaders {
  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {}

  @override
  void clear() {}

  @override
  void forEach(void Function(String name, List<String> values) action) {}

  @override
  List<String>? operator [](String name) => null;

  // Unused members
  @override noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpClient implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) async => _FakeHttpClientRequest(url);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async => _FakeHttpClientRequest(url);

  // Unused members
  @override noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _FakeHttpClient();
  }
}

void installTestHttpOverrides() {
  HttpOverrides.global = TestHttpOverrides();
}
