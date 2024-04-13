import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:milestone_4/app/theme/color.dart';

import '../../../widget/card_movie.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 225,
        height: double.infinity, // Adjusted height to fit the content
        decoration: BoxDecoration(
          color: backgroundColor, // Added background color
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'assets/images/your_image_asset.png'), // Provide image asset path
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Rookie Rebels',
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Search',
              style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: Column(
            children: [
              TextField(
                cursorColor: primaryColor,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF3A3F47),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF3A3F47),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  fillColor: Color(0xFF3A3F47),
                  filled: true,
                  hintText: 'Spiderman',
                  hintStyle: TextStyle(
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: greyDark,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CardMovie(
                image: 'spiderman',
                title: 'Spiderman',
                rate: '9.5',
                ticket: 'Action',
                date: '2019',
                duration: '139 Minutes',
              ),
              SizedBox(
                height: 24,
              ),
              CardMovie(
                image: 'spiderman_nwh',
                title: 'Spider-man : No Way Home',
                rate: '8.5',
                ticket: 'Action',
                date: '2021',
                duration: '139 Minutes',
              )
            ],
          ),
        ),
      ),
    );
  }
}
