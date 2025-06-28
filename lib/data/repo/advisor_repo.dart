import 'package:profile_card/data/services/advisor_service.dart';
import 'package:profile_card/models/advisor.dart';
import 'package:profile_card/utils/result.dart';

class AdvisorRepo {
  final AdvisorService _remote = AdvisorService();

  Future<Result<List<Advisor>>> getAll() async {
    try {
      final res = await _remote.getAll();
      return Result.ok(res);
    } catch (e) {
      return Result.error("error: $e");
    }
  }

  Future<Result<Advisor>> getById(int id) async {
    try {
      final res = await _remote.getById(id);
      return Result.ok(res);
    } catch (e) {
      return Result.error("error: $e");
    }
  }
}
