import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:milestone_4/app/routes/app_pages.dart';
import 'package:milestone_4/app/theme/color.dart';

import '../../../widget/card_movie.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 275,
        height: double.infinity, 
        decoration: BoxDecoration(
          color: backgroundColor, 
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align children to the start
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo/popcorn.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Rookie Rebels',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/icons/navHome.png',
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/icons/navWatchList.png',
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        'Watch List',
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
              width: 275,
              color: Color(0xFF4F4F4F),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'email@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    icon: Image.asset(
                      'assets/images/icons/logout.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: white),
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
  Future<List<Movie>> _fetchMovies(String searchTerm) async {
    // Initialize Hive and Dio (assuming they are already initialized in your app)
    await initializeHive();
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/search/movie',
        queryParameters: {
          'api_key': YOUR_TMDB_API_KEY, // Replace with your actual key
          'language': 'en-US',
          'query': searchTerm,
        },
      );

      final results = response.data['results'] as List;
      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } on DioError catch (e) {
      // Handle DioError (e.g., network errors, status code errors)
      print(e);
      return []; // Return empty list on error
    }
  }
}
