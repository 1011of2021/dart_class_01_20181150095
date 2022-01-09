
import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  var config = File('config.txt');
  var stringContents = await config.readAsString();
  print(
      'The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');


// Reading a file as binary
// The following code reads an entire file as bytes into a list of ints. 
// The call to readAsBytes() returns a Future, which provides the result when it’s available.

  var config2 = File('config2.txt');

  var contents = await config2.readAsBytes();
  print('The file is ${contents.length} bytes long.');


// Handling errors
// To capture errors so they don’t result in uncaught exceptions, you can register a catchError handler on the Future, or (in an async function) use try-catch:

  var config3 = File('config3.txt');
  try {
    var contents = await config3.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }




  var config4 = File('config4.txt');
  Stream<List<int>> inputStream = config4.openRead();

  var lines2 = utf8.decoder
      .bind(inputStream)
      .transform(const LineSplitter());
  try {
    await for (final line in lines2) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }


var logFile = File('log.txt');
var sink = logFile.openWrite();
sink.write('FILE ACCESSED ${DateTime.now()}\n');
await sink.flush();
await sink.close();


var sink2 = logFile.openWrite(mode: FileMode.append);


  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }






  final requests = await HttpServer.bind('localhost', 8888);
  await for (final request in requests) {

  }


void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server');
  } else {
    response.statusCode = HttpStatus.notFound;
  }
  response.close();
}


  var url = Uri.parse('http://localhost:8888/dart');
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  var data = await utf8.decoder.bind(response).toList();
  print('Response ${response.statusCode}: $data');
  httpClient.close();


}


