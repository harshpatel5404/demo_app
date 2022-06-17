import 'package:get/get.dart';

class FormController extends GetxController {
  RxString branddropdownvalue = 'Select Brand'.obs;
  RxString vehicledropdownvalue = 'Select Vehicle Type'.obs;
  RxString fueldropdownvalue = 'Select Fuel Type'.obs;

  RxList carlist = [].obs;
  RxList bikelist = [].obs;
}
