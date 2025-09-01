import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../apis/io.dart';
import '../apis/api_service.dart';
import '../user_info.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final username = TextEditingController();
  final password = TextEditingController();
  Map<String, dynamic> loginState = {};

  @override
  void initState() {
    super.initState();
    readJsonAsMap("user_info.json")
        .then((value) {
          setState(() {
            if (value.isNotEmpty) {
              loginState = value;
              if (loginState["isLogin"] == 1) {
                Provider.of<UserInfo>(context, listen: false).login(
                  loginState["username"],
                  loginState["password"],
                  loginState["ID"],
                );
              }
            }
          });
        })
        .catchError((error) {
          log("Error loading user info: $error");
        });
  }

  void showFailLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("登录失败"),
          content: Text("用户名或密码错误，请重试。"),
          actions: [
            TextButton(
              onPressed: () {
                loginState['isLogin'] = 0;
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                loginState['isLogin'] = 0;
                Navigator.of(context).pop();
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (context, userInfo, child) {
        if (userInfo.isLogin == true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '欢迎, ${userInfo.username} !',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<UserInfo>(context, listen: false).logout();
                      deleteLocalFile("user_info.json");
                    });
                  },
                  child: Text('退出登录'),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Text(
                      '登录',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '用户名',
                      hintText: '请输入用户名',
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '密码',
                      hintText: '请输入密码',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      loginState = await ApiService().login(
                        username.text,
                        password.text,
                      );
                      setState(() {
                        switch (loginState["isLogin"]) {
                          case 1:
                            saveLocalFile("user_info.json", loginState);
                            Provider.of<UserInfo>(context, listen: false).login(
                              loginState["username"],
                              loginState["password"],
                              loginState["ID"],
                            );
                            break;
                          case 2:
                            showFailLoginDialog(context);
                            break;
                        }
                      });
                    },
                    child: Text('登录'),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
