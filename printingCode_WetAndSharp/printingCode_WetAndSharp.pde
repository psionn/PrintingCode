PGraphics canvas;
int cWidth = 5100;
int cHeight = 3300;

void setup() {
  size(800, 600, P2D);
  background(0);
  canvas = createGraphics(cWidth, cHeight, P2D);
  canvas.beginDraw();
  canvas.background(255);
  canvas.strokeWeight(5);
  canvas.stroke(5);
  canvas.beginShape();

  canvas.fill(0);
  for (int i = 0; i < cWidth/200 + 200; i++) {

    canvas.curveVertex( 200*i, cHeight/2 + 1000 );
    canvas.curveVertex( 200*i + 100, cHeight/2  + 1150);
    canvas.curveVertex( 200*i + 200, cHeight / 2  + 1150);
  }
  canvas.vertex(cWidth, cHeight / 2  + 1000);
  canvas.vertex(cWidth, cHeight);
  canvas.vertex(0, cHeight);
  canvas.vertex(0, cHeight / 2  + 1000);

  canvas.endShape();

  canvas.beginShape();
  canvas.noStroke();
  canvas.fill(0, 100);
  for (int i = 0; i < cHeight/200 + 200; i++) {

    canvas.curveVertex( cWidth / 4 * 3, 200 * i );
    canvas.curveVertex( cWidth / 4 * 3 + 100, 200*i + 100);
    canvas.curveVertex( cWidth / 4 * 3, 200*i + 200);
  }
  canvas.vertex(cWidth / 4 * 3, cHeight);
  canvas.vertex(cWidth, cHeight);
  canvas.vertex(cWidth, 0);
  canvas.vertex(cWidth / 4 * 3, 0);

  canvas.endShape();

  canvas.endDraw();
}

void draw() {
  background(0);
  image(canvas, 0, 0, cWidth*.15, cHeight*.15);
}

void keyPressed() {
  canvas.save("printingCode.tif");
}

