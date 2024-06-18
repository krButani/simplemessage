import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:simplemessage/bloc/network/network_bloc.dart';
import 'package:simplemessage/bloc/network/network_state.dart';
import 'package:simplemessage/bloc/userblock/user_bloc.dart';
import 'package:simplemessage/bloc/userblock/user_event.dart';
import 'package:simplemessage/bloc/userblock/user_state.dart';
import 'package:simplemessage/controller/ui/usertextboxcontroller.dart';
import 'package:simplemessage/model/users.dart';
import 'package:simplemessage/views/ui/messageCard.dart';
import 'package:simplemessage/views/ui/textboxui.dart';

import '../config/krButani/all.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late KSize k;
  final UserTextBoxController sch = UserTextBoxController();

  late DB db;
  bool isSync = false;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: kbgColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
    ThemeClass.setRotations();

    db = DB();
    BlocProvider.of<UserBloc>(context).add(LoadUsers());


    super.initState();
    createdb();
  }

  void createdb() async {
    await db.onCreate([
      "users",
    ]);
    checkSync();

  }
  void checkSync() async {
    if(context.read<NetworkBloc>().state.isConnected == true) {
      List<Map> mp = await db
          .getData("SELECT * FROM ${db.workinglist[0].tblnm}")
          .then((mp) {
        return mp;
      });

      // it return array of object
      if (mp.length > 0) {
        List<Users> list = [];
        for (int i = 0; i < mp.length; i++) {
          list.add(Users(
            id: mp[i]['storeid'].toString(),
            firstname: mp[i]['firstname'].toString(),
            lastname:  mp[i]['lastname'].toString(),
            email: mp[i]['email'].toString(),
            message: mp[i]['message'].toString(),
          ));

        }

        BlocProvider.of<UserBloc>(context).add(SyncUsers(list));

      }
    }
  }

  void deleteAllRecord() async {
    int count = await db
        .delete("DELETE FROM ${db.workinglist[0].tblnm}")
        .then((value) {
      return value;
    });
  }
  bool validate() {
    bool status = false;
    // remove validation
    sch.firstnameTH.errorText = "";
    sch.lastnameTH.errorText = "";
    sch.emailTH.errorText = "";
    sch.messageTH.errorText = "";

    if(sch.firstnameTH.tc.text.toString().trim() == "") {
      sch.firstnameTH.errorText = lang.en("firstname_required");
      status = true;
    }
    if(sch.lastnameTH.tc.text.toString().trim() == "") {
      sch.lastnameTH.errorText = lang.en("lastname_required");
      status = true;
    }
    if(sch.emailTH.tc.text.toString().trim() == "") {
      sch.emailTH.errorText = lang.en("email_required");
      status = true;
    }
    if(sch.messageTH.tc.text.toString().trim() == "") {
      sch.messageTH.errorText = lang.en("message_required");
      status = true;
    }
    return status;
  }

  void savedata() async {

      if(validate()==false) {
        if(context.read<NetworkBloc>().state.isConnected == true) {
          final user = Users(
            id: DateTime.now().toString(),
            firstname: sch.firstnameTH.tc.text.toString().trim(),
            lastname: sch.lastnameTH.tc.text.toString().trim(),
            email: sch.emailTH.tc.text.toString().trim(),
            message: sch.messageTH.tc.text.toString().trim(),
          );
          BlocProvider.of<UserBloc>(context).add(AddUser(user));
          kbNToast("Users message sent Successfully.", 's', context);
          resetfields();

        } else {
          // save db
          List<String> col = db.workinglist[0].col;
          List<String> tval = [];

          tval.add(DateTime.now().toString());
          tval.add(sch.firstnameTH.tc.text.toString().trim());
          tval.add(sch.lastnameTH.tc.text.toString().trim());
          tval.add(sch.emailTH.tc.text.toString().trim());
          tval.add(sch.messageTH.tc.text.toString().trim());
          String d = db.workinglist[1].getInsertRecord(col, tval);
          if (d != null && d != "") {
            int k = await db.save(d).then((value) => value);
            if (k == 0) {
              kbNToast(
                  "We are unable to send message. Please try again.", 'e', context);
            } else {
              kbNToast("Users message sent Successfully.", 's', context);
              resetfields();
            }
          }
        }

      } else {
        setState(() {});
      }
  }

  void resetfields() {
    sch.firstnameTH.tc.text = "";
    sch.lastnameTH.tc.text = "";
    sch.emailTH.tc.text = "";
    sch.messageTH.tc.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    k = new KSize(context, 0);
    final UserBloc _UserBloc = BlocProvider.of<UserBloc>(context);
  
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
      if (state.isConnected) {
        checkSync();
      }
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbgColor,
        body: Container(
          width: k.w(100),
          height: k.h(100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: k.h(2),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: k.w(5)),
                  child: Text('User Details', style: ThemeClass.setStyle(
                      fontWeight: FontWeight.w900,
                    fontSize: 36.kp
                  ),),
                ),
                SizedBox(height: k.h(2),),
                Container(
                  width: k.w(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: TextBoxUi(k:k,sch: sch.firstnameTH, title: "First name", padding: EdgeInsets.only(left: k.w(5), right: k.w(2.5)),)),
                      Expanded(child: TextBoxUi(k:k,sch: sch.lastnameTH, title: "Last name", padding: EdgeInsets.only(right: k.w(5), left: k.w(2.5)),)),
                    ],
                  ),
                ),
                Container(
                  width: k.w(100),
                    padding: EdgeInsets.symmetric(vertical: k.h(1)),
                    child: TextBoxUi(k:k,sch: sch.emailTH, title: "E-Mail Address",)),
                Container(
                    width: k.w(100),
                    padding: EdgeInsets.symmetric(vertical: k.h(1)),
                    child: TextBoxUi(k:k,sch: sch.messageTH, title: "Message",)),
                Container(
                    width: k.w(100),
                    padding: EdgeInsets.symmetric(vertical: k.h(1) ,horizontal: k.w(5)),
                    child: ElevatedButton(onPressed: ()   {
                         savedata();
                    }, child: Text("SUBMIT", style: ThemeClass.setStyle(
                      textColor: kbgColor,
                      fontWeight: FontWeight.bold
                    ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: textColor,
                        padding: EdgeInsets.symmetric(vertical: k.h(1.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(k.w(2)))
                        )
                      ),
                    )),
                SizedBox(height: k.h(3),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: k.w(5)),
                  child: Text('Submitted Message', style: ThemeClass.setStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.kp
                  ),),
                ),
                Container(
                  width: k.w(100),
                  height: k.h(100),
                  margin: EdgeInsets.symmetric(horizontal: k.w(5)),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } if (state is UserLoaded) {
                        final users = state.users;
                        return MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 20,
                          itemCount: users.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MessageCard(k: k, user: users[index]);
                          },
                        );
                      } else if (state is UsersOperationSuccess) {
                        _UserBloc.add(LoadUsers()); // Reload todos
                        if(isSync) {
                          deleteAllRecord();
                        }
                        return Container(); // Or display a success message
                      } else if (state is UsersError) {
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      
      ),
    );
  },
);
  }

}
