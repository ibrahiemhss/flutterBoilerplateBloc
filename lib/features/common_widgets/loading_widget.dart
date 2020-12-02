import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String type;
  const LoadingWidget({
    Key key, this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: type==null?CircularProgressIndicator():Container(),
      ),
    );
  }
}
