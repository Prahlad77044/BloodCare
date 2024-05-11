import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class PlasmaDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
          title: Text('Plasma Donation Centers',style:TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: ListView(
        children: <Widget>[
          DonationCenterTile(
            name: 'Sahid Memorial Hospital',
            location: 'Kalanki Chowk, Kathmandu',
            contact: '+977-1-4252322',
            openingHours: 'Monday-Sunday: 9:00 AM - 8:00 PM',
          ),
          DonationCenterTile(
            name: 'Nepal National Hospital',
            location: 'Kalanki, Kathmandu',
            contact: '+977-1-4222222',
            openingHours: '24 hours',
          ),
          DonationCenterTile(
            name: 'OM Saibaba Memorial Hospital',
            location: 'Dhunge Dhara Chowk',
            contact: '+977-1-4222133',
            openingHours: '24 hours',
          ),
          DonationCenterTile(
            name: 'Vayodha Hospitals',
            location: 'Balkhu, Kathmandu',
            contact: '+977-1-5544333',
            openingHours: 'Monday-Sunday: 9:00 AM - 8:00 PM',
          ),
          DonationCenterTile(
            name: 'Nepal RedCross Society Central Blood Transfusion Center',
            location: 'Nepal RedCross Society,Redcross Rd,Kathmandu',
            contact: '01-4288485',
            openingHours: '24 hours',
          ),
          DonationCenterTile(
            name: 'Himal Blood Transfusion Center',
            location: 'Thirbum Marg, Kathmandu',
            contact: '986-2737316',
            openingHours: '24 hours',
          ),
        ],
      ),
    );
  }
}

class DonationCenterTile extends StatelessWidget {
  final String name;
  final String location;
  final String contact;
  final String openingHours;

  DonationCenterTile({
    required this.name,
    required this.location,
    required this.contact,
    required this.openingHours,
  });

  @override
  Widget build(BuildContext context) {
    Future _launchDialer(String phoneNumber) async {
      print('$phoneNumber');
      print('launch fxn called');
      Uri phoneno = Uri.parse('tel:+977$phoneNumber');
      if (await launchUrl(phoneno)) {
        print('dialeropened');
      } else {
        print('dialernotopened');

        //dailer is not opened
      }
    }
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          InkWell(
            onTap: () {
              _launchDialer(contact);

              // Handle call functionality
            },
            child: Icon(
              Icons.call,
              color: Colors.green, // Change color as needed
            ),
          ),
        ],
      ),
      subtitle: Text(location + " | " + contact),
      onTap: () {},
    );
  }
}
