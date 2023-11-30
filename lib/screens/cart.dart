import 'package:ecommerce_app/api/newbornapi.dart';
import 'package:ecommerce_app/screens/gotocartpro.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<Cartprovider>(context, listen: true);
    final productdata = Provider.of<Newbornimg>(context);
    cartdata.productDatas = productdata;
    Provider.of<Cartprovider>(context, listen: false).totalPr();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: cartdata.cartitem.length,
                itemBuilder: (context, index) {
                  cartdata.productID = cartdata.cartitem[index];
                  final productsn = productdata.imgurl!
                      .firstWhere((p) => p.id == cartdata.productID);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 7,
                                color: Colors.grey)
                          ]),
                      height: 150,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(productsn.image))),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productsn.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Size")),
                                  Text(
                                    "\$${productsn.price.toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Input Coupon code",
                                  fillColor: Colors.grey[100],
                                  filled: true),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.black),
                            child: const Center(
                                child: Text(
                              "Apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2.0),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Amount"),
                          const Text("Shipping Charge"),
                          Text("Total Amount: ${cartdata.totalPrice}"),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Center(
                        child: Text(
                          "Check out",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
