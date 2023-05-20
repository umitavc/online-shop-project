import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop_project/models/sneaker_model.dart';
import 'package:online_shop_project/services/halper.dart';
import 'package:online_shop_project/views/shared/stagger_tile.dart';

import '../shared/appstyle.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat> with TickerProviderStateMixin {
  late final TabController _tabControler = TabController(length: 3, vsync: this);


   late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale(){
    _male =Helper().getMaleSneakers();
  }

  void getFemale(){
    _female =Helper().getFemaleSneakers();
  }

  void getkids(){
    _kids =Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getkids();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/top_image.png"), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(AntDesign.close, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesome.sliders, color: Colors.white),
                      )
                    ],
                  ),
                ),
                TabBar(padding: EdgeInsets.zero,
                 indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                   controller: _tabControler, isScrollable: true,
                    labelColor: Colors.white,
                     labelStyle: appstyle(24, Colors.white, FontWeight.bold), 
                     unselectedLabelColor: Colors.grey.withOpacity(0.3), tabs: const [
                  Tab(
                    text: "Men Shoes",
                  ),
                  Tab(
                    text: "Women Shoes",
                  ),
                  Tab(
                    text: "Kids Shoes",
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.175, left: 16, right: 12),
            child: TabBarView(controller: _tabControler, children: [
              FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Eror ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return StaggeredGridView.countBuilder(
                  padding:EdgeInsets.zero,
                  crossAxisCount:2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 16,
                  itemCount:male!.length,
                  scrollDirection:Axis.vertical,
                  staggeredTileBuilder:(index) => StaggeredTile.extent(
                    (index % 2 ==0) ? 1:1,(index % 4==1 || index % 4==3) ?
                    MediaQuery.of(context).size.height*0.35:
                    MediaQuery.of(context).size.height *0.3),
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return StaggerTile(
                      imageUrl: shoe.imageUrl[1], 
                      price: shoe.price, 
                      name: shoe.name,
                      );
                  },
                );
              }
            },
          ),
              
              Container(
                height: 400,
                width: 300,
                color: Colors.amber,
              ),
              Container(
                height: 400,
                width: 300,
                color: Colors.red,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
