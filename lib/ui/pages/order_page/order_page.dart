import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import '../../widgets/custom_flat_button.dart';
import '../detail_order_page/detail_order_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
        bottom: PreferredSize(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('My Orders', style: titleStyle),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  tabs: List.generate(
                    orderStatus.length,
                    (index) {
                      return Tab(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? blackColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                            child: Text(
                              orderStatus[index],
                              style: TextStyle(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : blackColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            preferredSize: Size(double.infinity, 120)),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: List.generate(
                10,
                (index) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order No.19289013',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '07-17-2021',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 10)),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tracking number: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'IWA1378131',
                              style: TextStyle(
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Quantity: ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: 'IWA1378131',
                                    style: TextStyle(
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total Amount: ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: '\$121',
                                    style: TextStyle(
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 10)),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: CustomOutlinedButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailOrderPage()));
                                },
                                title: 'Details',
                                textColor: blackColor,
                              ),
                            ),
                            Spacer(),
                            Text('Delivered',
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text('Processing'),
          ),
          Center(
            child: Text('Cancelled'),
          ),
        ],
      ),
    );
  }
}
