import 'package:ecommerce_app/api/newbornapi.dart';
import 'package:ecommerce_app/screens/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Seeall extends StatefulWidget {
  const Seeall({super.key});

  @override
  State<Seeall> createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  void initstate() {
    super.initState();

    Provider.of<Newbornimg>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Newbornimg>(context);

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(),
        body: productdata.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SingleProduct(
                            price: productdata.imgurl![index].price.toString(),
                            image: productdata.imgurl![index].image,
                            des: productdata.imgurl![index].description
                                .toString(),
                            id: productdata.imgurl![index].id,
                            rating: productdata.imgurl![index].rating.rate
                                .toString(),
                            count: productdata.imgurl![index].rating.count
                                .toString(),
                            title: productdata.imgurl![index].title),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.horizontal(),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            productdata.imgurl![index].image),
                                      ),
                                      color: Colors.grey.shade100),
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
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
                                        productdata.imgurl![index].rating.rate
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Text(
                                          "(${productdata.imgurl![index].rating.count.toString()}Reviews)"),
                                    ],
                                  ),
                                  Text(
                                    "\$${productdata.imgurl![index].price.toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
