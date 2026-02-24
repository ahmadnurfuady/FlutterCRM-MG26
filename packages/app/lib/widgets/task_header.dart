import 'package:flutter/material.dart';

class TaskHeader extends StatelessWidget {
  const TaskHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tasks',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Keep track of your sales activities',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor,
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
