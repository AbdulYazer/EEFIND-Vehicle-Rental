import 'package:eefind_vehicle_rental/presentations/home_screen.dart';
import 'package:eefind_vehicle_rental/presentations/hotel_screen.dart';
import 'package:flutter/material.dart';

const List filterIcons = [
  Icons.filter_list,
  Icons.keyboard_arrow_down,
  null,
  null
];

const List filterNames = ['Filter', 'Sort', 'popular near me', 'on Discount'];

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: appBar(context),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: List.generate(4, (index) => const ListingTabs()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSize appBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(170.0),
    child: AppBar(
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.transparent,
      ),
      elevation: 0,
      flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child: const SearchBox()),
      bottom: TabBar(
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.orange,
        indicatorColor: Colors.orange,
        isScrollable: true,
        tabs: [
          tabs(
            icon: Icons.room_preferences,
            text: 'Private Rooms',
          ),
          tabs(
            icon: Icons.games,
            text: 'Play',
          ),
          tabs(
            icon: Icons.event_sharp,
            text: 'Party/Events',
          ),
          tabs(
            icon: Icons.home_work_sharp,
            text: 'Work Spaces',
          ),
        ],
      ),
    ),
  );
}

Column tabs({required String text, required IconData icon}) {
  return Column(
    children: [
      const SizedBox(height: 5),
      Icon(
        icon,
        // color: Colors.grey,
        size: 25,
      ),
      const SizedBox(height: 5),
      Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 5),
    ],
  );
}

class ListingTabs extends StatelessWidget {
  const ListingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 70,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => FilterPart(
                            icon: filterIcons[index],
                            text: filterNames[index],
                          ))),
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey[200],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '   42 Properties found',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(
                      4,
                      (index) => InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => HotelScreen())),
                            child: const PropertiesCard(
                              margin: 10,
                            ),
                          )),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class FilterPart extends StatelessWidget {
  const FilterPart({
    super.key,
    this.icon,
    required this.text,
  });
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all()),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          child: Row(
            children: [Text(text), Icon(icon)],
          ),
        ),
      ),
    );
  }
}

class PropertiesCard extends StatelessWidget {
  const PropertiesCard({
    super.key,
    required this.margin,
  });
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(margin),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/Camellia.png'),
                        fit: BoxFit.fitWidth)),
                height: 220,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      const Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'The Camellia',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              const Text(
                                'Double deluxe with attached bath',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.16),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey[700]!)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '(83)',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.16),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey[700]!)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '14th Avn, Bangalore',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          '₹11,499',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(' / night')
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.pets,
                          size: 10,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Pet Friendly',
                          style: TextStyle(fontSize: 10, color: Colors.orange),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  height: 30,
                  width: 180,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Ellipse 13.png'),
                        radius: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Rooms Hosted by Daisy',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 95,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 40,
              width: 320,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.bed,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                        const Text('Bedroom 2'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.edit_square,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                        const Text('1560 sqft')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
