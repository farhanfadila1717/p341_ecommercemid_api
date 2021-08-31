part of '../filter_page.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({Key? key}) : super(key: key);

  @override
  _BrandPageState createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  List<String> _selectedBrands = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Brand',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: ListView.builder(
          itemCount: brands.length,
          itemBuilder: (BuildContext context, int index) {
            final String item = brands[index];
            return ListTile(
              title: Text(item),
              trailing: Checkbox(
                  value: _selectedBrands.contains(item),
                  onChanged: (value) {
                    if (_selectedBrands.contains(item)) {
                      _selectedBrands.removeWhere((e) => e == item);
                    } else {
                      _selectedBrands.add(item);
                    }
                    setState(() {});
                  }),
            );
          }),
      bottomNavigationBar: Container(
        height: 65,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Discard',
              ),
            ),
            const Padding(padding: const EdgeInsets.only(left: 16)),
            Expanded(
              child: CustomFlatButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Apply',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
