import 'package:demo_app/colors.dart';
import 'package:demo_app/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class AddVehicleForm extends StatefulWidget {
  const AddVehicleForm({Key? key}) : super(key: key);

  @override
  State<AddVehicleForm> createState() => _AddVehicleFormState();
}

class _AddVehicleFormState extends State<AddVehicleForm> {
  TextEditingController vehiclecontroller = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FormController formController = Get.put(FormController());

  @override
  void initState() {
    super.initState();

    formController.branddropdownvalue.value = 'Select Brand';
    formController.vehicledropdownvalue.value = 'Select Vehicle Type';
    formController.fueldropdownvalue.value = 'Select Fuel Type';
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Add Vehicle Form"),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: Get.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vehicle Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      TextFormField(
                          cursorColor: kPrimaryColor,
                          controller: vehiclecontroller,
                          decoration: InputDecoration(
                            hintText: "Enter vehicle umber",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: kPrimaryColor,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onFieldSubmitted: (val) {
                            FocusScope.of(context).unfocus();
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter vehicle number';
                            } else if (val.length < 6) {
                              return 'Number should be greater than 6 character';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "Brand Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 30),
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                            ),
                            isExpanded: true,
                            value: formController.branddropdownvalue.value,
                            elevation: 5,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                            items: <String>[
                              'Select Brand',
                              'Maruti Suzuki',
                              'Hyundai',
                              'Toyota',
                              'Mahindra',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              formController.branddropdownvalue.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "Vehicle Type",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 30),
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                            ),
                            isExpanded: true,
                            value: formController.vehicledropdownvalue.value,
                            elevation: 5,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                            items: <String>[
                              'Select Vehicle Type',
                              'Bike',
                              'Car',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              formController.vehicledropdownvalue.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "Fuel Type",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 30),
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                            ),
                            isExpanded: true,
                            value: formController.fueldropdownvalue.value,
                            elevation: 5,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                            items: <String>[
                              'Select Fuel Type',
                              'Petrol',
                              'Diesel',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              formController.fueldropdownvalue.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.07),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: Get.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          if (formController.branddropdownvalue.value ==
                              "Select Brand") {
                            Toast.show("Please select brand",
                                gravity: Toast.bottom);
                          } else if (formController
                                  .vehicledropdownvalue.value ==
                              "Select Vehicle Type") {
                            Toast.show("Please select vehicle",
                                gravity: Toast.bottom);
                          } else if (formController.fueldropdownvalue.value ==
                              "Select Fuel Type") {
                            Toast.show("Please select fuel",
                                gravity: Toast.bottom);
                          } else {
                            Map card = {
                              "vehicleNo": vehiclecontroller.text,
                              "brand": formController.branddropdownvalue.value,
                              "vehicle":
                                  formController.vehicledropdownvalue.value,
                              "fuel": formController.fueldropdownvalue.value,
                            };

                            if (formController.vehicledropdownvalue.value ==
                                "Car") {
                              formController.carlist.add(card);
                            } else {
                              formController.bikelist.add(card);
                            }
                            Toast.show("Vehicle Added", gravity: Toast.bottom);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
