import 'package:flutter/material.dart';
import 'StaggeredView.dart';
import '../Models/Note.dart';
import 'NotePage.dart';
import '../Models/Utility.dart';

enum viewType {
  List,
  Staggered
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var notesViewType ;
  @override void initState() {
    notesViewType = viewType.Staggered;
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(

        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
            elevation:4.0,
            icon: const
            Icon(Icons.add), label: const Text('NEW NOTE'),
            onPressed: (){_newNoteTapped(context);}),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[IconButton(icon: Icon(notesViewType == viewType.List ?  Icons.developer_board : Icons.view_headline,
              color: CentralStation.fontColor,), onPressed: (){_toggleViewType();})],
          ),
        ),
        body: SafeArea(child: _body(), right: true, left: true, top: true, bottom: true,),
      );

  }

  Widget _body() {
    print(notesViewType);
    return Container(child: StaggeredGridPage(notesViewType: notesViewType,));
  }

  Widget _bottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "New Note\n",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _newNoteTapped(context),
        )
      ],
    );
  }


  void _newNoteTapped(BuildContext ctx) {
    // "-1" id indicates the note is not new
    var emptyNote = new Note(-1, "", "", DateTime.now(), DateTime.now(), Colors.white);
    Navigator.push(ctx,MaterialPageRoute(builder: (ctx) => NotePage(emptyNote)));
  }

  void _toggleViewType(){
    setState(() {
      CentralStation.updateNeeded = true;
      if(notesViewType == viewType.List)
      {
        notesViewType = viewType.Staggered;

      } else {
        notesViewType = viewType.List;
      }

    });
  }

  List<Widget> _appBarActions() {

    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          child: GestureDetector(
            onTap: () => _toggleViewType() ,
            child: Icon(
              notesViewType == viewType.List ?  Icons.developer_board : Icons.view_headline,
              color: CentralStation.fontColor,
            ),
          ),
        ),
      ),
    ];
  }
}