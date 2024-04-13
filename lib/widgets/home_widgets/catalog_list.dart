imporimport 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.accentColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      _AddToCart(catalog: catalog)
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
//
//










































// import 'package:ecommerce_project/pages/home_detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../models/catalog.dart';
// //import 'add_to_cart.dart';
// import 'catalog_image.dart';
//
// class CatalogList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return !context.isMobile
//         ? GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, crossAxisSpacing: 20.0),
//       shrinkWrap: true,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items[index];
//         return InkWell(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//            builder: (context) => HomeDetailPage(
//                catalog: catalog,
//                key: Key('homeDetailPage'),
//              ),
//            ),
//          ),
//           child: CatalogItem(key: Key(catalog.id.toString()), catalog: catalog),
//         );
//       },
//     )
//         : ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items[index];
//         return InkWell(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//              builder: (context) => HomeDetailPage(
//                catalog: catalog,
//                key: Key('homeDetailPage'),
//              ),
//            ),
//          ),
//           child: CatalogItem(key: Key(catalog.id.toString()), catalog: catalog),
//         );
//       },
//     );
//   }
// }
//
// class CatalogItem extends StatelessWidget {
//   final Item catalog;
//
//   const CatalogItem({required Key key, required this.catalog})
//       : assert(catalog != null),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var children2 = [
//     Hero(
//            tag: Key(catalog.id.toString()),       child: CatalogImage(
//                image: catalog.image,
//                key: Key('catalogImage'),
//              ),
//            ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name.text.lg.color(context.accentColor).bold.make(),
//             catalog.desc.text.textStyle(context.captionStyle).make(),
//             10.heightBox,
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               buttonPadding: EdgeInsets.zero,
//               children: [
//                       '\${catalog.price}'.text.bold.xl.make(),
//                        _AddToCart(catalog: catalog, key: ValueKey(catalog.id)),
//                      ],
//                    ).pOnly(right: 8.0)
//           ],
//         ).p(context.isMobile ? 0 : 16),
//       )
//     ];
//     return VxBox(
//       child: context.isMobile
//           ? Row(
//         children: children2,
//       )
//           : Column(
//         children: children2,
//       ),
//     ).color(context.cardColor).rounded.square(150).make().py16();
//   }
// }
//




// Widget build(BuildContext context) {
//   return ListView.builder(
//     shrinkWrap: true,
//     itemCount: CatalogModel.items.length,
//     itemBuilder: (context, index) {
//       final catalog = CatalogModel.items[index];
//       return InkWell(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeDetailPage(
//               catalog: catalog,
//               key: Key('homeDetailPage'),
//             ),
//           ),
//         ),
//         child: CatalogItem(catalog: catalog, key: Key('catalogItem')),
//       );
//     },
//   );
// }


// class CatalogItem extends StatelessWidget {
//   final Item catalog;
//
//   const CatalogItem({required Key key, required this.catalog})
//       : assert(catalog != null),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//       child: Row(
//         children: [
//           Hero(
//             tag: Key(catalog.id.toString()),
//             child: CatalogImage(
//               image: catalog.image,
//               key: Key('catalogImage'),
//             ),
//           ),
//           Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   catalog.name.text.lg.color(context.accentColor).bold.make(),
//                   catalog.desc.text.textStyle(context.captionStyle).make(),
//                   10.heightBox,
//                   ButtonBar(
//                     alignment: MainAxisAlignment.spaceBetween,
//                     buttonPadding: EdgeInsets.zero,
//                     children: [
//                       '\${catalog.price}'.text.bold.xl.make(),
//                       _AddToCart(catalog: catalog, key: ValueKey(catalog.id)),
//                     ],
//                   ).pOnly(right: 8.0)
//                 ],
//               ))
//         ],
//       ),
//     ).color(context.cardColor).rounded.square(150).make().py16();
//   }
// }
//
// class _AddToCart extends StatefulWidget {
//   final Item catalog;
//   const _AddToCart({
//     required Key key,
//     required this.catalog,
//   }) : super(key: key);
//
//   @override
//   __AddToCartState createState() => __AddToCartState();
// }
//
// class __AddToCartState extends State<_AddToCart> {
//   bool isAdded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         isAdded = isAdded.toggle();
//         final _catalog = CatalogModel();
//         final _cart = CartModel();
//         _cart.catalog = _catalog;
//         _cart.add(widget.catalog);
//         setState(() {});
//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(context.theme.buttonTheme.colorScheme?.background),
//         shape: MaterialStateProperty.all(
//           StadiumBorder(),
//         ),
//       ),
//       child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
//     );
//   }
//}