import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 50,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.place_outlined,
                  color: configColors.orange,
                  size: 17,
                )),
            Text(
              'Zihuatanejo, Gro',
              style: TextStyle(
                  color: configColors.darkBlue,
                  fontFamily: "Mark-Pro",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () async {},
                icon: Icon(
                  Icons.expand_more,
                  color: configColors.grey,
                  size: 20,
                ))
          ],
        ),
        IconButton(
            onPressed: () {
              _filterModalBottomSheet(context);
            },
            icon: Image.asset('assets/image/vector.png'))
      ],
    );
  }
}

void _filterModalBottomSheet(context) {
  String dropdownvalueBrand = 'Samsung';
  var itemsBrand = [
    'Samsung',
    'Xiaomi',
    'Vivo',
    'POCO',
    'Iphone',
  ];
  String dropdownvaluePrice = '\$300 - \$500';
  var itemsPrice = [
    '\$0 - \$300',
    '\$300 - \$500',
    '\$600 - \$800',
    '\$900 - \$1100',
    '\$1200 - \$1400',
    '\$1500 - \$1700',
    '\$1800 - \$2900',
    '\$3000 - \$4000',
    '\$4100 - \$5000',
    '\$5100 - \$6000',
    '\$6100 - \$7000',
    '\$7100 - \$10000',
  ];
  String dropdownvalueSize = '4.5 to 5.5 inches';
  var itemsSize = [
    '4.5 to 5.5 inches',
    '4.6 to 5.5 inches',
    '4.7 to 5.7 inches',
    '5.2 to 7.2 inches',
    '4.1 to 3.2 inches',
  ];
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
              return Container(
                  margin: const EdgeInsets.fromLTRB(46, 0, 31, 0),
                  height: 370,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 37,
                              height: 37,
                              decoration: BoxDecoration(
                                  color: configColors.darkBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 17,
                                  )),
                            ),
                            Text(
                              'Filter options',
                              style: TextStyle(
                                  fontFamily: "Mark-Pro",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: configColors.darkBlue),
                            ),
                            Container(
                              width: 86,
                              height: 37,
                              decoration: BoxDecoration(
                                  color: configColors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Text(
                                    'Done',
                                    style: TextStyle(
                                        fontFamily: "Mark-Pro",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 26, 0, 10),
                          child: Text(
                            'Brand',
                            style: TextStyle(
                                fontFamily: "Mark-Pro",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: configColors.darkBlue),
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: configColors.borderDrobDown,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          iconEnabledColor: configColors.homeIcon,
                          isExpanded: true,
                          items: itemsBrand.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontFamily: "Mark-Pro",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: configColors.darkBlue),
                              ),
                            );
                          }).toList(),
                          // Initial Value
                          value: dropdownvalueBrand,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            mystate(() {
                              dropdownvalueBrand = newValue!;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 26, 0, 10),
                          child: Text(
                            'Price',
                            style: TextStyle(
                                fontFamily: "Mark-Pro",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: configColors.darkBlue),
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: configColors.borderDrobDown,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          iconEnabledColor: configColors.homeIcon,
                          isExpanded: true,
                          items: itemsPrice.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontFamily: "Mark-Pro",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: configColors.darkBlue),
                              ),
                            );
                          }).toList(),
                          // Initial Value
                          value: dropdownvaluePrice,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            mystate(() {
                              dropdownvaluePrice = newValue!;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 26, 0, 10),
                          child: Text(
                            'Size',
                            style: TextStyle(
                                fontFamily: "Mark-Pro",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: configColors.darkBlue),
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: configColors.borderDrobDown,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          iconEnabledColor: configColors.homeIcon,
                          isExpanded: true,
                          items: itemsSize.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontFamily: "Mark-Pro",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: configColors.darkBlue),
                              ),
                            );
                          }).toList(),
                          value: dropdownvalueSize,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (String? newValue) {
                            mystate(() {
                              dropdownvalueSize = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ));
            });
      });
}