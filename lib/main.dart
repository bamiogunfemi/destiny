import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';

import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  StoryPage()
    );
  }
}

//
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
children: <Widget>[
  Particles(
    30, // Number of Particles
    Colors.purple, // Color of Particle
  ),
         SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: FlatButton(
                        onPressed: () {
                          //Choice 1 made by user.
                          setState(() {
                            storyBrain.nextStory(1);
                          });

                        },
                        color: Colors.purple,
                        child: Text(

                          storyBrain.getChoice1(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),

                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 2,

                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: FlatButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });

                      },
                      color: Colors.purple,
                      child: Text(

                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

            ),
              ],

            ),

        ),
         )
]
         ),

    );
  }
}
