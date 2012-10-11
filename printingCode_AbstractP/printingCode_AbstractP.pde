WanderingPath myPath;
PGraphics graphic;

void setup () {

  size(800, 800, P2D);
  
  smooth();
  colorMode(HSB, 1,1,1);
  graphic = createGraphics(3300, 5100, P2D);
  background(0);
  myPath = new WanderingPath(graphic);
  println(myPath.steps + " " + myPath.path.size());
  
  myPath.render();
}

void draw() {
//  image(graphic, 0, 0);
background(0);
  image(graphic, 0f, 0f, (float) (graphic.width*.1), (float) (graphic.height*.1));


}  

void mousePressed() {
  graphic = createGraphics(3300, 5100, P2D);
  myPath = new WanderingPath(graphic);
  myPath.render();
}
void keyPressed() {
 graphic.save("image.tif"); 
}

