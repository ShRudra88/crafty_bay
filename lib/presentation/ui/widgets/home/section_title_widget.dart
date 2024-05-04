import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('All Categories', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),
        TextButton(onPressed: (){}, child: const Text('See All'))
      ],
    );
  }
}
