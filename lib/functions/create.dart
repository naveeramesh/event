import 'package:eventtask/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Create extends GetxController {
  var selectedstarttime = TimeOfDay.now().obs;
  var selectedendtime = TimeOfDay.now().obs;
  Future createevent(int id, String? title, String? description,
      DateTime? startAt, DateTime? endAt) async {
    var response = await http
        .post(Uri.parse("http://104.155.187.128:9999/api/upload"), body: {
      "id": id,
      "title": title,
      "description": description,
      "startAt": startAt,
      "endAt": endAt
    });
    var data = response.body;
    print(data);

    if (response.statusCode == 200) {
      String valuedata = response.body;
      eventClassFromJson(valuedata);
    } else {
      return null;
    }
  }

  starttime() async {
    TimeOfDay? picktime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedstarttime.value,
    );
    // ignore: unrelated_type_equality_checks
    if (picktime != selectedstarttime && picktime != null) {
      selectedstarttime.value = picktime;
    }
    update();
  }

  endtime() async {
    TimeOfDay? picktime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedendtime.value,
    );
    // ignore: unrelated_type_equality_checks
    if (picktime != selectedendtime && picktime != null) {
      selectedendtime.value = picktime;
    }
    update();
  }
}
