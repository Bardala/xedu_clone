import 'package:flutter/material.dart';
import 'package:profile_card/models/advisor.dart';
import 'package:profile_card/ui/view_model/advisors_view_model.dart';
import 'package:provider/provider.dart';

class AdvisorsScreen extends StatelessWidget {
  const AdvisorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdvisorsViewModel()..getAll(),
      child: const _AdvisorsView(),
    );
  }
}

class _AdvisorsView extends StatelessWidget {
  const _AdvisorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AdvisorsViewModel>();

    if (vm.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (vm.errMsg != null) {
      return Scaffold(body: Center(child: Text(vm.errMsg!)));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Meet Our Advisors")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: vm.isLoading
            ? const Center(child: CircularProgressIndicator())
            : vm.errMsg != null
            ? Center(child: Text(vm.errMsg!))
            : SizedBox(
                height: 500,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.advisors!.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final advisor = vm.advisors![index];
                    return AdvisorCard(advisor: advisor);
                  },
                ),
              ),
      ),
    );
  }
}

class AdvisorCard extends StatelessWidget {
  final Advisor advisor;

  const AdvisorCard({super.key, required this.advisor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          colors: [Colors.indigo.shade50, Colors.blue.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 4)),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  advisor.imageUrl != null ? advisor.imageUrl! : "",
                ),
                fit: BoxFit.cover,
              ),

              // color: Colors.amber,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: advisor.imageUrl == null
                ? const Icon(Icons.person, size: 36)
                : null,
          ),
          const SizedBox(height: 24),

          // CircleAvatar(
          //   radius: 60,
          //   backgroundImage: advisor.imageUrl != null
          //       ? NetworkImage(advisor.imageUrl!)
          //       : null,
          //   child: advisor.imageUrl == null
          //       ? const Icon(Icons.person, size: 36)
          //       : null,
          // ),
          // const SizedBox(height: 12),
          Text(
            advisor.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.indigo.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              advisor.specialty,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i) => Icon(
                Icons.star,
                size: 14,
                color: i < advisor.rating.round()
                    ? Colors.amber
                    : Colors.grey.shade300,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              advisor.bio,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size.fromHeight(32),
            ),
            child: const Text("Book", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
