import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/services/LogInWork.dart';

import 'AccountHelper.dart';

class Account extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AccountHelper>(context, listen: false)
                  .logOutDialog(context);
            },
            icon: Icon(Icons.logout),
            color: constantColors.redColor,
          )
        ],
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.4),
        title: RichText(
          text: TextSpan(
            text: 'My ',
            style: TextStyle(
              color: constantColors.yellowColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: constantColors.greenColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: 580,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: constantColors.blueGreyColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(Provider.of<LogInWork>(context, listen: false).getUserId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return new Column(
                    children: [
                      Provider.of<AccountHelper>(context, listen: false)
                          .headerProfile(context, snapshot.data),
                      Center(
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Row(
                            children: [
                              Spacer(),
                              CircleAvatar(
                                child: Text(
                                  'R',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.purple,
                              ),
                              CircleAvatar(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.indigo),
                              CircleAvatar(
                                child: Text(
                                  'I',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              CircleAvatar(
                                child: Text(
                                  'N',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.green,
                              ),
                              CircleAvatar(
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.yellow),
                              CircleAvatar(
                                child: Text(
                                  'O',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.orange,
                              ),
                              CircleAvatar(
                                child: Text(
                                  'W',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              Spacer(),
                            ],
                          )),
                        ),
                      ),
                      Provider.of<AccountHelper>(context, listen: false)
                          .divider(),
                      Provider.of<AccountHelper>(context, listen: false)
                          .middleProfile(context, snapshot.data),
                      Provider.of<AccountHelper>(context, listen: false)
                          .footerProfile(context, snapshot.data),
                      Center(
                        child: Container(
                            height: 40,
                            child: Row(
                              children: [
                                Spacer(),
                                CircleAvatar(
                                  child: Text(
                                    'R',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.purple,
                                ),
                                CircleAvatar(
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.indigo),
                                CircleAvatar(
                                  child: Text(
                                    'I',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                CircleAvatar(
                                  child: Text(
                                    'N',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                                CircleAvatar(
                                    child: Text(
                                      'B',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.yellow),
                                CircleAvatar(
                                  child: Text(
                                    'O',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.orange,
                                ),
                                CircleAvatar(
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                                Spacer(),
                              ],
                            )),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
