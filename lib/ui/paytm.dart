import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paytm_clone_ui/constant/constant.dart';
import 'package:paytm_clone_ui/model/grid_model.dart';
import 'package:paytm_clone_ui/model/image_slider_model.dart';

class Paytm extends StatefulWidget {
  const Paytm({Key? key}) : super(key: key);

  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<Paytm> {
  final int _currentIndex = 0;
  int _currentIndexUp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: _bodyItem(),
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: _bottomTab());
  }

  appBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          const Icon(Icons.dehaze),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 40,
              width: MediaQuery.of(context).size.width / 1.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      "assets/uanotif_nomessage.png",
                      color: Colors.blue,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      elevation: 0,
    );
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home.png",
                width: 24.0,
                height: 24.0,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/shopping-bagg.png",
                width: 24.0,
                height: 24.0,
              ),
              label: 'Mall'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/qr-code.png",
                width: 24.0,
                height: 24.0,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bank.png",
                width: 24.0,
                height: 24.0,
              ),
              label: 'Bank'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/delivery.png",
                width: 24.0,
                height: 24.0,
              ),
              label: 'Inbox'),
        ]);
  }

  Widget _bodyItem() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            color: Colors.blue[800],
            child: CarouselSlider(
              items: List<GridView>.generate((2), (int index) {
                return GridView.count(
                  crossAxisCount: 4,
                  children: List<GridItemTop>.generate((4), (int index) {
                    return GridItemTop(_getGridList()[index + _currentIndexUp]);
                  }),
                );
              }),
              options: CarouselOptions(
                reverse: false,
                aspectRatio: 5,
                viewportFraction: 1.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: false,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  _currentIndexUp = index;
                  logs('Current index --> $_currentIndex');
                  setState(() {});
                },
              ),
            ),
          ),
          Container(
            color: Colors.blue[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (int index) {
                return dots(_currentIndexUp, index);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Icon(Icons.highlight),
                  const Text('Get Rs.1000 Cashback on Auto/Taxi rides !'),
                  Image.asset(
                    "assets/right-arrow.png",
                    height: 13,
                    width: 13,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: List<GridItem>.generate(12, (int index) {
              return GridItem(_getGridItemList()[index]);
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 5),
            child: Container(
              color: Colors.white,
              child: CarouselSlider(
                items: carouselSliderList(_getImageSliderList()),
                options: CarouselOptions(
                  aspectRatio: 2,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    _currentIndexUp = index;
                    logs('Current index --> $_currentIndex');
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<GridModel> _getGridItemList() {
    List<GridModel> list = <GridModel>[];
    list.add(GridModel("assets/smartphone.png", "Mobile\nprepaid", null));
    list.add(GridModel("assets/airplane.png", "Flights", null));
    list.add(GridModel("assets/access.png", "Movie Tickets", null));
    list.add(GridModel("assets/hand.png", "Events", null));
    list.add(
        GridModel("assets/phone-charge.png", "Mobile        Postpaid", null));
    list.add(GridModel("assets/console.png", "Games", null));
    list.add(GridModel("assets/gold.png", "Gold", null));
    list.add(GridModel("assets/iocl_tip.png", "Electricity", null));
    list.add(GridModel("assets/train_help.png", "Train Tickets", null));
    list.add(
      GridModel("assets/shopping-bag.png", "Shopping", null),
    );
    list.add(GridModel("assets/satellite-dish.png", "DTH", null));
    list.add(GridModel("assets/placeholder_inapp_merchants.png", "More", null));
    return list;
  }

  List<GridModel> _getGridList() {
    List<GridModel> list = <GridModel>[];
    list.add(GridModel("assets/send_money.png", "Pay", Colors.white));
    list.add(GridModel("assets/money_transfer.png", "UPI", Colors.white));
    list.add(
        GridModel("assets/ic_passbook_header.png", "Passbook", Colors.white));
    list.add(
        GridModel("assets/calendar_blue.png", "Paytm\nPostpaid", Colors.white));
    list.add(
        GridModel("assets/add_money_passbook.png", "Add Money", Colors.white));
    list.add(GridModel("assets/book.png", "Link Account", Colors.white));
    list.add(GridModel(
        "assets/ic_passbook_header.png", "Link Account", Colors.white));
    list.add(GridModel("assets/book.png", "Link Account", Colors.white));

    return list;
  }

  List<ImageSliderModel> _getImageSliderList() {
    List<ImageSliderModel> list = <ImageSliderModel>[];

    list.add(ImageSliderModel("assets/real.jpg"));
    list.add(ImageSliderModel("assets/real.jpg"));
    list.add(ImageSliderModel("assets/real.jpg"));
    list.add(ImageSliderModel("assets/real.jpg"));

    return list;
  }

  carouselSliderList(List<ImageSliderModel> getImageSliderList) {
    return getImageSliderList.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: dotColor(index)));
    }
  }

  Widget imageSliderItem(ImageSliderModel i) {
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            i.path,
            fit: BoxFit.cover,
          ),
        ));
  }

  Color dotColor(int index) {
    return _currentIndexUp == index ? Colors.white : Colors.grey;
  }
}

class GridItem extends StatelessWidget {
  final GridModel gridModel;

  const GridItem(this.gridModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                gridModel.imagePath!,
                width: 30,
                height: 30,
                color: gridModel.color,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  gridModel.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItemTop extends StatelessWidget {
  final GridModel gridModel;

  const GridItemTop(this.gridModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              gridModel.imagePath!,
              width: 30,
              height: 30,
              color: gridModel.color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                gridModel.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
