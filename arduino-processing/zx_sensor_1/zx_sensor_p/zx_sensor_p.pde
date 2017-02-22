import processing.serial.*;

Serial myPort;
String dataFromArduino;
String convertedDataFromArduino;
String[] positions;
int xPos;
int yPos;

void setup(){  
  printArray(Serial.list());
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  background(255);
}

void draw() {
  dataFromArduino = myPort.readStringUntil('\n'); // read it and store it in message
  if (dataFromArduino != null ) {
    convertedDataFromArduino = trim(dataFromArduino);
    positions = split(convertedDataFromArduino, ',');
    xPos = parseInt(positions[0]);
    yPos = parseInt(positions[1]);
    background(255);
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);    
    rect(width-(2*xPos),height/2,2*yPos,2*yPos);
    println(xPos+","+yPos);
  }
}