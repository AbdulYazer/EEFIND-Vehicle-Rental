import 'package:eefind_vehicle_rental/core/constants.dart';
import 'package:eefind_vehicle_rental/presentations/listing_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

const List placesImgUrl = [
  'assets/images/Bangalore.png',
  'assets/images/Delhi.png',
  'assets/images/Bangalore.png',
  'assets/images/Mumbai.png',
  'assets/images/Bangalore.png',
  'assets/images/Delhi.png',
  'assets/images/Bangalore.png',
  'assets/images/Delhi.png'
];
const List placesName = [
  'Bangalore',
  'Delhi',
  'Bangalore',
  'Mumbai',
  'Bangalore',
  'Delhi',
  'Bangalore',
  'Delhi',
];

const List cardColors = [
  Color.fromRGBO(255, 237, 247, 1),
  Color.fromRGBO(255, 239, 219, 1),
  Color.fromRGBO(255, 237, 247, 1),
  Color.fromRGBO(226, 246, 248, 1),
  Color.fromRGBO(255, 237, 247, 1),
  Color.fromRGBO(255, 239, 219, 1),
  Color.fromRGBO(255, 237, 247, 1),
  Color.fromRGBO(255, 239, 219, 1),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const SearchBox(),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        selectedBackgroundColor: Colors.transparent,
        currentIndex: 0,
        items: [
          FloatingNavbarItem(icon: Icons.home_outlined, title: 'Home'),
          FloatingNavbarItem(icon: Icons.garage_outlined, title: 'Garage'),
          FloatingNavbarItem(
              icon: Icons.calendar_month_outlined, title: 'Bookings'),
          FloatingNavbarItem(
              icon: Icons.auto_graph_outlined, title: 'Earnings'),
        ],
        onTap: (int val) {},
      ),
      body: ListView(
        children: [
          const FirstHomeSection(),
          Divider(
            thickness: 10,
            color: Colors.grey[200],
          ),
          const SizedBox(
            height: 10,
          ),
          const LastHomeSection(),
        ],
      ),
    );
  }
}

class LastHomeSection extends StatelessWidget {
  const LastHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trending Places', style: textHeading1),
          const Text('Book now for the best experiences!'),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListingScreen())),
                  child: const TrendingCard(
                    margin: 10,
                  ),
                ),
              ),
              // [
              //   TrendingCard(),
              // ],
            ),
          )
        ],
      ),
    );
  }
}

class FirstHomeSection extends StatelessWidget {
  const FirstHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: .7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: cardColors[index],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(placesImgUrl[index]),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(placesName[index]),
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              title: Text(
                'Current Location',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Turn on your device\'s GPS',
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(
                Icons.location_on,
                color: Colors.orange,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.margin,
  });
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(margin),
      child: Column(
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
                    fit: BoxFit.cover)),
            height: 180,
            width: 230,
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
                            '14th Avn, Near by Mg Street Bangalore',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            width: 80,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.16),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey[700]!)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: const [
                Text(
                  '₹11,499',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(' / night')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: const [
              SizedBox(
                width: 290,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search city, place, area',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  color: Colors.orange,
                )),
          ),
        )
      ],
    );
  }
}
