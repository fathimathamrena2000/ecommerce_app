//import 'dart:html';

import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/seeall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/newbornapi.dart';

class Onlinepg extends StatefulWidget {
  const Onlinepg({super.key});

  @override
  State<Onlinepg> createState() => _OnlinepgState();
}

class _OnlinepgState extends State<Onlinepg> {
  @override
  void initState() {
    super.initState();
    Provider.of<Newbornimg>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Newbornimg>(context);
    List season = ["Summer Sale", "Winter Sale", "Black Friday"];
    List offer = ["50% off", "Buy 1 get 1", "20% off"];
    List<Map<String, dynamic>> locations = [
      {
        "title": "Men",
        "icon:": Icons.man_rounded,
      },
      {"title": "Women", "icon:": Icons.woman},
      {"title": "kids", "icon:": Icons.man_3_rounded},
      {"title": "Shirts", "icon:": Icons.adobe_outlined},
      {"title": "Watch", "icon:": Icons.person_2_outlined},
      {"title": "Shoes", "icon:": Icons.person},
      {"title": "Ring", "icon:": Icons.person_2_outlined},
      {"title": "more", "icon:": Icons.person},
    ];

    return Scaffold(
        body: productdata.imgurl == null
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 60),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.notifications_active,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CartProduct()));
                                },
                                child: const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: season.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    height: 180,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 7,
                                            offset: Offset(0, 5),
                                          )
                                        ],
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 15),
                                              child: Text(
                                                season[index],
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Text(
                                                offer[index],
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 50, left: 30),
                                              child: Container(
                                                height: 20,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: const Center(
                                                  child: Text(
                                                    "Buy now",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 160,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      productdata.imgurl![index]
                                                          .image),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 200),
                          child: Text(
                            "Top Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1),
                          itemCount: locations.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(400),
                                    ),
                                    child: Icon(
                                      locations[index]["icon:"],
                                      color: Colors.white,
                                      size: 40,
                                    )),
                                Text(locations[index]["title"])
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Best Sellers",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Seeall(),
                                  ));
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 230,
                          child: Column(children: [
                            SizedBox(
                                height: 220,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 170,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 7,
                                                color: Colors.grey,
                                                offset: Offset(0, 5))
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          productdata
                                                              .imgurl![index]
                                                              .image),
                                                      fit: BoxFit.contain),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              productdata.imgurl![index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.amber[400],
                                                ),
                                                Text(
                                                  productdata.imgurl![index]
                                                      .rating.rate
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                    "(${productdata.imgurl![index].rating.count.toString()}Reviews)"),
                                              ],
                                            ),
                                            Text(
                                              "\$${productdata.imgurl![index].price.toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ))
                          ]),
                        )
                      ]),
                ),
              ));
  }
}
