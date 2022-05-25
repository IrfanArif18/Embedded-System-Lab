#include <SPI.h>        // Include SPI library (needed for the SD card)
#include <SD.h>         // Include SD library
 
File myFile;
int pinLED = 6, pinSwitch = 3;
int switchState = 0;
 
void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
 
  Serial.print("Initializing SD card...");
 
  if (!SD.begin()) {
    Serial.println("initialization failed!");
    while (1);
  }
  Serial.println("initialization done.");
 
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  myFile = SD.open("test.txt", FILE_WRITE);
 
  // if the file opened okay, write to it:
  if (myFile) {
    Serial.print("Writing to test.txt...");
    myFile.println("testing 1, 2, 3.");
    // close the file:
    myFile.close();
    Serial.println("done.");
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening test.txt");
  }
 
  // re-open the file for reading:
  myFile = SD.open("test.txt");
  if (myFile) {
    Serial.println("test.txt:");
 
    // read from the file until there's nothing else in it:
    while (myFile.available()) {
      Serial.write(myFile.read());
    }
    // close the file:
    myFile.close();
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening test.txt");
  }

  pinMode(pinLED, OUTPUT);
  pinMode(pinSwitch, INPUT);
}
 
void loop() {
  myFile = SD.open("test.txt", FILE_WRITE);
  if(myFile) {
    switchState = digitalRead(pinSwitch);
    if(switchState == HIGH) {
      digitalWrite(pinLED, HIGH);
      Serial.println("LED : ON");
      myFile.println("LED : ON");
    } else {
      digitalWrite(pinLED, LOW);
      Serial.println("LED : OFF");
      myFile.println("LED : OFF");
    }
    myFile.close();
  } else {
    Serial.println("Error opening test.txt");
  }
  
  delay(250);
}
