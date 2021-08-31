part of '../favorite_page.dart';

class SortBy extends StatelessWidget {
  const SortBy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 100,
                  height: 5,
                  child: const DecoratedBox(
                      decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Sort by',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: sortBy
                  .map((e) => ListTile(
                        title: Text(e),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
