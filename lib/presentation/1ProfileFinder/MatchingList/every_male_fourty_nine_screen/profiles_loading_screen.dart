import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../model_final/model_all_male_4.dart';
import 'EveryMaleFourtyNineScreen.dart';

class ProfilesLoading extends StatefulWidget {
  ProfilesLoading({super.key});

  @override
  State<ProfilesLoading> createState() => _ProfilesLoadingState();
}

class _ProfilesLoadingState extends State<ProfilesLoading> {
  AllMaleUserData4 users  = AllMaleUserData4(userUid: ThreeSigninScreen.userUidAccess);

  late String userUid;

  bool _isLoading = true;

    @override
  void initState() {
    super.initState();
    _fetchUsers().then((result) {
      setState(() {
        users = result;
      });
    });
  }


Future <AllMaleUserData4> _fetchUsers() async {
  final responseList = await http.get(Uri.parse("http://10.0.2.2:8000/all_male_user_data/0PPQMBPEWTL"));
  if (responseList.statusCode == 200) {
    debugPrint('status code 200');
    setState(() {
      _isLoading = false;
    });
    var data1 = json.decode(responseList.body);
    AllMaleUserData4 users = data1.map((user1) => AllMaleUserData4.fromJson(user1));
    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}

 
/*
  void fetchData() async {
    debugPrint('getdata4 start');
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      userUid = preferences.getString("uid2").toString();
    });
    try {
      final responseStream = await http.get(
          Uri.parse("http://10.0.2.2:8000/all_male_user_data/0PPQMBPEWTL"));

      if (responseStream.statusCode == 200) {
        final data =
            AllMaleUserData4.fromJson(json.decode(responseStream.body));
        _dataStreamController.add(data);

        //  var json = jsonDecode(responseStream.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }
  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading ? 

        CircularProgressIndicator()

        :
        
        
        
        Column(
          children: [
            Text('test'),

           users.the0Ppqmbpewtl!.isEmpty 
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.the0Ppqmbpewtl!.length,
                itemBuilder: (context, index) {
                  final user = users.the0Ppqmbpewtl;
                  return ListTile(
                    title: Text(users.the0Ppqmbpewtl![0].age),
                    // subtitle: Text('Email: ${user.email}'),
                  );
                },
              ),
      


            
          ],
        ),

        
        
        
        /*
        StreamBuilder<AllMaleUserData4>(
          stream: _dataStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final myData = snapshot.data;
           
            return Column(
              children: [
                 Text(snapshot.data!.allmaleuserdata4A!.length.toString()),

                Text(
                  'Data from API: ${myData!.allmaleuserdata4A![0].age}'),
              ],
            );
          },
        ),
        */
      ),



    );
  }
}
