import 'package:flutter/material.dart';
import 'package:ollie_photo_social/components/bottom_next.dart';
import 'package:ollie_photo_social/components/round_checkbox.dart';
import 'package:ollie_photo_social/constants.dart';
import 'package:ollie_photo_social/components/polling_back_icon.dart';
import 'package:ollie_photo_social/mock_data/user_data.dart';
import 'package:ollie_photo_social/model/user.dart';
import 'package:ollie_photo_social/pages/polling_complete.dart';

class SharePage extends StatefulWidget {
  SharePage({Key key}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  String dropdownValue = '1 hour';
  Widget _buildShareUser(int index) {
    User user = userList[index];

    return Container(
      padding: EdgeInsets.all(appPadding * 2 / 3),
      margin: EdgeInsets.only(bottom: appPadding / 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(appPadding),
          bottomRight: Radius.circular(appPadding),
        ),
        gradient:
            LinearGradient(colors: [primaryGrdStartColor, primaryGrdStopColor]),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: appPadding * 2,
                  width: appPadding * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/avatar/${user.imageUrl}"),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            RoundCheckbox(),
          ]),
    );
  }

  void nextAction() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PollingCompletePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle radioStyle = TextStyle(
      color: white,
      fontSize: 16, /* fontWeight: FontWeight.bold */
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Image(
              image: AssetImage('assets/images/layout/new_polling_topbar.png'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                PollingBackIcon(
                  title: 'Share to',
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(appPadding),
                    margin: EdgeInsets.only(top: appPadding),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/icon/map_white.png"),
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Publik', style: radioStyle)
                                  ],
                                ),
                                Radio(
                                    value: false,
                                    groupValue: null,
                                    onChanged: null)
                              ],
                            ),
                            Divider(
                              color: white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/icon/group_white.png"),
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('All Friends', style: radioStyle)
                                  ],
                                ),
                                Radio(
                                    value: false,
                                    groupValue: null,
                                    onChanged: null)
                              ],
                            ),
                            Divider(
                              color: white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/icon/users_white.png"),
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Specific Friends', style: radioStyle)
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                  height: 40,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(20 + appPadding / 2),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: appPadding,
                                  right: appPadding / 2,
                                  top: appPadding / 8,
                                  bottom: appPadding / 8,
                                ),
                                color: grayColor,
                                height: 40 + appPadding / 4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Type name here",
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      width: appPadding / 3,
                                    ),
                                    Container(
                                      height: 50,
                                      padding: EdgeInsets.all(appPadding / 6),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor),
                                      child: Icon(Icons.add,
                                          color: white, size: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: userList.length,
                            itemBuilder: (context, index) =>
                                _buildShareUser(index),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Step 2 of 2', style: TextStyle(color: white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNextIcon(
            nextAction: nextAction,
          )
        ],
      ),
    );
  }
}
