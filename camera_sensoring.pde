/**
 TSPS Events Example
 by Brett Renfer, 4/5/12
 
 Show text when new people enter and leave!
 */

// import TSPS
import tsps.*;
TSPS tspsReceiver;

int lastDrawn = 0;

String[] subject = { 
  "Advertisement HF", "Animation NC 1764 to 1764", "Animation TR 897.7", "Architectural Lettering NK 3600 to 3640", "Branding HD", "Color in Design NK 1548", "Comic Art and Artists NC 1320 and 1763 ", "Computer Software, Graphics, Color T385",
  "Design Patterns and Motifs NK 1390 to 1476", "Design Patterns and Motifs NK 1530 to 1560"
};
int s = int(random(10));

void setup() {
  size(1024, 768);
  background( 0 );
  noStroke();

  //all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
};

void draw() {
  // quickly erase the background
  fill(0, 5);
  rect(0, 0, width, height);

  fill( 255 );

  // we haven't seen anyone in 3 seconds, time to complain!
  if ( tspsReceiver.people.size() == 0 && millis() - lastDrawn > 3000 ) {
    background( 0 );
    textAlign( CENTER );
    text( "Where is everybody?", width / 2, height / 2 );
  };
};

/* TSPS EVENTS:*/

/* Add these functions to your app to catch events when people enter a scene,
 move around, or leave */

void personEntered( TSPSPerson p ) {
  background( 0 );
  fill( 255 );
  textAlign( CENTER );

 // text( subject[s], width / 2, height / 2 );
    text( "This is your first subject\n" +  (subject[int(random(subject.length))]), width / 2, height / 2 );

}

void personUpdated( TSPSPerson p ) {
}

void personLeft( TSPSPerson p ) {
  background( 0 );
  int numPeopleLeft = tspsReceiver.people.size() - 1;

  fill( 255 );
  textAlign( CENTER );

  // no one left :(
  if (numPeopleLeft == 0) {
    text( "Welcome to BookQuest 1.0 \n Come to me and I will give you the first subject to start..", width / 2, height / 2 );
  }
  
 
  else {
    text( "See ya!\nGlad I've got "+ numPeopleLeft +" more friends to kick it with.", width / 2, height / 2 );
  }
  lastDrawn = millis();
}

