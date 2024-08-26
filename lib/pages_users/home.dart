import 'package:e_comm/Provider/user_provider.dart';
import 'package:e_comm/Models/User_data.dart';
import 'package:e_comm/pages_users/productDetail.dart';
import 'package:e_comm/support_widget/support.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final routename = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Categories = [
    'images/headphone2.png',
    'images/laptop.png',
    'images/TV.png',
    'images/watch2.png'
  ];
  updatedata() async {
    UserProvider _userp = Provider.of(context, listen: false);
    await _userp.refreshUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatedata();
  }

  UserData? userData;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget? child) {
      return value.getUser == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Color.fromARGB(255, 250, 247, 247),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 13,
                    top: 50,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hey ${value.getUser!.Name}",
                                style: AppWidget.BoldTextsyle(),
                              ),
                              Text(
                                "Good Morning",
                                style: AppWidget.lisghtTextsyle(),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'images/boy.jpg',
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search_sharp),
                            hintText: "Search Products ",
                            hintStyle: AppWidget.lisghtTextsyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: AppWidget.SemiboldBoldTextsyle(),
                          ),
                          const Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            height: 120,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 33,
                            ),
                            child: Text(
                              "ALL",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: Categories.length,
                                  itemBuilder: (context, index) {
                                    return CategoryTile(
                                      image: Categories[index],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Products",
                            style: AppWidget.SemiboldBoldTextsyle(),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            height: 180,
                            padding: EdgeInsets.all(
                              22,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Productdetail(
                                          name: "Laptop",
                                          image: 'images/laptop2.png',
                                          price: '\$ 100',
                                          detail: '''
      With Mic:Yes
      Bluetooth version: 5
      Offers playback time of up to 8 hours for every charge. Total play-time of up to 32 Hours
      Lightning Boult Type-C Fastest Charging | 10 Mins Charge = 100 Mins Playtime
      Providing Pro+ Calling | BoomX Tech for Supreme Bass
      Touch Controls: With one multifunction button, you can play/pause, previous/next track and answer/hang-up calls.
      Voice assistant function lets you access Siri/Google Assistant.
      IPX5 Water Resistant : Can comfortably be used in the outdoors or in the gym.
      Crafted in India, for India
      ''');
                                    }));
                                  },
                                  child: Image.asset(
                                    'images/laptop.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ 100",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
