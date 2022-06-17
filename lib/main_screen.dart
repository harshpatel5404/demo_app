import 'package:demo_app/add_vehicle_form.dart';
import 'package:demo_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bike_screen.dart';
import 'car_sceen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.pedal_bike)),
              Tab(icon: Icon(Icons.car_rental)),
            ],
          ),
          centerTitle: true,
          title: Text(
            'Vehicle Information',
          ),
        ),
        body: TabBarView(
          children: [
            BikeScreen(),
            CarScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kPrimaryColor,
            onPressed: () {},
            label: InkWell(
                onTap: () {
                  Get.to(AddVehicleForm());
                },
                child: Text("Add Vehicle"))),
      ),
    );
  }
}
