import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:profile_card/ui/views/home/widgets/event_card.dart';

class UpComingEvent extends StatelessWidget {
  const UpComingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upcoming Events",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              EventCard(
                title: "Mentorship Session",
                time: "Tomorrow, 10:00 AM",
              ),
              const SizedBox(width: 12),
              EventCard(title: "Workshop: Career Growth", time: "Fri, 2:00 PM"),
              const SizedBox(width: 12),
              EventCard(title: "Networking Event", time: "Next Week"),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 400.ms);
  }
}
