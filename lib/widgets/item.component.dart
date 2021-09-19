import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';

class ItemComponent extends StatelessWidget {
  const ItemComponent({
    Key? key,
    required this.name,
    required this.description,
    required this.expirationDate,
    required this.imageUrl,
    this.itemCount,
  }) : super(key: key);

  final String name;
  final String description;
  final String expirationDate;
  final String imageUrl;
  final String? itemCount;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.12,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0), boxShadow: [
        BoxShadow(offset: const Offset(0, 2.0), blurRadius: 2.0, color: Colors.black.withOpacity(0.25))
      ]),
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 75.0,
            height: 75.0,
            child: imageUrl.startsWith('http')
                ? Image.network(imageUrl)
                : Container(
                    decoration: BoxDecoration(
                      color: CookifyColors.yellow2,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(Icons.add_photo_alternate_outlined, color: Colors.white),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 75.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              height: height * 0.12,
              width: 80,
              child: Stack(
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
                          decoration: const BoxDecoration(color: CookifyColors.blue, shape: BoxShape.circle),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                itemCount ?? '1',
                                style: const TextStyle(fontSize: 12.0, color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.error_outline,
                          color: CookifyColors.yellow3,
                          size: 20.0,
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
