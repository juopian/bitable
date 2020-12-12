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

  const Item({Key key, this.width, this.height, this.color, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border(
            right: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white),
          )),
      height: height,
      width: width,
      child: DefaultTextStyle(
        child: child,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const int rows = 30;
const int cols = 15;
const double headerHeight = 40;
const double contentHeight = 40;
const double contentWidth = 60;
const double sideWidth = 100;

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController1;
  ScrollController _scrollController2;
  ScrollController _scrollController3;
  ScrollController _scrollController4;

  int initScroller;
  Widget _header() {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        initScroller = null;
        return true;
      },
      child: Row(
        children: [
          Item(
            color: Colors.blue,
            width: sideWidth,
            height: headerHeight,
            child: Center(child: Text('区域')),
          ),
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
                children: List<int>.generate(cols, (int index) => index)
                    .map((e) => Item(
                          color: Colors.blue,
                          height: headerHeight,
                          width: contentWidth,
                          child: Center(child: Text('col-$e')),
                        ))
                    .toList(),
              ),
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
                  children: List<int>.generate(rows, (int index) => index)
                      .map((e) => Item(
                            color: Colors.orange,
                            width: sideWidth,
                            height: contentHeight,
                            child: Center(child: Text('row-$e')),
                          ))
                      .toList(),
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
                        children: List<int>.generate(rows, (int index) => index)
                            .map((e) => Row(
                                  children: List<int>.generate(
                                          cols, (int index) => index)
                                      .map((e1) => Item(
                                            color: Colors.orange,
                                            height: contentHeight,
                                            width: contentWidth,
                                            child:
                                                Center(child: Text('$e - $e1')),
                                          ))
                                      .toList(),
                                ))
                            .toList(),
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
          SizedBox(height: 400, child: SimpleLineChart.withSampleData()),
          _header(),
          Expanded(child: _body())
        ],
      ),
    );
  }
}
