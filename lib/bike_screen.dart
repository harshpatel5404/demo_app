import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_controller.dart';

class BikeScreen extends StatefulWidget {
  const BikeScreen({Key? key}) : super(key: key);

  @override
  State<BikeScreen> createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.bikelist.isNotEmpty
          ? Visibility(
              visible: formController.bikelist.isNotEmpty ? true : false,
              child: ListView.builder(
                itemCount: formController.bikelist.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = formController.bikelist[index];
                  return Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    height: Get.height * 0.25,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          15,
                        )),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 8,
                          top: 8,
                          child: InkWell(
                            onTap: () {
                              formController.bikelist.removeAt(index);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1.5, color: Colors.black)),
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Number : ${data['vehicleNo']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Brand Name : ${data['brand']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Vehicle Type : ${data['vehicle']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Fuel Type : ${data['fuel']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Text("No Vehicle Added"),
            ),
    );
  }
}
