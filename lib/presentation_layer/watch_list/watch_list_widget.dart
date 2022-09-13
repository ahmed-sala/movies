import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/database/data_model.dart';

class WatchlistWidget extends StatefulWidget {
  WatchAdd watchs;
  WatchlistWidget(this.watchs);

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}
class _WatchlistWidgetState extends State<WatchlistWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500' + '${widget.watchs.imageUel}',
              width: 140,
              height: 89,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.watchs.title ?? "",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.watchs.time ?? "",
                  style:
                      const TextStyle(color: Color(0xFF707070), fontSize: 13),
                ),
                SizedBox(
                  height: 5,
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
          ),
        ],
      ),
    );
  }
}
