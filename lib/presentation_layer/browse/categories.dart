import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/GenersModel.dart';
import 'package:movies_app/data_layer/services/api_manager.dart';
import 'package:movies_app/presentation_layer/browse/categoryWidget.dart';
import 'package:movies_app/presentation_layer/browse/category_model.dart';

class CategoryFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var category = CategoryModel.getAllCategoreies(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 18),

        child: Column(
          children: [
            const Text('Browse Category',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold
                  , color: Colors.white),
            ),
            const SizedBox(height: 10,),
            FutureBuilder<GenersModel>(
              future: ApiManager.getGeners(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  print('error = ${snapShot.error.toString()}');
                  return Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 100),
                      alignment: AlignmentDirectional.center,
                      child: const Text(
                        'No Internet Found',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ));
                }
                else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: const CircularProgressIndicator(),
                  );
                }
                var data = snapShot.data;
                List <Genres> geners = data!.genres!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 2
                    ),
                    itemBuilder: (_, index) {
                      return CategoryWidget(
                          category[index], geners.elementAt(index));
                    },
                    itemCount: geners.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
