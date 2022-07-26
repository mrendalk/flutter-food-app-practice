import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resta/cart_controller.dart';
import 'package:resta/cart_screen.dart';
import 'package:resta/product.dart';
import 'package:resta/productcontroler.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("catalog")),
      body: SafeArea(
        child: Column(children: [
          CatalogProducts(),
          ElevatedButton(
            onPressed: () => Get.to(() => const CartScreen()),
            child: const Text('go to cart'),
          )
        ]),
      ),
    );
  }
}

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController);
  CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flexible(
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return CatalogProductCard(
              index: index,
            );
          }),
        ));
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(children: [
        Expanded(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              productController.products[index].imageUrl,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: Text(productController.products[index].name)),
        Expanded(child: Text('${productController.products[index].price}')),
        IconButton(
          onPressed: () {
            cartController.addProduct(productController.products[index]);
          },
          icon: Icon(Icons.add_circle),
        ),
      ]),
    );
  }
}




















// class CartScreen extends StatefulWidget {
//   final int index;
//   const CartScreen({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: const Text("Shopping Cart",
//             style: TextStyle(
//               color: Colors.grey,
//             )),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       //bottomNavigationBar: const CustomBottomBar(selectMenu: MenuState.cart),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//         child: ListView(
//           children: [
//             ListView.builder(
//                 //use shrink wrap true and scrollphysics to avoid error because we are using listview in side listview or column
//                 shrinkWrap: true,
//                 physics: const ScrollPhysics(),
//                 itemCount: 4,
//                 itemBuilder: (context, int index) => FavouriteCard(
//                       product: Product.products[index],
//                       press: () {},
//                     ))
//           ],
//         ),
//       )),
//     );
//   }
// }

// class FavouriteCard extends StatelessWidget {
//   const FavouriteCard({
//     Key? key,
//     required this.product,
//     required this.press,
//   }) : super(key: key);
//   final Product product;
//   final VoidCallback press;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: InkWell(
//         onTap: press,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
//           decoration: BoxDecoration(
//               color: Colors.amber.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(15.0)),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Image.asset(
//                     product.image,
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 width: 10.0,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.title,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                       ),
//                     ),
//                     Text(
//                       product.description,
//                       maxLines: 2,
//                       style: const TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "\$${product.price}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: const Icon(
//                                   Icons.remove,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8.0,
//                             ),
//                             const Text(
//                               "1",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8.0,
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: const Icon(
//                                   Icons.add,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
