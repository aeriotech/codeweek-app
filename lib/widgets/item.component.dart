import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';

class ItemComponent extends StatelessWidget {
  const ItemComponent({Key? key,
    required this.name,
    required this.description,
    required this.expirationDate,
    this.itemCount,
  })
      : super(key: key);

  final String name;
  final String description;
  final String expirationDate;
  final String? itemCount;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Container(
        height: height * 0.09,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2.0),
                  blurRadius: 2.0,
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CookifySeperator(
                    width: 46.0,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    expirationDate,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: itemCount != null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: const BoxDecoration(
                              color: CookifyColors.yellow, shape: BoxShape.circle),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                itemCount ?? '1',
                                style: const TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Visibility(
                    visible: true,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.error_outline,
                          color: CookifyColors.red
                        )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
