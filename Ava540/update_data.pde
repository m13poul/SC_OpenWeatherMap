JSONObject json;
//coord variables
float lon;
float lat;
//system variables
int sunR;
int sunS;
//main weather variables
float temp;
float pressure;
int humidity;
//wind variables
float windS;
float windD;
//cloud variable
int cloud;
//weather variables
int ID;
String condition;
String description;
String icon;
PImage weatherIcon;

void update_data()
{
  
json = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Ioannina,gr&appid=03725a43eb5b3f9f30bdfdccfd01a096");
  print(json);
  
  JSONObject coord = json.getJSONObject("coord"); lon = coord.getFloat("lon");
lat = coord.getFloat("lat");
  JSONObject sys = json.getJSONObject("sys");
     sunR = sys.getInt("sunrise");
     sunS = sys.getInt("sunset");
     JSONObject main = json.getJSONObject("main");
     temp = main.getFloat("temp");
     pressure = main.getFloat("pressure");
     humidity = main.getInt("humidity");
     JSONObject wind = json.getJSONObject("wind");
     windS = wind.getFloat("speed");
     windD = wind.getFloat("deg");
     /* OSC start */
     OscMessage msg = new OscMessage("/windspeed");
     msg.add(windS);
     osc.send(msg, supercollider);
     /* OSC end */
     JSONObject clouds = json.getJSONObject("clouds");
     cloud = clouds.getInt("all");
     JSONArray weather = json.getJSONArray("weather"); JSONObject mainCond = weather.getJSONObject(0); ID = mainCond.getInt("id");
condition = mainCond.getString("main"); description = mainCond.getString("description"); icon = mainCond.getString("icon");
weatherIcon = loadImage("http://openweathermap.org/img/w/" + icon + ".png");
}