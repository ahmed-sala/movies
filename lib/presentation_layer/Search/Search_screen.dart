import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/services/api_manager.dart';

import '../../data_layer/model/Movies.dart';
import 'movieSearch.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  List<Results> result = [];
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
            height: 48,
            child: TextFormField(
              // controller: textController,

              onChanged: (String? value) {
                searchKey = value ?? '';
                setState(() {});
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(81, 79, 79, 1.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                hintText: 'search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          searchKey.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return SearchItem(
                          loadSearchData().elementAt(index), index);
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 2, right: 2, top: 18, bottom: 18),
                        width: double.infinity,
                        height: 1,
                        color: const Color.fromRGBO(181, 180, 180, 1.0),
                      );
                    },
                    itemCount: loadSearchData().length,
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_movies,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                        size: 150,
                      ),
                      Text(
                        'No movies found',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  List loadSearchData() {
    ApiManager.getSearch(searchKey).then((value) {
      result = value.results ?? [];
    }).onError((error, stackTrace) {
      print('error => ${error.toString()}');
    });
    return result;
  }
}