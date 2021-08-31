part of '../filter_page.dart';

class ChoseSize extends StatefulWidget {
  const ChoseSize({
    Key? key,
  }) : super(key: key);

  @override
  _ChoseSizeState createState() => _ChoseSizeState();
}

class _ChoseSizeState extends State<ChoseSize> {
  late List<String> _selectedSize = [];

  @override
  void initState() {
    _selectedSize.add(sizes[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          children: sizes
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    if (_selectedSize.contains(e)) {
                      _selectedSize.removeWhere((element) => element == e);
                    } else {
                      _selectedSize.add(e);
                    }
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    height: 39,
                    width: 39,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: _selectedSize.contains(e)
                          ? theme.primaryColor
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300] ?? Colors.grey,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: TextStyle(
                          color: _selectedSize.contains(e)
                              ? Colors.white
                              : blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          spacing: 10,
        ),
      ),
    );
  }
}
