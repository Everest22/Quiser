import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiser/components/bgfile.dart';
class BrowsingPage extends StatefulWidget {
  const BrowsingPage({Key? key}) : super(key: key);

  @override
  State<BrowsingPage> createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  @override
  final List<String> _listItem = [
    'assets/images/2691.png',
    'assets/images/6879.png',
    'assets/images/17545.png',
    'assets/images/bgforall.png',
    'assets/images/main.png',
    'assets/images/Quiser.png',
    'assets/images/top1.png',
    'assets/images/top2.png',
    'assets/images/bottom1.png',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: CupertinoSearchTextField(
          autofocus: true,
          backgroundColor: Colors.transparent,
        ),
        elevation: 0,
      ),
      body: bgForAll(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("Searchbar"),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: _listItem.map((item) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Container(
                            alignment: Alignment(-0.8,0.5),
                            child: Text("Hello"),
                          ),
                          // child: Transform.translate(
                          //   offset: Offset(50, -50),
                          //   child: Container(
                          //     margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.white
                          //     ),
                          //     child: Icon(Icons.bookmark_border, size: 15,),
                          //   ),
                          // ),
                        ),
                      )).toList(),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
