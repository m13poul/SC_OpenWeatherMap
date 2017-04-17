import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress supercollider;
void setup()
{
    /* create a new instance of oscP5. 
   * 12000 is the port number you are listening for incoming osc messages.
   */
  osc = new OscP5(this,12000);
   
  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  supercollider = new NetAddress("127.0.0.1",57120);
  size(400,500);
  update_data();
  println();
}

void draw() {
background(150);
textSize(20);
fill(0);
text("GPS Location: " + lat + " , " + lon,50,100); text("Sunrise: " + sunR,50,125);
text("Sunset: " + sunS,50,150);
text("Temperature: " + temp,50,175);
text("Atmospheric Pressure: " + pressure,50,200); text("Humidity: " + humidity + "%",50,225);
text("Wind Speed: " + windS + "mps",50,250);
text("Wind Direction: " + windD,50,275);
text("Cloud Coverage: " + cloud + "%",50,300); text("Conditions: " + condition + " , " + description,50,325);

  update_data();
  if((minute()%0.2 == 0) && (second() == 1))
  {
    update_data();
  }
}