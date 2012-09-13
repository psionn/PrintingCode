PGraphics canvas;
int cWidth = 2550;
int cHeight = 3300;

void setup() {
  size(800, 600, P2D);
  background(0);
  canvas = createGraphics(cWidth, cHeight, P2D);
  canvas.beginDraw();
  canvas.background(255);
  canvas.strokeWeight(5);
  canvas.stroke(5);
  for (int i = 0; i < 14; i++) {
    float piSize = i/10 * TWO_PI;
    canvas.pushMatrix();
      canvas.noFill();
      
      canvas.rotate( -PI / 14);
      canvas.translate(100, 300*i);
      canvas.ellipse(0,0, 440, 400);
      canvas.triangle(100, 500, 500, 400, 200, 200);
      canvas.rotate( PI / 4 );
      canvas.translate( 350, 200);
      canvas.fill(0);
      canvas.rect( 0, 0, 35, 35);
    canvas.popMatrix();
  }
  canvas.fill(0);
//  canvas.triangle(cWidth/2 - 200, cHeight/2 - 400, cWidth/2 + 200, cHeight/2 - 400, cWidth/2, cHeight/2 + 400);
  canvas.endDraw();
}

void draw() {
  background(0);
  image(canvas, 0, 0, 2550*.15, 3300*.15);
}

void keyPressed() {
  canvas.save("printingCode.jpg"); 
}
