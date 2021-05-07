import 'package:flutter/material.dart';
import 'package:phone_auth_project/custom_icon.dart';
import 'package:get/get.dart';
import 'package:phone_auth_project/screens/package_info.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/controller.dart';

class Packagelist extends StatefulWidget {
  Packagelist({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Packagelist createState() => _Packagelist();
}

class _Packagelist extends State<Packagelist> {
  @override
  Widget build(BuildContext context) {
    final PackageController nc = Get.put(PackageController());
    Widget getPackageList({delivery_color, delivery_status}) {
      return Obx(
        () => nc.packages.length == 0
            ? Center(
                child: Image.asset('assets/lists.png'),
              )
            : ListView.builder(
                itemCount: nc.packages.length,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.fromLTRB(1, 0, 3, 16),
                      child: Container(
                          child: ExpansionPanelList(
                        expansionCallback: (_, bool isExpanded) {
                          print(index);

                          setState(() {
                            nc.packages[index].isExpanded =
                                !nc.packages[index].isExpanded;
                          });
                        },
                        children: <ExpansionPanel>[
                          ExpansionPanel(
                            backgroundColor: HexColor('#F8F8FA'),
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                  title: Container(
                                      child: Text(
                                          '# ' + nc.packages[index].title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700))),
                                  subtitle: Container(
                                      decoration: BoxDecoration(
                                          color: delivery_color,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 2, 10, 2),
                                      margin: EdgeInsets.fromLTRB(0, 7, 110, 0),
                                      child: Text(
                                        delivery_status,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )));
                            },
                            isExpanded: nc.packages[index].isExpanded,
                            body: Container(
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 2,
                                                color: HexColor('#D0D0D2')))),
                                    child: ListTile(
                                        title: Container(
                                            child: Text(
                                                nc.packages[index].name +
                                                    ' ' +
                                                    nc.packages[index].surname,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700))),
                                        subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 7, 0, 0),
                                                  child: Text(
                                                      nc.packages[index]
                                                          .adress_1,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500))),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 3, 0, 0),
                                                  child: Text(
                                                      nc.packages[index].city,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500))),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 3, 0, 0),
                                                  child: Text(
                                                      nc.packages[index].phone,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500))),
                                            ]),
                                        trailing: Wrap(
                                            direction: Axis.vertical,
                                            children: <Widget>[
                                              IconButton(
                                                  icon: Icon(CustomIcon.edit),
                                                  onPressed: () => Get.to(() =>
                                                      MyPackage(index: index))),
                                              IconButton(
                                                  icon: Icon(
                                                    CustomIcon.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    nc.packages.removeAt(index);
                                                  })
                                            ])))),
                          ),
                        ],
                      )),
                    )),
      );
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(
                  'Packages',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                )),
            bottom: PreferredSize(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 16),
                  height: 39,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      border: Border.all(color: Colors.blue, width: 3)),
                  child: TabBar(
                    // controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    //
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.0,
                      ),
                      color: Colors.blue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.blue,
                    tabs: [
                      Tab(
                          child: Text('Active',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w400))),
                      Tab(
                        child: Text('Closed',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(70)),
          ),
          body: Container(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // give the tab bar a height [can change hheight to preferred height]
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    // controller: _tabController,
                    children: [
                      // first tab bar view widget
                      Center(
                          child: Padding(
                              padding: EdgeInsets.all(3),
                              child: getPackageList(
                                  delivery_color: Colors.green,
                                  delivery_status: 'Delivered to point'))),

                      // second tab bar view widget
                      Center(
                          child: Padding(
                              padding: EdgeInsets.all(3),
                              child: getPackageList(
                                  delivery_color: Colors.blue[400],
                                  delivery_status: 'Picked up by cusromer'))),
                    ],
                  ),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 0, blurRadius: 15),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  currentIndex: 1,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('#F8F8FA'),
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  elevation: 100,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Container(child: Icon(CustomIcon.map)),
                        title: Text('Map')),
                    BottomNavigationBarItem(
                        icon: Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Icon(CustomIcon.my_packages)),
                        title: Text('My packages')),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcon.my_code), title: Text('My code')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu, size: 30), title: Text('Menu'))
                  ],
                ),
              )),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              size: 45,
            ),
            onPressed: () {
              Get.to(() => MyPackage());
            },
          ),
        ));
  }
}
