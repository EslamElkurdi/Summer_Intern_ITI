// Assets
//  1. images

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetsSection extends StatelessWidget {
  const AssetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
        title: Text("Assets Section")),
      body: Column(
        children: [
          Image.asset(
            'assets/image.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 10),

          // Network Image
          //   Image.network(
          //     "https://upload.wikimedia.org/wikipedia/commons/b/b1/VAN_CAT.png",
          //     width: 200,
          //     height: 200,
          //   ),

          // Cached Network Image
          CachedNetworkImage(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/b/b1/VAN_CAT.png',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          SizedBox(height: 30),

          // local font
          Text(
            " I am using local font",
            style: TextStyle(fontSize: 30, fontFamily: 'Cairo'),
          ),

          // network
          // Google Fonts
          Text(
            "Hello I am Eslam",
            style: GoogleFonts.aBeeZee(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent,
            ),
          ),

          //
        ],
      ),
    );
  }
}
