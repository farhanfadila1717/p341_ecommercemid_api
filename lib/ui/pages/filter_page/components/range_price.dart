part of '../filter_page.dart';

class RangePrice extends StatefulWidget {
  const RangePrice({
    Key? key,
  }) : super(key: key);

  @override
  _RangePriceState createState() => _RangePriceState();
}

class _RangePriceState extends State<RangePrice> {
  RangeValues _currentValues = RangeValues(20, 60);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('\$${_currentValues.start.round()}'),
                  Spacer(),
                  Text('\$${_currentValues.end.round()}'),
                ],
              ),
            ),
            RangeSlider(
              values: _currentValues,
              min: 10,
              max: 100,
              inactiveColor: Colors.grey[300],
              labels: RangeLabels(
                _currentValues.start.round().toString(),
                _currentValues.end.round().toString(),
              ),
              onChanged: (values) {
                setState(() {
                  _currentValues = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
