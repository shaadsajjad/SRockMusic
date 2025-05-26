import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srockmusic/viewmodels/music_tile_viewmodel.dart';
import 'package:srockmusic/views/detailScreen.dart';
import 'package:srockmusic/widgets/music_tile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MusicTileViewModel>(context, listen: false)
            .fetchMusicTileList());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MusicTileViewModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 370,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA90140),
                      Color(0xFF550120),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 320,
                          height: 44,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search_rounded,
                                  color: Colors.white, size: 20),
                              hintText: 'Search "Punjabi Lyrics"',
                              hintStyle: const TextStyle(
                                  color:Color.fromRGBO(97, 97, 107, 1),
                                fontSize: 14,
                                fontFamily: "Syne",
                                fontWeight: FontWeight.w500

                              ),
                              suffixIcon: const Icon(Icons.mic_rounded,
                                  color: Colors.white, size: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(47, 47, 57, 1),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/Generic avatar.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      "Claim your",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Syne",
                      ),
                    ),
                    const Text(
                      "Free Demo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lobster",
                      ),
                    ),
                    const Text(
                      "for custom Music Production",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Syne",
                      ),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Syne",
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),

              // 🎵 Record image (bottom-left corner)
              Positioned(
                bottom: 10,
                left: -35,
                child: Image.asset(
                  "assets/images/Layer_1 (2).png", // Add this image to your assets
                  width: 135,
                ),
              ),

              // 🎹 Piano image (top-right corner)
              Positioned(
                bottom: 10,
                right: -40,
                child: Image.asset(
                  "assets/images/Layer_1 (3).png", // Add this image to your assets
                  width: 135,
                ),
              ),
              Positioned(
                  top: 71,
                  left: 293,
                  child: Container(
                width: 0.5,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border(left: BorderSide(width: 1,color: Colors.grey))

                ),
              ))
            ],
          ),
          Expanded(
            child: Container(
              color: const Color.fromRGBO(24, 23, 28, 1),
              width: double.infinity,
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemCount: provider.musicTileList.length,
                itemBuilder: (context, index) {
                  final tile = provider.musicTileList[index];
                  return MusicTile(
                    bg: tile.bg,
                    logo: tile.logo,
                    title: tile.title,
                    subtitle: tile.subtitle, // fix spelling if needed
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailscreen(
                            title: tile.title,
                            subtitle: tile.subtitle,
                            logo: tile.logo,
                            bg: tile.bg,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children:[ Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            border: Border(top: BorderSide(color: Colors.white, width: 0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(24, 23, 28, 1),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/Clip path group.png"),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/Vector.png"),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/Icon.png"),
                  label: 'TrackBox',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/Union.png"),
                  label: 'Projects',
                ),
              ],
            ),
          ),
        ),
          Positioned(
            left: 43,
            child: Container(
            height: 7,
            width: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(1000),
    bottomLeft: Radius.circular(1000)
    )
              )
            ),
          )
    ]
      ),
    );
  }
}
