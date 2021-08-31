part of '../catalog_page.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilterPage()));
              },
              icon: Icon(Icons.sort),
              label: Text('Filters'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(blackColor),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) {
                    return SortBy();
                  },
                );
              },
              icon: Icon(Icons.arrow_upward_sharp),
              label: Text('Price lower to hight'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(blackColor),
              ),
            ),
            Icon(Icons.grid_3x3, color: blackColor),
          ],
        ),
      ),
    );
  }
}
