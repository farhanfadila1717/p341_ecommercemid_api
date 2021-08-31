part of '../catalog_page.dart';

class Chips extends StatelessWidget {
  const Chips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (BuildContext context, int index) {
          final CategoriesModel item = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Chip(
              label: Text(item.title),
              backgroundColor: blackColor,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
