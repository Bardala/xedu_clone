import 'package:flutter/material.dart';
import 'package:profile_card/ui/view_model/advisors_view_model.dart';
import 'package:profile_card/ui/views/home/widgets/advisor_card.dart';
import 'package:provider/provider.dart';

class AdvisorsSection extends StatelessWidget {
  const AdvisorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdvisorsViewModel()..getAll(),
      child: Consumer<AdvisorsViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errMsg != null) {
            return Text(vm.errMsg!, style: const TextStyle(color: Colors.red));
          }

          final advisors = vm.advisors ?? [];
          print("advisors ${advisors[0].imageUrl}");

          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: advisors.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final advisor = advisors[index];
                return AdvisorCard(advisor: advisor);
              },
            ),
          );
        },
      ),
    );
  }
}
