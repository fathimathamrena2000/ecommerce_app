import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/gotocartpro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatefulWidget {
  final String title;
  final int id;
  final String rating;
  final String count;
  final String des;
  final String image;
  final String price;

  //id,des,image,rating,count
  const SingleProduct({
    super.key,
    required this.title,
    required this.id,
    required this.rating,
    required this.count,
    required this.des,
    required this.image,
    required this.price,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cartprovider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            size: 35,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                          widget.image,
                        )),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 7,
                              color: Colors.grey)
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.outfit(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.rating,
                        style: GoogleFonts.outfit(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "DESCRIPTION",
                    style: GoogleFonts.outfit(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.des,
                  style: GoogleFonts.outfit(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 35,
          // ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: GoogleFonts.outfit(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "\$${widget.price}",
                          style: GoogleFonts.outfit(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            cartData.cartitem.contains(widget.id)
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const CartProduct(),
                                      ));
                                      // cartData.removefromcart(widget.id);
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.pink[100],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Go to cart",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      cartData.addcart(widget.id);
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.pink[100],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Add to cart",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                            // InkWell(
                            //     onTap: () {
                            //       if (cartData.cartitem
                            //           .contains(widget.id)) {
                            //         cartData.removefromcart(widget.id);
                            //         print(cartData.cartitem);
                            //       } else {
                            //         cartData.addcart(widget.id);
                            //         print(cartData.cartitem);
                            //       }
                            //     }
                            //     //   Navigator.of(context).push(MaterialPageRoute(
                            //     // builder: (context) => CartProduct(),

                            //     // ))

                            //     ,
                            //     child: Container(
                            //       width: 200,
                            //       height: 45,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20),
                            //         color: Colors.pink[100],
                            //       ),
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Center(
                            //           child: Container(
                            //             child: Column(
                            //               children: [
                            //                 Text(
                            //                   "Add to cart",
                            //                   style:
                            //                       TextStyle(fontSize: 20),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            ,
                            const SizedBox(
                              height: 15,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => CartProduct(),
                            //     ));
                            //   },
                            //   child: Container(
                            //     height: 45,
                            //     width: 200,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: Colors.pink[100],
                            //     ),
                            //     child: Column(
                            //       children: [
                            //         Padding(
                            //           padding: const EdgeInsets.all(8.0),
                            //           child: Center(
                            //             child: Text(
                            //               "Go to cart",
                            //               style: TextStyle(fontSize: 20),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
