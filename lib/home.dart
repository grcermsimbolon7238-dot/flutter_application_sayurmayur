import 'package:flutter/material.dart';
import 'package:flutter_application_sayurmayur/screen/sayur_page.dart';
import 'package:flutter_application_sayurmayur/widget/navbar_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Pembelian Sayur',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 8.0),
          Text(
            'List Sayur Tegar',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelColor: const Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 24),
            unselectedLabelColor: const Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('Sayur Box',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0)),
              ),
              Tab(
                child: Text('Sayur Slice',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0)),
              ),
              Tab(
                child: Text('Sayur Mayur',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 160.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                SayurPage(),
                SayurPage(),
                SayurPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
