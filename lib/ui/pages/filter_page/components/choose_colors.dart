part of '../filter_page.dart';

class ChooseColors extends StatefulWidget {
  const ChooseColors({
    Key? key,
  }) : super(key: key);

  @override
  _ChooseColorsState createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  late List<Color> _selectedColors = [];

  @override
  void initState() {
    _selectedColors.add(colors[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          children: colors
              .map(
                (e) => Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      height: 39,
                      width: 39,
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: _selectedColors.contains(e)
                              ? e
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_selectedColors.contains(e)) {
                          _selectedColors
                              .removeWhere((element) => element == e);
                        } else {
                          _selectedColors.add(e);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(
                          color: e,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          spacing: 10,
        ),
      ),
    );
  }
}
