import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model.dart';
import '../controllers/controller.dart';
import 'package:phone_auth_project/models/model.dart';
import 'package:phone_auth_project/custom_icon.dart';

class MyPackage extends StatelessWidget {
  int index;
  MyPackage({this.index});

  @override
  Widget build(BuildContext context) {
    final PackageController pack = Get.find();

    String title = "";
    String name = "";
    String surname = "";
    String phone = "";
    String adress_1 = "";
    String adress_2 = "";
    String city = "";
    String zip_code = "";
    String sate = "";

    title = index == null ? "" : pack.packages[index].title;
    name = index == null ? "" : pack.packages[index].name;
    surname = index == null ? "" : pack.packages[index].surname;
    phone = index == null ? "" : pack.packages[index].phone;
    adress_1 = index == null ? "" : pack.packages[index].adress_1;
    adress_2 = index == null ? "" : pack.packages[index].adress_2;
    city = index == null ? "" : pack.packages[index].city;
    zip_code = index == null ? "" : pack.packages[index].zip_code;
    sate = index == null ? "" : pack.packages[index].sate;

    TextEditingController titleEditingController =
        new TextEditingController(text: title);
    TextEditingController nameEditingController =
        new TextEditingController(text: name);
    TextEditingController surnameEditingController =
        new TextEditingController(text: surname);
    TextEditingController phoneEditingController =
        new TextEditingController(text: phone);
    TextEditingController adress1EditingController =
        new TextEditingController(text: adress_1);
    TextEditingController adress2EditingController =
        new TextEditingController(text: adress_2);
    TextEditingController cityEditingController =
        new TextEditingController(text: city);
    TextEditingController zip_codeEditingController =
        new TextEditingController(text: zip_code);
    TextEditingController sateEditingController =
        new TextEditingController(text: sate);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              elevation: 0,
              backgroundColor: Colors.white12,
              title: index == null
                  ? Text(
                      'Create Order',
                      style: TextStyle(color: Colors.black),
                    )
                  : Text('Edit Order', style: TextStyle(color: Colors.black)),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: 650,
                // width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Icon(
                                  CustomIcon.phone,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 12,
                                  height: 40,
                                ),
                                Text(
                                  'Shipping address for your order',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                style: TextStyle(fontSize: 20),
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                controller: titleEditingController,
                                autofocus: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  hintText: 'Add package tracking number',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 3.0),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 3.0),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              new Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: inputFile(
                                        label: "First Name",
                                        controller: nameEditingController)),
                              ),
                              new Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: inputFile(
                                        label: "Last Name",
                                        controller: surnameEditingController)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              inputFile(
                                  label: "Phone number",
                                  controller: phoneEditingController),
                              inputFile(
                                  label: "Address1:",
                                  controller: adress1EditingController),
                              inputFile(
                                  label: "Address2:",
                                  controller: adress2EditingController),
                              inputFile(
                                  label: "City:",
                                  controller: cityEditingController)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              new Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: inputFile(
                                        label: "Zip code:",
                                        controller: zip_codeEditingController)),
                              ),
                              new Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: inputFile(
                                        label: "Sate:",
                                        controller: sateEditingController)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                onPressed: () {
                                  if (index == null) {
                                    pack.packages.add(Package(
                                        title: titleEditingController.text,
                                        name: nameEditingController.text,
                                        surname: surnameEditingController.text,
                                        phone: phoneEditingController.text,
                                        adress_1: adress1EditingController.text,
                                        adress_2: adress2EditingController.text,
                                        city: cityEditingController.text,
                                        zip_code:
                                            zip_codeEditingController.text,
                                        sate: sateEditingController.text));
                                  } else {
                                    var updatePackage = pack.packages[index];
                                    updatePackage.title =
                                        titleEditingController.text;
                                    updatePackage.name =
                                        nameEditingController.text;
                                    updatePackage.surname =
                                        surnameEditingController.text;
                                    updatePackage.phone =
                                        phoneEditingController.text;
                                    updatePackage.adress_1 =
                                        adress1EditingController.text;
                                    updatePackage.adress_2 =
                                        adress2EditingController.text;
                                    updatePackage.city =
                                        cityEditingController.text;
                                    updatePackage.zip_code =
                                        zip_codeEditingController.text;
                                    updatePackage.sate =
                                        sateEditingController.text;
                                    pack.packages[index] = updatePackage;
                                  }

                                  Get.back();
                                },
                                color: Color(0xff0095FF),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: index == null
                                    ? Text(
                                        "Create order",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "Edit order",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )));
  }
}

Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      SizedBox(
        height: 0,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
