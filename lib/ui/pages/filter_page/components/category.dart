part of '../filter_page.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CategoriesModel> items;

  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  late List<CategoriesModel> _selectedCategory = [];

  @override
  void initState() {
    _selectedCategory.add(widget.items.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          children: widget.items
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    if (_selectedCategory.contains(e)) {
                      _selectedCategory
                          .removeWhere((element) => element.title == e.title);
                    } else {
                      _selectedCategory.add(e);
                    }
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    height: 40,
                    width: 100,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: _selectedCategory.contains(e)
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
                        e.title,
                        style: TextStyle(
                          color: _selectedCategory.contains(e)
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
          runSpacing: 10,
        ),
      ),
    );
  }
}
