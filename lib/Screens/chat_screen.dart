import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ui_controller.dart';

class PlaygroundView extends StatelessWidget {
  final UIController controller = Get.find();
  final TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: controller.backgroundColor.value,
        child: Scaffold(
          backgroundColor:  controller.backgroundColor.value,
          body: Expanded(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  controller.title.value,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _buildProfileCard(),


              ],
            ),
          ),
          floatingActionButton: _buildPromptBar(),

        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.grey[300],child:
            Image.network("https://media.licdn.com/dms/image/v2/D4D03AQFr3PSIZn038g/profile-displayphoto-shrink_200_200/B4DZYJVOAtHIAY-/0/1743913282327?e=1757548800&v=beta&t=wVHEAPAyoTAyeAK_om12ME5RjAZf1E3AKHfIYAhKazk",)
              ,)
            ,SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: controller.nameFieldColor.value,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                fillColor: controller.emailFieldColor.value,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.buttonColor.value,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              onPressed: () {},
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPromptBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: controller.backgroundColor.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextField(
              controller: promptController,

              minLines:3,
              maxLines: 5,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(

                hintText: "Type a command (e.g. make background green)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              controller.handleUserPrompt(promptController.text);
              promptController.clear();
            },
            child: Text("Go"),
          ),
        ],
      ),
    );
  }
}