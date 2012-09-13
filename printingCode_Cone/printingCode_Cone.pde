PGraphics canvas;
int cWidth = 2550;
int cHeight = 3300;

void setup() {
  size(800, 600, P2D);
  background(0);
  canvas = createGraphics(cWidth, cHeight, P2D);
  canvas.beginDraw();
  canvas.background(255);
//  canvas.fill(125);
//  canvas.rect(cWidth/2, cHeight/2, 400, 400);
  canvas.strokeWeight(5);
  canvas.stroke(5);
  canvas.ellipse(cWidth/2, cHeight/2 - 500, 440, 400);
  canvas.fill(0);
  canvas.triangle(cWidth/2 - 200, cHeight/2 - 400, cWidth/2 + 200, cHeight/2 - 400, cWidth/2, cHeight/2 + 400);
  canvas.endDraw();
}

void draw() {
  background(0);
  image(canvas, 0, 0, 2550*.15, 3300*.15);
}

void keyPressed() {
  canvas.save("printingCode.jpg"); 
}
