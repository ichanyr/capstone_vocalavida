import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ujian_detail_controller.dart';

class UjianDetailView extends GetView<UjianDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UjianDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UjianDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
