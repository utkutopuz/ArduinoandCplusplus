int buzzerPin=10; 
int fsrAnalogPin=1; 
int fsrReading; 
int ledPin=9; 
int sensor; 
int buzzervoice; 
int ledBrightness; 
void setup() 
{ 
Serial.begin(9600); 
pinMode(buzzerPin,OUTPUT); 
pinMode(ledPin,OUTPUT); 
 pinMode(3, OUTPUT); 
 pinMode(5, OUTPUT); 
 pinMode(6, OUTPUT); 
} 
//Then, we type the necessary code in order to read the input data. 
void loop(void) { 
fsrReading=analogRead(fsrAnalogPin); 
 Serial.print("analog reading: "); 
 Serial.println(fsrReading); 
  
 ledBrightness=map(fsrReading, 0, 1023, 0, 255); 
 buzzervoice=map(fsrReading, 0, 1023, 0, 255); 
 if(fsrReading>100){ 
 analogWrite(ledPin, ledBrightness); 
 analogWrite(buzzerPin, buzzervoice); 
 delay(100); 
 for(int i=100;i<155;i++){ 
 analogWrite(ledPin, i); 
 analogWrite(buzzerPin, i); 
 delay(10); 
 } 
//We decide the operating conditions of the buzzer and the LED in our circuit. Our code  is adjusted in the way that when the pressure value on the sensor exceeds 155, buzzer and the  LED is activated. 
 } 
 if(fsrReading>155){ 
 analogWrite(ledPin, ledBrightness); 
 analogWrite(buzzerPin, buzzervoice); 
 delay(100); 
 for(int i=155;i<255;i++){
 analogWrite(ledPin, i); 
 analogWrite(buzzerPin, i); 
 delay(10); 
 } 
 for(int i=255;i>=100;i--){ 
 analogWrite(ledPin, i); 
 analogWrite(buzzerPin, i); 
 } } 
//When the value on the sensor is below 155, there will not be a signal transmitted into  and because of that LED and buzzer will not trigger. This condition also means that human user  is not experiencing a walking disorder.  
 else { 
 digitalWrite(ledPin, LOW); 
 digitalWrite(buzzerPin, LOW); 
 } } 
//All these codes and the circuit is designed to deliver a feedback to the user. We aim to  fix the walking disorder of many patients. 
3.4. Coding 2: Three sensors approach  

//We define the connections made at the very beginning of the coding and add the sensors  individually. 
int fsrAnalogPin1=0; 
int fsrReading1; 
int fsrAnalogPin2=1;
int fsrReading2; 
int fsrAnalogPin3=2; 
int fsrReading3; 
int sensor1; 
int sensor2; 
int sensor3; 
void setup()  
{ 
Serial.begin(9600); 
//using PWM pins to arrange the brightness of rgb led 
 pinMode(3, OUTPUT); 
 pinMode(5, OUTPUT); 
 pinMode(6, OUTPUT); 
  
} 
//Then we write the necessary read commands to read the data from the sensors. And according  to these read values, we adjust how the rgb led will light up at which intervals. 
void loop(void) { 
 fsrReading1=analogRead(fsrAnalogPin1); 
 fsrReading2=analogRead(fsrAnalogPin2); 
 fsrReading3=analogRead(fsrAnalogPin3); 
 Serial.print("analog reading: "); 
 Serial.println(fsrReading1); 
 Serial.println(fsrReading2); 
 Serial.println(fsrReading3); 
  
 if(fsrReading1>100){ 
 digitalWrite(3, HIGH); 
 digitalWrite(5, LOW); 
 digitalWrite(6, LOW);  
 delay(50); 
 for(int i=100;i<155;i++){ 
 analogWrite(3, i); 
 analogWrite(5, i);  analogWrite(6, i);  } 
  
 } 
 if(fsrReading1>155){  digitalWrite(3, HIGH);  digitalWrite(5, LOW);  digitalWrite(6, LOW);   delay(50); 
 for(int i=155;i<255;i++){  analogWrite(3, i);   analogWrite(5, i);  analogWrite(6, i);  delay(20); 
 } 
 } 
 if(fsrReading2>100){  digitalWrite(3, LOW);  digitalWrite(5, HIGH);  digitalWrite(6, LOW);   delay(20); 
 for(int i=100;i<155;i++){  analogWrite(3, i);   analogWrite(5, i);  analogWrite(6, i);  } 
  
 } 
 if(fsrReading2>155){  digitalWrite(3, LOW);  digitalWrite(5, HIGH);  digitalWrite(6, LOW);   delay(20); 
 for(int i=155;i<255;i++){  analogWrite(3, i); 
 analogWrite(5, i);  analogWrite(6, i);  delay(20); 
 } 
 if(fsrReading3>100){  digitalWrite(3, LOW);  digitalWrite(5, LOW);  digitalWrite(6, HIGH);   delay(20); 
 for(int i=100;i<155;i++){  analogWrite(3, i);   analogWrite(5, i);  analogWrite(6, i);  } 
  
 } 
 if(fsrReading1>155){  digitalWrite(3, LOW);  digitalWrite(5, LOW);  digitalWrite(6, HIGH);   delay(20); 
 for(int i=155;i<255;i++){  analogWrite(3, i);   analogWrite(5, i);  analogWrite(6, i);  delay(20); 
 } 
 } 
 } 
 else { 
digitalWrite(3, LOW); 
 digitalWrite(5, LOW);  digitalWrite(6, LOW);   }
//The ranges of values of the data coming from the sensors were selected to be used in  determining the gait disturbance in our project. For example, after the value exceeds 20 for the  first sensor, important data for our project will begin to be received. Or, for example, when the  value from the pressure sensor in the 3rd sensor exceeds 10, this will indicate that the user has  a flatfoot problem. If the value is below 10, such a problem is not diagnosed.  
 sensor1=analogRead(A0); 
 sensor1=map(sensor1,20,358,10, 60); 
 Serial.println(sensor1); 
 if(sensor1<20){ 
  
Serial.println("not important detected for the 1st sensor"); } 
  
 else if(sensor1>40) 
 { 
Serial.println("between %70 and more"); 
} 
 else if(sensor1>30) 
 { 
Serial.println("between %50 and %70"); 
} 
 sensor2=analogRead(A1); 
 sensor2=map(sensor2,20,358,10, 60); 
 Serial.println(sensor2); 
 if(sensor2<20){ 
  
Serial.println("not important detected for the 2nd sensor"); } 
  
 else if(sensor2>40) 
 { 
Serial.println("between %70 and more"); 
}  
 else if(sensor2>30) 
 { 
Serial.println("between %50 and %70");
} 
 sensor3=analogRead(A2); 
 sensor3=map(sensor3,20,358,10, 60); 
 Serial.println(sensor3); 
 if(sensor3<10){ 
  
Serial.println("not important detected for the 3rd sensor"); } 
  
 else if(sensor3>20) 
 { 
Serial.println("intoeing");} 
 else if(sensor3>10) 
 { 
Serial.println("flatfooted");} 
} 
