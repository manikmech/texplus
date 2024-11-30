import 'dart:convert';
// import 'dart:js';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Config/apiconfig.dart';
import '../model/fabric_approvalModel.dart';

class fabric_approvalController{
  static Future<List<fabric_approval_model>> getfabric_approvalList() async {
    final response = await http.get(Uri.parse(apiUrl + 'selectfabricapproval.php'));
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => fabric_approval_model.fromJson(json)).toList();
  }
}