/** Special Thanks to Brett Renfer*/

import tsps.*;
TSPS tspsReceiver;
PFont myFont;
PImage myBackground;

int lastDrawn = 0;
//----------------Categories
String[] subject = { 
  "Advertisement HF", "Animation NC 1764 to NC 1764", "Animation TR 897.7", "Architectural Lettering NK 3600 to NK 3640", "Branding HD", "Color in Design NK 1548", "Comic Art and Artists NC 1320 and 1763 ", "Computer Software, Graphics, Color T385", 
  "Design Patterns and Motifs NK 1390 to NK 1476", "Design Patterns and Motifs NK 1530 to NK 1560", "Design Theory and Writings NK 1505 to NK 1520", "Exhibition Design T396.5", "Game Design GV 1230 and QA 76", "Graphic Design NC 997 to NC 999.6", 
  "Graphic Design Z244-6", "Graphic Novels PN 6700 to PN 6790", "Green/Ecological/Sustainable Design GE", "Illustration NC 960 to 980", "Information Design NK 1510", "Motion Graphics NC 997", "Motion Graphics TR 897.7", "New Media,Interactive QA 76", 
  "Photography TR", "Product Design TS 23 to TS 194", "Retail Design, Merchandising HF 5845", "Technical Drawing T253", "Typography Z246 to Z250", "WayFinding NC 1002", "Web Design TK"
};
int s = int(random(29));

//----------------Rows for second Quest
String [] row = {
  "One", "Two", "Three", "Four", "Five", "Six",
};

int r = int(random(6));
//----------------Number to use for search

String [] number = {
  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
};

int n = int(random(10));

void setup() {
  size(1024, 768);
  background( 0 );
  noStroke();
  myFont = loadFont("Cambria-18.vlw");
  myBackground = loadImage("background.jpg");
  imageMode(CENTER);
  image(myBackground, width/2, height/2);



  //all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
};

void draw() {
  // quickly erase the background
  //  fill(0, 5);
  //  rect(0, 0, width, height);

  //
  //  fill( 255 );


  // we haven't seen anyone in 3 seconds, time to complain!
  if ( tspsReceiver.people.size() == 0 && minute() - lastDrawn > 3 ) {
    imageMode(CENTER);
    image(myBackground, width/2, height/2);
    textAlign( CENTER );
    textFont(myFont);
    text( "Come to me and start you journey \n or bring a Treasure and I will get you an extra Perk", width / 2, ( height / 2)-30);
  };
};

/* TSPS EVENTS:*/

/* Add these functions to your app to catch events when people enter a scene,
 move around, or leave */

void personEntered( TSPSPerson p ) {
  //  background( 0 );
  imageMode(CENTER);
  image(myBackground, width/2, height/2);
  fill( 255 );
  textAlign( CENTER );

  // text( subject[s], width / 2, height / 2 );
  if ( tspsReceiver.people.size() == 1 ) {
    textFont(myFont);
    text( "This is your subject:\n" +  (subject[int(random(subject.length))]) + " \n Find a Book with this number: " + (number[int(random(number.length))]), width / 2, ( height / 2)-30);
  }

  if ( tspsReceiver.people.size() == 2 ) {
    textFont(myFont);
    text("I'm glad you found a treasure, Now use this subject\n" + (subject[int(random(subject.length))]) + " \n Find a Book with this number: " + (number[int(random(number.length))]) + 
      "\n And as a perk use this row number: " + (row[int(random(row.length))]), width / 2, ( height / 2)-30);
  }

  if ( tspsReceiver.people.size() == 3) {
    textFont(myFont);
    text("More than one treasure, Now use this subject\n" + (subject[int(random(subject.length))]) + "\n Now you have unlocked two perks. Row: " + (row[int(random(row.length))]) 
      +" \n Find a Book with this  two numbers: " + (number[int(random(number.length))]) + (number[int(random(number.length))]), width / 2, ( height / 2)-30);
  }
}

void personUpdated( TSPSPerson p ) {
}

void personLeft( TSPSPerson p ) {
  //  background( 0 );
  imageMode(CENTER);
  image(myBackground, width/2, height/2);
  int numPeopleLeft = tspsReceiver.people.size() - 1;

  fill( 255 );
  textAlign( CENTER );

  // no one left :(
  if (numPeopleLeft == 0) {
    textFont(myFont);
    text( "Welcome to BookQuest 1.0 \n Come to me \n and I will give you a subject to start..", width / 2, ( height / 2)-30);
  }

  if (numPeopleLeft == 1) {
    textFont(myFont);
    text( "This is your subject:\n" +  (subject[int(random(subject.length))]) + " \n Find a Book with this number: " + (number[int(random(number.length))]), width / 2, ( height / 2)-30);
  }

  if (numPeopleLeft == 2) {
    textFont(myFont);
    text("I'm glad you found a treasure, Now use this subject\n" + (subject[int(random(subject.length))]) + " \n Find a Book with this number: " + (number[int(random(number.length))]) + 
      "\n And as a perk use this row number: " + (row[int(random(row.length))]), width / 2, ( height / 2)-30);
  }



  //  else {
  //    text( "Now, you can start your BookQuest! \n"+ numPeopleLeft +" journey(s) so far.", width / 2, height / 2 );
  //  }
  lastDrawn = second();
}

