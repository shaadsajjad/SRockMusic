import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MusicTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String logo;
  final String bg;
  final VoidCallback onTap;

  const MusicTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.logo,
    required this.bg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(bg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: SizedBox(
                      width: 47,
                      height: 47,
                      child: CachedNetworkImage(
                        imageUrl: logo,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.broken_image, color: Colors.red),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                      Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ]),
                Image.asset("assets/images/arrow_right.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
