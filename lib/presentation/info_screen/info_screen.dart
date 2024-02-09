import 'package:flutter/material.dart';





class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTitle('Blood: The Life-Maintaining Fluid'),
            _buildText(
              'Blood is the life-maintaining fluid that circulates through the body\'s arteries and veins, delivering essential substances such as oxygen and nutrients to the body\'s cells and carrying away waste products.Blood is made up of four main components: plasma, red blood cells, white blood cells, and platelets .Plasma is the liquid part of blood and makes up about 55% of its volume. It contains proteins, hormones, and other important substances .Red blood cells are responsible for carrying oxygen from the lungs to the body’s tissues and removing carbon dioxide from the body .White blood cells are part of the body’s immune system and help fight infections and diseases .Platelets are responsible for blood clotting and help prevent excessive bleeding .Blood types are determined by the presence or absence of certain antigens on the surface of red blood cells. The most common blood type in Nepal is O positive .',
            ),
            _buildTitle('The Importance of Blood Donation'),
            _buildText(
              'Blood donation is a noble act that can save lives. In Nepal, there is a constant need for blood donors, especially during emergencies. By donating blood, you can help save lives and make a difference in your community.',
            ),
            _buildTitle('Facts About Blood Donation'),
            _buildText(
              'Here are some facts about blood donation that you may find interesting:\n\n- One pint of blood can save up to three lives.\n- You can donate blood once every three months if you are between 18 and 60 years old, weigh above 45 kg, have hemoglobin above 12 gm/dl, have blood pressure 110-160 / 70-96 mmHg, and are not pregnant, breastfeeding, or menstruating .\n-Every two seconds, someone in the world needs blood . \n- The most common blood type is O positive.\n- Donating blood burns approximately 650 calories per pint.',
            ),
            _buildTitle('The Importance of Blood Transfusions'),
            _buildText(
              'Blood transfusions are used to treat various medical conditions, including anemia, cancer, and blood disorders. In Nepal, blood transfusions are performed in hospitals and blood banks. If you are interested in donating blood, you can contact your local blood bank or hospital to learn more.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red[800]
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
