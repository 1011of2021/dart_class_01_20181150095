void main(List<String> arguments) {
  //数字
  //类型转换
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  // Convert an int to a string.
  assert(42.toString() == '42');
  // Convert a double to a string.
  assert(123.456.toString() == '123.456');
  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');
  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式
  //在字符串中搜索
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));
  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));
  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));
  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');
  // Split a string using a string pattern.
  var parts = 'structured web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'structured');
  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');
  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
    // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  } 
  // Get all the UTF-16 code units in the string.
  var codeUnitList =
      'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  //首字母大小写转换
  // Convert to uppercase.
  assert('structured web apps'.toUpperCase() ==
    'STRUCTURED WEB APPS');

  // Convert to lowercase.
  assert('STRUCTURED WEB APPS'.toLowerCase() ==
    'structured web apps');

  //替换部分字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting =
    greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
  
  //构建一个字符串
  var sb = StringBuffer();
  sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

  var fullString = sb.toString();

  assert(fullString ==
    'Use a StringBuffer for efficient string creation.');
  
  //集合
  //Lists
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  // Add to a list.
    fruits.add('kiwis');

  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length.
  assert(fruits.length == 5);

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用indexof查找一个对象在list中的下表值
  var fruits1 = ['apples', 'oranges'];

  // Access a list item by index.
  assert(fruits1[0] == 'apples');

  // Find an item in a list.
  assert(fruits1.indexOf('apples') == 0);

  //sort排序
  var fruits2 = ['bananas', 'apples', 'oranges'];

  // Sort a list.
  fruits2.sort((a, b) => a.compareTo(b));
  assert(fruits2[0] == 'apples');

  //set
  //创建集合
  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // You can also create sets using
  // one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);

  //用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中
  var ingredients1 = Set<String>();
  ingredients1.addAll(['gold', 'titanium', 'xenon']);

  // Check whether an item is in the set.
  assert(ingredients1.contains('titanium'));

  // Check whether all the items are in the set.
  assert(ingredients1.containsAll(['titanium', 'xenon']));


  //map
  //map 是一个无序的 key-value （键值对）集合，即 dictionary 或者 hash
  //创建map
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Maps can be built from a constructor.
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  var nobleGases = Map<int, String>();

  //remove方法移除键值对
  var nobleGases1 = {54: 'xenon'};

  // Retrieve a value with a key.
  assert(nobleGases1[54] == 'xenon');

  // Check whether a map contains a key.
  assert(nobleGases1.containsKey(54));

  // Remove a key and its value.
  nobleGases1.remove(54);
  assert(!nobleGases1.containsKey(54));

  //检索map中所有的key
  var hawaiianBeaches1 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches1.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  // (an Iterable of Lists).
  var values = hawaiianBeaches1.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));


  //公共集合方法
  //isempty()与isNotEmpty()
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法
  var teas1 = ['green', 'black', 'chamomile', 'earl grey'];
  teas1.forEach((tea) => print('I drink $tea'));

  //map() 方法，这个方法将所有结果返回到一个对象中
  //var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件
  var teas2 = ['green', 'black', 'chamomile', 'earl grey'];

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) =>
      teaName == 'chamomile';

  // Use where() to find only the items that return true
    // from the provided function.
  var decaffeinatedTeas =
    teas2.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the
    // collection satisfies a condition.
  assert(teas2.any(isDecaffeinated));

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  assert(!teas2.every(isDecaffeinated));

  //URLs
  //编码和解码完整合法的URl
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded ==
    'https://example.org/api?foo=some%20message');

    var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  //编码和解码URL组件
  //使用 encodeComponent() 和 decodeComponent() 方法，对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :
  var uri1 = 'https://example.org/api?foo=some message';

  var encoded1 = Uri.encodeComponent(uri1);
  assert(encoded ==
      'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded1 = Uri.decodeComponent(encoded1);
  assert(uri1 == decoded1);

  //解析 URI
  var uri2 =
    Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri2.scheme == 'https');
  assert(uri2.host == 'example.org');
  assert(uri2.path == '/foo/bar');
  assert(uri2.fragment == 'frag');
  assert(uri2.origin == 'https://example.org:8080');

  //构建URI
  var uri3 = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag');
  assert(
    uri3.toString() == 'https://example.org/foo/bar#frag');

  
  //日期和时间
  //通过DateTime构建
  // Get the current date and time.
  var now = DateTime.now();

  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  // Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000,
    isUtc: true);

  // Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

 
}


