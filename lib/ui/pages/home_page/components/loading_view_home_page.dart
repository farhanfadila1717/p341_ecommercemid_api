part of '../home_page.dart';

class LoadingViewHomePage extends StatelessWidget {
  const LoadingViewHomePage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoadingCard(
                height: size.height * .24,
                width: size.width - 40,
                borderRadius: 16),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
                height: size.height * .15,
                width: size.width - 40,
                borderRadius: 16),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(height: 30, width: size.width * 1.2, borderRadius: 16),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
                height: size.height * .15,
                width: size.width - 40,
                borderRadius: 16),
          ],
        ),
      ),
    );
  }
}
