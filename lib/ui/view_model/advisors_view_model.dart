import 'package:flutter/material.dart';

import 'package:profile_card/data/repo/advisor_repo.dart';
import 'package:profile_card/models/advisor.dart';
import 'package:profile_card/utils/result.dart';

class AdvisorsViewModel with ChangeNotifier {
  final AdvisorRepo _advisorRepo = AdvisorRepo();

  bool _isLoading = false;
  String? _errMsg;
  List<Advisor>? _advisors;

  bool get isLoading => _isLoading;
  String? get errMsg => _errMsg;
  List<Advisor>? get advisors => _advisors;

  Future<bool> getAll() async {
    _setLoading(true);

    final res = await _advisorRepo.getAll();

    return switch (res) {
      Success<List<Advisor>> success => _handleSuccess(success.data),
      Failure<List<Advisor>> failure => _handleError(failure.errorMsg),
    };
  }

  bool _handleSuccess(List<Advisor> advisors) {
    _advisors = advisors;
    _errMsg = null;
    _setLoading(false);
    return true;
  }

  bool _handleError(String msg) {
    _errMsg = msg;
    _advisors = null;
    _setLoading(false);
    return false;
  }

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
