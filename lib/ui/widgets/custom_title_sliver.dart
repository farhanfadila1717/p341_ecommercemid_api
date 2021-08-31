import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class CustomTitleSliver extends StatelessWidget {
  const CustomTitleSliver({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                const Padding(padding: const EdgeInsets.only(top: 4)),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text('View all')),
          ],
        ),
      ),
    );
  }
}
