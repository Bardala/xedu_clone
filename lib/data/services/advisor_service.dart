import 'dart:convert';

import 'package:profile_card/data/services/api_config.dart';
import 'package:profile_card/models/advisor.dart';
import 'package:http/http.dart' as http;

class AdvisorService {
  final headers = {"Content-Type": 'application/json'};

  Future<List<Advisor>> getAll() async {
    final url = Uri.parse(EndPoint.getAllAdvisors);
    final res = await http.get(url, headers: headers);

    final body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      if (body is List) {
        return body.map((json) => Advisor.fromJson(json)).toList();
      } else {
        throw Exception("Unexpected response format, expected a List");
      }
    } else {
      throw Exception(body['error'] ?? 'Error getting advisors');
    }
  }

  Future<Advisor> getById(int id) async {
    final url = Uri.parse('$EndPoint.getAllAdvisors/$id');
    final res = await http.get(url, headers: headers);

    final body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return Advisor.fromJson(body);
    } else {
      throw Exception(body['error'] ?? 'Error getting advisor');
    }
  }
}
