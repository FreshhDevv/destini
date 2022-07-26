import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.
// The app runs as expected

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: Step 1 - Add background.png to this Container as a background image.
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    // 'Story text will go here.',
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                child: Visibility(
                  child: ElevatedButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text(
                      //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                      storyBrain.getChoice1(),
                      // 'Choice 1',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: ElevatedButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text(
                        //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                        storyBrain.getChoice2(),
                        // 'Choice 2',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.
//Step 24 Completed.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
