import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp_ui/WhatsApp/Calls/whats_app_call.dart';
import 'package:flutter_app_whatsapp_ui/WhatsApp/Status/whats_app_status.dart';
import 'package:flutter_app_whatsapp_ui/WhatsApp/whats_app_enums.dart';

import 'whats_app_chat.dart';

class WhatsAppHome extends StatefulWidget {
  _WhatsAppHome createState() => _WhatsAppHome();
}

class _WhatsAppHome extends State<WhatsAppHome> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'WhatsApp',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: _searchNavBtnAction(),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: PopupMenuButton<TopNavbarMoreOption>(
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: TopNavbarMoreOption.newgroup,
                          child: Text('New group'),
                        ),
                        PopupMenuItem(
                          value: TopNavbarMoreOption.newbroadcast,
                          child: Text('New broadcast'),
                        ),
                        PopupMenuItem(
                          value: TopNavbarMoreOption.linkeddevices,
                          child: Text('Linked devices'),
                        ),
                        PopupMenuItem(
                          value: TopNavbarMoreOption.starredmessages,
                          child: Text('Starred messages'),
                        ),
                        PopupMenuItem(
                          value: TopNavbarMoreOption.payments,
                          child: Text('Payments'),
                        ),
                        PopupMenuItem(
                          value: TopNavbarMoreOption.settings,
                          child: Text('Settings'),
                        ),
                      ],
                  onSelected: (selectedValue) {
                    switch (selectedValue) {
                      case TopNavbarMoreOption.newgroup:
                        print('New group');
                        break;
                      case TopNavbarMoreOption.newbroadcast:
                        print('New broadcast');
                        break;
                      case TopNavbarMoreOption.linkeddevices:
                        print('Linked devices');
                        break;
                      case TopNavbarMoreOption.starredmessages:
                        print('Starred messages');
                        break;
                      case TopNavbarMoreOption.payments:
                        print('Payments');
                        break;
                      case TopNavbarMoreOption.settings:
                        print('Settings');
                        break;
                      default:
                        print('Default');
                    }
                  }),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Text('Camera'),
            WhatsAppChat(),
            WhatsAppStatus(),
            WhatsAppCall()
          ],
        ),
      ),
    );
  }

  // ToDo: define search functionality
  _searchNavBtnAction() {
    print('Search navigation button tapped');
  }

  // ToDO: define option for more
  _moreNavBtnAction() {
    print('More button tapped');
  }
}
