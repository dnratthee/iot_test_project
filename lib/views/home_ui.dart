import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/config.dart';
import 'package:iot_test_project/utils/store.dart';
import 'package:iot_test_project/views/info_table_ui.dart';
import 'package:iot_test_project/views/info_chart_ui.dart';
import 'package:iot_test_project/views/login_ui.dart';
import 'package:iot_test_project/widgets/my_app_bar.dart';
import 'package:iot_test_project/widgets/my_button_menu.dart';
import 'package:iot_test_project/widgets/my_padding.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: 'Home',
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          tooltip: 'Sing out',
          onPressed: () {
            Store.delete('user');
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginUI()));
          },
        ),
      ],
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 100,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Config.COLOR_BLUE,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  MyPadding(
                    size: 0.01,
                    isFirstChild: true,
                    child: Text(
                      Store.getValue('user', 'fullname'),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                  ),
                  Text(
                    'e-mail : ${Store.getValue('user', 'email')}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButtonMenu(
                          text: "Information Data\nAir Conditioners",
                          width: 0.775,
                          color: Colors.pink,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const InfoTableUI();
                            }));
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 1; i <= 3; i++)
                        MyButtonMenu(
                            text: "A/C $i",
                            color: Colors.green,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InfoTableUI(air: i);
                              }));
                            }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 1; i <= 2; i++)
                        MyButtonMenu(
                            text: "${i == 1 ? "Bar" : "Line"} Chart\nBy Date",
                            width: 0.37,
                            color: Colors.cyan,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InfoChartUI(
                                    type: i == 1 ? "Bar" : "Line");
                              }));
                            }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 1; i <= 3; i++)
                        MyButtonMenu(
                          text: "A/C $i\nBy Date",
                          color: Colors.purple,
                          // onPressed: () {}
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
