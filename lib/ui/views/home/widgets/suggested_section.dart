import 'package:flutter/material.dart';
import 'package:profile_card/ui/views/home/widgets/suggestion_card.dart';

class SuggestedFeaturesBar extends StatelessWidget {
  const SuggestedFeaturesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SuggestionCard(icon: Icons.calendar_month, title: "Book Session"),
          SuggestionCard(icon: Icons.chat, title: "Live Chat"),
          SuggestionCard(icon: Icons.school, title: "Programs"),
          SuggestionCard(icon: Icons.star, title: "Top Advisors"),
        ],
      ),
    );
  }
}
