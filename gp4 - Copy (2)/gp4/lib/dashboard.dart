import 'package:flutter/material.dart';
import 'package:gp4/utils.dart' as date_util;
import 'package:numberpicker/numberpicker.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();
  late double initialOffset;

  @override
  void initState() {
    super.initState();
    setup();
  }

  void setup() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      height: 150,
      child: ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: currentMonthList.length,
      itemBuilder: (BuildContext context, int index) {
        return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Container(
          width: 71,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: (currentMonthList[index].day != currentDateTime.day)
                  ? [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.6)
                    ]
                  : [
                      Colors.black,
                      const Color.fromARGB(0xFF, 0x14, 0x32, 0x3E),
                      const Color.fromARGB(0xFF, 0x1F, 0x7F, 0x8D)
                    ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: const [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  currentMonthList[index].day.toString(),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? Colors.white
                        : Colors.white,
                  ),
                ),
                Text(
                  date_util.DateUtils
                      .weekdays[currentMonthList[index].weekday - 1],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? Colors.white
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget topView() {
    return Container(
      height: height * 0.3,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hrizontalCapsuleListView(),
        ],
      ),
      padding: const EdgeInsets.only(top: 0.1), // Adjust the top padding here
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    int selectedIndex = currentMonthList.indexWhere((date) => date.day == currentDateTime.day);
    initialOffset = selectedIndex * 80.0 - (MediaQuery.of(context).size.width / 2 - 40) + 40 - (80 / 2); // Adjusted initial offset
    scrollController = ScrollController(initialScrollOffset: initialOffset);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(0xFF, 0x1F, 0x7F, 0x8D),
            Color.fromARGB(0xFF, 0x14, 0x32, 0x3E),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date_util.DateUtils
                    .months[currentDateTime.month - 1] +
                    ' ' +
                    currentDateTime.day.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0xFF, 0x1F, 0x7F, 0x8D),
                  Color.fromARGB(0xFF, 0x14, 0x32, 0x3E),
                ],
              ),
            ),
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 80,
                        color: Colors.white,
                      ),
                      Text(
                        'username',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
            children: [
              topView(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Slept at: ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10),
                      ),                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberPicker(
                            minValue: 0,
                            maxValue: 12,
                            value: hour,
                            zeroPad: true,
                            infiniteLoop: true,
                            itemWidth: 80,
                            itemHeight: 60,
                            onChanged: (value) {
                              setState(() {
                                hour = value;
                              });
                            },
                            textStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                            selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                  ),
                                  bottom: BorderSide(color: Colors.white)),
                            ),
                          ),
                          NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: minute,
                            zeroPad: true,
                            infiniteLoop: true,
                            itemWidth: 80,
                            itemHeight: 60,
                            onChanged: (value) {
                              setState(() {
                                minute = value;
                              });
                            },
                            textStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                            selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                  ),
                                  bottom: BorderSide(color: Colors.white)),
                            ),
                          ),                        
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    timeFormat = "AM";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: timeFormat == "AM" ? Colors.grey.shade800 : Colors.grey.shade700,
                                    border: Border.all(
                                      color: timeFormat == "AM" ? Colors.grey : Colors.grey.shade700,
                                    ),
                                  ),
                                  child: const Text(
                                    "AM",
                                    style: TextStyle(color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),                              
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    timeFormat = "PM";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: timeFormat == "PM" ? Colors.grey.shade800 : Colors.grey.shade700,
                                    border: Border.all(
                                      color: timeFormat == "PM" ? Colors.grey : Colors.grey.shade700,
                                    ),
                                  ),
                                  child: const Text(
                                    "PM",
                                    style: TextStyle(color: Colors.white, fontSize: 25),
                                  ),
                                ),                                
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [

                    // Add your container content here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}