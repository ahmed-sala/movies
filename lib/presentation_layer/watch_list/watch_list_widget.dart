import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/showLoadingUtils.dart';

class WatchlistWidget extends StatefulWidget {
  WatchAdd watchs;
  WatchlistWidget(this.watchs);

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}

class _WatchlistWidgetState extends State<WatchlistWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500' +
                        '${widget.watchs.imageUel}',
                    width: 140,
                    height: 89,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.watchs.title ?? "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.watchs.time ?? "",
                        style: const TextStyle(
                            color: Color(0xFF707070), fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/star-2.png',
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.watchs.average ?? "",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                left: size.width * 0.065,
                child: InkWell(
                  onTap: (){
                    MyDataBase.deleteWatch(widget.watchs).then((value) {
                      showMessage(context, 'Film deleted successfully',
                          posActionName: 'Ok');
                    }).onError((error, stackTrace) {
                      showMessage(
                          context,
                          'Something went wrong,'
                              'Please try again later',
                          posActionName: 'Ok');
                    }).timeout(Duration(seconds: 5), onTimeout: () {
                      showMessage(context, 'Data delete locally',
                          posActionName: 'Ok');
                    });
                  },
                    child: Image.asset(
                  'assets/images/bookmark_marked.png',
                  width: 15,
                  height: 20,
                ))),
          ],
        ),
      ),
    );
  }
}
