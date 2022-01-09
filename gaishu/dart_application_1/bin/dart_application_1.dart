//dart 开发语言概览

void printInteger(int anumber){
  print('the number is $anumber');
}

int countLines(){
  var t=10;
  return t;
}
 class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

 //参数设置
 String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

 var nobleNames = Map<int, String>();

 //箭头函数
  bool isNobel(int atomicNumber) => nobleNames[atomicNumber] != null;

  // A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

Future<String> lookUpVersion() async => '1.0.0';

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

class WannabeFunction {//call方法
  String call(String a, String b, String c) => '$a $b $c!';
}

void main(){
  //变量与关键字
  var number=42;
  printInteger(number);
  // 延迟赋值
  late String description;
  description='milk way';
  print(description);
  // 常量final与const
  final name='vincent';
  const bar =10000;
  const double atm=1.33432*bar;
  


  // 内置类型 int double 数串转换
  var one = int.parse('1');
  assert(one==1);
  var onePointOne=double.parse('1.1');
  assert(onePointOne==1.1);
  String oneAsString = 1.toString();
  assert(oneAsString=='1');
  String piAsString=3.14159.toStringAsFixed(2);
  assert(piAsString=='3.14');
  // 内置类型 字符串
  var s2="All the monments would be lost in time";
  print(s2);
  var s='string interpolation';
  assert('Dart has $s,which is so handy.'== 'Dart has $s,'
  'which is so handy.');
  // 内置类型 List
  var transportation=['Car','Boat','Plane'];
  var list=[1,2,3];
  assert(list.length==3);
  assert(list[1]==2);
  var list2=[0,...list];
  assert(list2.length ==4);
  var listOfInts=[1,2,3];
  var listOfString = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  assert(listOfString[1]=='#1');
  //内置类型 set
  var halogens={'fluorine','chlorine','bromine','iodine','astatine'};
  var elements = <String>{}; //create empty set
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);
  //内置类型 maps
  //使用构造器
  var gifts = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  assert(gifts['first'] == 'partridge');
  var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // 函数与流程控制语句
  int lineCount;
  if(number==42){
    lineCount=countLines();
  }
  else{
    lineCount=0;
  }
  print(lineCount);
  
  print(name+'$atm');
 //箭头函数
  int t=1;
  nobleNames[1]='A';
  nobleNames[2]='B';
  nobleNames[3]='C';
  if(isNobel(t)) print("$t is nobel");
  // 匿名函数
  var list3 = ['apples', 'bananas', 'oranges'];
  list3.forEach((item) {
  print('${list3.indexOf(item)}: $item');
  });

  // 运算符
  assert((3<<1)==6);
  assert((3|4)==7);
  assert((3 & 4)==0);
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int除并取整
  assert(5 % 2 == 1); // Remainder
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
  int a;
  int b;
  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1
  a = 0;
  b = a++; // Increment a AFTER b gets its value.
  assert(a != b); // 1 != 0
  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1
  a = 0;
  b = a--; // Decrement a AFTER b gets its value.
  assert(a != b); // -1 != 0
  
  //默认可选参数，required表必须关键字
 assert(say('Bob', 'Howdy', 'smoke signal') =='Bob says Howdy with a smoke signal');
 
 

  //流程控制语句 for-in
  var candidates=[1,11,3,5];
  for (var candidate in candidates) {
    print(candidate);
  }

  //异常
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }

 //类 实例变量
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
 //类 接口实现
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));


 //泛型（抽象类）List、set、map
 //abstract class Cache<T> {
 //T getByKey(String key);
 //void setByKey(String key, T value);
 //}

 //库与可见性
  //import 'dart:html'
  //import 'package:test/test.dart';导入格式路径也可用文件系统路径
  //延迟加载库
  //import 'package:greetings/hello.dart' deferred as hello;
  //异步
  Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
  }

  //生成器
  //同步生成器
  //Iterable<int> naturalsTo(int n) sync* {
  //int k = 0;
  //while (k < n) yield k++;
//}
  //异步生成器
  //Stream<int> asynchronousNaturalsTo(int n) async* {
  //int k = 0;
  //while (k < n) yield k++;
//}

  //可调用类
  var wf = WannabeFunction();
  var out = wf('Hi', 'there,', 'gang');
  print(out);

  //隔离区

  //typedef
  //typedef IntList = List<int>;
  //IntList il = [1, 2, 3];

  //元数据
  doSomething();

  //注释
  //单行注释 '//'
  //多行注释 '/* */'
  //文档注释 '///'
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}
