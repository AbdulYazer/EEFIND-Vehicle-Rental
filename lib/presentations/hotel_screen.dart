import 'dart:ffi';

import 'package:eefind_vehicle_rental/core/constants.dart';
import 'package:flutter/material.dart';

const List gridIcons = [
  Icons.people,
  Icons.edit_square,
  Icons.bed,
  Icons.bathtub
];
const List gridNames = ['4 Guests', '3 Rooms', '2 Bedrooms', '1 Bathroom'];

const List listTileIcons = [
  Icons.tv,
  Icons.pool,
  Icons.sanitizer_outlined,
  Icons.sanitizer_outlined,
  Icons.wifi,
  Icons.work_outline_sharp,
  Icons.videocam_outlined,
  Icons.stairs_outlined,
  Icons.pets_outlined
];
const List listTileTitles = [
  '4K Led Tv 55inch',
  'Swimming Pool',
  'Sanitized every room',
  'Bathing Essentials',
  '5g WIFI all around the house',
  'Dedicated Workspace',
  'Security camera on the property',
  'must climb stairs carefully',
  'Security camera on the property'
];

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: 
      const BottomSheetWidget(),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            FirstSection(),
            SecondSection(),
            LastSection(),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle),
      height: 125,
      width: double.infinity,
      child: Column(
        children: [
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('₹7000 ',style: textHeading2,),
                    Text('/night')
                  ],
                ),
                Text('(4th - 6th april)',style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange
                    ),
                    child: const Center(
                      child: Text('Reserve the place',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                    )),
          ),
        ],
      ),
    );
  }
}

class LastSection extends StatelessWidget {
  const LastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 8,
            color: Colors.grey[100],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Beds for comfort sleep',
                  style: textHeading1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => const BedsCard(
                              margin: 10,
                            )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Here\'s what we offer',
                  style: textHeading1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(
                    6,
                    (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(listTileIcons[index]),
                      title: Text(listTileTitles[index]),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Center(
                      child: Text('Show all amenities'),
                    )),
              ],
            ),
          ),
          Divider(
            thickness: 8,
            color: Colors.grey[100],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discover the stay',
                  style: textHeading1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A-10, Phase 2, Bangalore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    '14th Cross Rd, Botanica Garden, JPNagar,\n VI Phase, Bangalore, Karnataka, 560066'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/googlemapImage.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 30,
                          left: 80,
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(50, 52, 62, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  'Approx Location on Map',
                                  style: textHeading2.copyWith(
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                const Text(
                                  'Current location',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.orange,
                                ),
                                Text('View Location')
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Safety & Property',
                  style: textHeading1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                    3,
                    (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(listTileIcons[index + 6]),
                      title: Text(listTileTitles[index + 6]),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Center(
                      child: Text('Read all safety & securities'),
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Availability',
                  style: textHeading1,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]!)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text('25 July  -  27 July  1 guest'),
                          Text(
                            'Change',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cancellation policy',
                            style: textHeading2,
                          ),
                          Text('Cancel anytime before 30 July 2022.',
                              style: TextStyle(height: 1.5))
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'House rules',
                            style: textHeading2,
                          ),
                          Text('Cancel anytime before 30 July 2022.',
                              style: TextStyle(height: 1.5))
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.apartment),
                const Text(
                  'An Entire Place',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(width: 160, child: const Divider())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: GridView.count(
                childAspectRatio: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 0,
                crossAxisCount: 3,
                children: List.generate(
                  4,
                  (index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          gridIcons[index],
                          color: Colors.grey[600],
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(gridNames[index]),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            const Text('Notes from the host', style: textHeading1),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Ellipse 13.png'),
                ),
                title: Text(
                  'Hosted By',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  'Daisy Anderson',
                  style: textHeading2,
                ),
                trailing: Text('Hosting since\n Aug, 2022'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Our luxurious villa, designed to offer a harmonious blend of modern amenities and traditional charm. Situated in an idyllic location, our villa provides an exquisite and serene stay for discerning travelers seeking a sophisticated and unforgettable experience.',
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Read more',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Why book this room?', style: textHeading1),
            const SizedBox(
              height: 20,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.home_work_outlined,
                  size: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hassle free check-in',
                      style: textHeading2,
                    ),
                    Text(
                        'Our in-house caretaker is available 24/7 to assist\n you with anything you need during stay.',
                        style: TextStyle(height: 1.5))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '24x7 power backup',
                      style: textHeading2,
                    ),
                    Text('Extra discount offered for Special members        ',
                        style: TextStyle(height: 1.5))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/hotel.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            const Positioned(
                right: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.grey,
                    ),
                  ],
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
                      '100% Pet friendly pool villa with Lakeview',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          width: 80,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.16),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[700]!)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          width: 160,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.16),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[700]!)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
    );
  }
}

class BedsCard extends StatelessWidget {
  const BedsCard({
    super.key,
    required this.margin,
  });
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Camellia.png'),
                      fit: BoxFit.cover)),
              height: 150,
              width: 230,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deluxe Room', style: textHeading2),
                Text(
                  '132 sqft • Max 2 Adult with 1 child',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.tv,
                            size: 18,
                            color: Colors.grey,
                          ),
                          Text('TV'),
                          Icon(
                            Icons.tv,
                            size: 18,
                            color: Colors.grey,
                          ),
                          Text('TV'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text('+8 more')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
