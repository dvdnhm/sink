import 'package:flutter/material.dart';
import 'package:sink/ui/containers/add_edit_page.dart';
import 'package:sink/ui/containers/entries_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Container(
            child: Text('Sink'),
            alignment: Alignment.center,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            EntryListPage(),
            Center(child: Text('Placeholder for statistics')),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add an expense',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () => showDialog(
              context: context, builder: (context) => AddExpenseScreen()),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.receipt)),
                Tab(icon: Icon(Icons.insert_chart)),
              ],
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.blueGrey,
            ),
          ),
        ),
    );
  }
}
