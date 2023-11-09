import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/strings.dart';
import '../widget/common/stroked_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    movieBloc.getMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.black,
            title: Text(
              Strings.appTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawer: Drawer(
            backgroundColor: Colors.black,
            child: Center(
              child: Text("TEST"),
            ),
          ),
          body: StreamBuilder(stream: stream, builder: builder)),
    );
  }
}
