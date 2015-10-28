//Used to test ground software with random but proper telemetery
//Telemertery data, They are just random
unsigned int TeamID = 1086; //1. Done
unsigned long packetID = 0;//2.
float pressure_Alt = 110;//3.
float pitot_speed = 22.22;//4.
float temp = 19.20;//5.
float voltage = 7.5;//6.
float GPS_lat = 79.12345;//7.
float GPS_lon = 33.12345;//8.
float GPS_alt = 500.11;//9.
float GPS_satnum = 6;//10.
float GPS_speed;//11.
float CMD_time = 30;//12.
float CMD_count = 6;//13.
unsigned int ServoPos = 160; //14
unsigned int state = 0;

void setup() {
  Serial.begin (115200);
}

void loop() {
  ++packetID;
  Transmit_data();
  
  delay (1000);

}


void Transmit_data (){
  String toradio = "";
  toradio += TeamID;
  toradio += ",";
  toradio += packetID;
  toradio += ",";
  toradio += pressure_Alt;
  toradio += ",";
  toradio += pitot_speed;
  toradio += ",";
  toradio += temp;
  toradio += ",";
  toradio += ".";
  toradio += voltage;
  toradio += ",";
  toradio += GPS_lat;
  toradio += ",";
  toradio += GPS_lon;
  toradio += ",";
  toradio += GPS_alt;
  toradio += ",";
  toradio += GPS_satnum;
  toradio += ",";
  toradio += GPS_speed;
  toradio += ",";
  toradio += CMD_time;
  toradio += ",";
  toradio += CMD_count;
  toradio += ",";
  toradio += ServoPos;
  toradio += ",";
  toradio += state;
  Serial.println (toradio);
}
