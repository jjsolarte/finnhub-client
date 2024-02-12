import 'package:finnhub_client/ui/alert/alert_page.dart';
import 'package:finnhub_client/ui/page_view/widget/bottom_nav_item.dart';
import 'package:finnhub_client/ui/stock/ui/stock_page.dart';
import 'package:finnhub_client/ui/trader/ui/trader_page.dart';
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int _currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finnhub'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          _currentPage = page;
          setState(() {});
        },
        children: const [
          AlertPage(),
          StockPage(),
          TraderPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavItem(
                itemSelected: _currentPage,
                bottomItem: 0,
                iconData: Icons.add_alert,
                callback: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                  _currentPage = 0;
                }),
            BottomNavItem(
                itemSelected: _currentPage,
                bottomItem: 1,
                iconData: Icons.card_travel,
                callback: () {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                  _currentPage = 1;
                }),
            BottomNavItem(
                itemSelected: _currentPage,
                bottomItem: 2,
                iconData: Icons.grade,
                callback: () {
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                  _currentPage = 2;
                }),
          ],
        ),
      ),
    );
  }
}
