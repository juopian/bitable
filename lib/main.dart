import 'package:flutter/material.dart';
import 'package:two_dire_table/line_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class Item extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final Function onTap;
  final Color fontColor;
  final double fontSize;
  final Color borderColor;

  const Item(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.child,
      this.onTap,
        this.fontSize = 16.0,
      this.fontColor = Colors.white,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border(
            right: BorderSide(color: borderColor),
            bottom: BorderSide(color: borderColor),
          )),
      height: height,
      width: width,
      child: DefaultTextStyle(
        child: child,
        style: TextStyle(color: fontColor,fontSize: fontSize),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const int rows = 30;
const int cols = 10;
const double headerHeight = 40;
const double contentHeight = 40;
const double contentWidth = 80;
const double sideWidth = 80;

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController1;
  ScrollController _scrollController2;
  ScrollController _scrollController3;
  ScrollController _scrollController4;

  int initScroller;
  int headerLevel = 3;

  /*
  header data struct
   */
  Map<String, String> headerData = {
    "act1": '区域 月度',
    "act2": '区域 季度',
    "col1": '总计',
    "col2": '全省 深圳 罗湖',
    "col3": '全省 深圳 宝安',
    "col4": '全省 广州 天河',
    "col5": '全省 广州 海珠',
    "col6": '全省 广州 番禺',
    "col7": '广州 荔湾',
    "col8": '天河 营服1',
    "col9": '天河 营服2',
    "col10": '全省 广州 萝岗',
  };

  List<Map<String, dynamic>> mainData = [
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 1
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '3',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 2
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '4',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 3
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 4
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 5
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 6
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 7
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 8
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 9
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 10
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 11
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 12
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 13
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 14
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 15
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 16
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 17
    },
    {
      "act1": '100',
      "act2": '200',
      "col1": '1',
      "col2": '2',
      "col3": '3',
      "col4": '4',
      "col5": '5',
      "col6": '6',
      "col7": '7',
      "col8": '8',
      "col9": '9',
      "col10": '10',
      "order_id": 18
    },
  ];

  Widget _slot(List<Map<String, String>> d) {
    /*
     d like
     [{col2: 全省 深圳 罗湖},
      {col3: 全省 深圳 宝安},
      {col4: 全省 广州 天河},
      {col5: 全省 广州 海珠},
      {col6: 全省 广州 番禺}]
     */
    List<Widget> children = [];
    int level = 0;
    int maxLevel = d.first.values.first.split(' ').length;
    String lastValue;
    while (level < maxLevel) {
      List<Widget> levelRow = [];
      List<String> inner = [];
      lastValue = null;
      d.forEach((Map<String, String> element) {
        String loopTitle = element.values.first.split(' ')[level];
        if (lastValue != loopTitle) {
          if (inner.length > 0) {
            levelRow.add(Item(
              color: Colors.blue,
              height: headerHeight *
                  (level == 0 ? (headerLevel - maxLevel + 1) : 1),
              width: contentWidth * inner.length,
              child: Center(child: Text(lastValue)),
              onTap: () {
                print('maxLevel is $maxLevel, level is $level');
                if (maxLevel == level + 1) {
                  print('sort by ${element.keys.first}');
                }
              },
            ));
            inner = [loopTitle];
          } else {
            inner.add(loopTitle);
          }
          lastValue = loopTitle;
        } else {
          inner.add(loopTitle);
        }
      });

      if (inner.length > 0) {
        levelRow.add(Item(
          color: Colors.blue,
          height:
              headerHeight * (level == 0 ? (headerLevel - maxLevel + 1) : 1),
          width: contentWidth * inner.length,
          child: Center(child: Text(lastValue)),
          onTap: () {
            if (maxLevel == level + 1) {
              //print('sort by ${element.keys.first}');
            }
          },
        ));
      }

      children.add(Row(
        children: levelRow,
      ));

      level++;
    }

    return Column(
      children: children,
    );
  }

  Widget _header() {
    List<String> sideKeys = headerData.keys.toList();

    List<List<Map<String, String>>> leftSide = [];
    List<List<Map<String, String>>> rightSide = [];
    String lastTopLevelTitle;
    headerData.forEach((key, value) {
      String t = value.split(' ').first;
      RegExp r = new RegExp(r'^(act|dim)');
      if (lastTopLevelTitle != t) {
        if (key.startsWith(r)) {
          leftSide.add([
            {key: value}
          ]);
        } else {
          rightSide.add([
            {key: value}
          ]);
        }
        lastTopLevelTitle = t;
      } else {
        if (key.startsWith(r)) {
          leftSide.last.add({key: value});
        } else {
          rightSide.last.add({key: value});
        }
      }
    });
    print('left is $leftSide, right is $rightSide');
    _slot(rightSide[4]);
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        initScroller = null;
        return true;
      },
      child: Row(
        children: [
          Row(
            children: leftSide.map((e) => _slot(e)).toList(),
          ),
//          Item(
//            color: Colors.blue,
//            width: sideWidth,
//            height: headerHeight * maxLevel,
//            child: Center(child: Text('区域')),
//          ),
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > contentWidth * cols)
              return Row(
                children: List<int>.generate(cols, (int index) => index)
                    .map((e) => Item(
                          color: Colors.blue,
                          height: headerHeight,
                          width: constraints.maxWidth / cols,
                          child: Center(child: Text('col-$e')),
                        ))
                    .toList(),
              );
            return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                controller: _scrollController1,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: rightSide.map((e) => _slot(e)).toList(),
                )
//              Row(
//                children: List<int>.generate(cols, (int index) => index)
//                    .map((e) => Item(
//                          color: Colors.blue,
//                          height: headerHeight,
//                          width: contentWidth,
//                          child: Center(child: Text('col-$e')),
//                        ))
//                    .toList(),
//              ),
                );
          }))
        ],
      ),
    );
  }

  Widget _body() {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        initScroller = null;
        return true;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              //print(constraints.maxHeight);
              return SingleChildScrollView(
                controller: _scrollController2,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                    children: mainData.asMap().entries.map((e) {
                  return Row(
                    children: ['act1', 'act2']
                        .map((col) => Item(
                              color: e.key % 2 == 0
                                  ? Colors.white
                                  : Color(0xfff1f1f1),
                              width: sideWidth,
                              height: contentHeight,
                              fontColor: Colors.black,
                              borderColor: e.key % 2 == 0
                                  ? Color(0xfff1f1f1)
                                  : Colors.white,
                              child: Center(child: Text(e.value[col])),
                            ))
                        .toList(),
                  );
                }).toList()
//                    List<int>.generate(rows, (int index) => index)
//                      .map((e) => Item(
//                            color: Colors.orange,
//                            width: sideWidth,
//                            height: contentHeight,
//                            child: Center(child: Text('row-$e')),
//                          ))
//                      .toList(),
                    ),
              );
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > contentWidth * cols)
                  return SingleChildScrollView(
                      controller: _scrollController3,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List<int>.generate(rows, (int index) => index)
                            .map((e) => Row(
                                  children: List<int>.generate(
                                          cols, (int index) => index)
                                      .map((e1) => Item(
                                            color: Colors.orange,
                                            height: contentHeight,
                                            width: constraints.maxWidth / cols,
                                            child:
                                                Center(child: Text('$e - $e1')),
                                          ))
                                      .toList(),
                                ))
                            .toList(),
                      ));
                return SingleChildScrollView(
                  controller: _scrollController4,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      controller: _scrollController3,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children: mainData.asMap().entries.map((e) {
                        return Row(
                          children: [
                            'col1',
                            'col2',
                            'col3',
                            'col4',
                            'col5',
                            'col6',
                            'col7',
                            'col8',
                            'col9',
                            'col10',
                          ]
                              .map((col) => Item(
                                    color: e.key % 2 == 0
                                        ? Colors.white
                                        : Color(0xfff1f1f1),
                                    width: sideWidth,
                                    height: contentHeight,
                                    fontColor: Colors.black,
                                    borderColor: e.key % 2 == 0
                                        ? Color(0xfff1f1f1)
                                        : Colors.white,
                                    child: Center(child: Text(e.value[col])),
                                  ))
                              .toList(),
                        );
                      }).toList()
//                        List<int>.generate(rows, (int index) => index)
//                            .map((e) => Row(
//                                  children: List<int>.generate(
//                                          cols, (int index) => index)
//                                      .map((e1) => Item(
//                                            color: Colors.orange,
//                                            height: contentHeight,
//                                            width: contentWidth,
//                                            child:
//                                                Center(child: Text('$e - $e1')),
//                                          ))
//                                      .toList(),
//                                ))
//                            .toList(),
                          )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController1 = ScrollController()
      ..addListener(() {
        if (initScroller == 4) return;
        initScroller = 1;
        _scrollController4.jumpTo(_scrollController1.offset);
      });
    _scrollController2 = ScrollController()
      ..addListener(() {
        if (initScroller == 3) return;
        initScroller = 2;
        _scrollController3.jumpTo(_scrollController2.offset);
      });
    _scrollController3 = ScrollController()
      ..addListener(() {
        if (initScroller == 2) return;
        initScroller = 3;
        _scrollController2.jumpTo(_scrollController3.offset);
      });
    _scrollController4 = ScrollController()
      ..addListener(() {
        if (initScroller == 1) return;
        initScroller = 4;
        _scrollController1.jumpTo(_scrollController4.offset);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('table'),
        elevation: 1,
      ),
      body: Column(
        children: [
          MediaQuery.of(context).orientation == Orientation.portrait
              ? SizedBox(height: 300, child: SimpleLineChart.withSampleData())
              : Container(),
          _header(),
          Expanded(child: _body())
        ],
      ),
    );
  }
}
