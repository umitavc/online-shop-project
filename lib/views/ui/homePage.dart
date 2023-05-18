import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_project/views/shared/appstyle.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabControler = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/top_image.png"), fit: BoxFit.fill),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 8, bottom: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spor Ayakkabı",
                    style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.5),
                  ),
                  Text(
                    "Koleksiyon",
                    style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.5),
                  ),
                  TabBar(indicatorSize: TabBarIndicatorSize.label, 
                  indicatorColor: Colors.transparent,
                   controller: _tabControler, 
                   isScrollable: true, labelColor: Colors.white, 
                   labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                     tabs: const [
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
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.265),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: TabBarView(controller: _tabControler, children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.405,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          );
                        },),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,20,12,20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Latest shoes",style: appstyle(24, Colors.black, FontWeight.bold),),
                              Row(
                            children: [
                              Text("Show All",style: appstyle(22, Colors.black, FontWeight.w500),),
                              const Icon(Icons.arrow_right,size: 48,)
                            ],
                          )
                            ],
                          ),
                        ),
            
                        
                      ],
                    ),
            
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.13,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 1,
                                    blurRadius: 0.8,
                                    offset: Offset(0, 1)
                                  )
                                ]
                              ),
                             
                              height: MediaQuery.of(context).size.height*0.12,
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: CachedNetworkImage(imageUrl:
                              "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp", ),
                            ),
                          );
                        },), 
                      
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.red,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.green,
                    )
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
