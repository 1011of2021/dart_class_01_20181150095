import 'dart:convert';

void main(List<String> arguments) {
  //编解码JSON
  //使用jsonDecode()解码JSON编码的字符串为Dart对象
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';
  var scores = jsonDecode(jsonString);
  assert(scores is List);
  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);

  //使用jsonEncode()编码Dart对象为json格式的字符串
  var scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(scores);
  assert(jsonText ==
    '[{"score":40},{"score":80},'
        '{"score":100,"overtime":true,'
        '"special_guest":null}]');
  
  //编解码UTF-8字符
  //使用 utf8.decode() 解码 UTF8 编码的字符创为 Dart 字符串
  List<int> utf8Bytes = [
    0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
    0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
    0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
    0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
    0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
  ];

  var funnyWord = utf8.decode(utf8Bytes);

  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');
  
  //将 UTF-8 字符串流转换为 Dart 字符串，为 Stream 的 transform() 方法上指定 utf8.decoder
  var lines = utf8.decoder
    .bind(inputStream)
    .transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
  }
    print('file is now closed');
  } catch (e) {
    print(e);
  }

  //使用 utf8.encode() 将 Dart 字符串编码为一个 UTF8 编码的字节流
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');
  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }

  
}