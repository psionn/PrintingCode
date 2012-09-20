PGraphics canvas;
int cWidth = 5500;
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
  canvas.beginShape();
   
  canvas.fill(0);
  for (int i = 0; i < cWidth/200 + 200; i++) {
    
//    canvas.bezierVertex(200*i, cHeight/2 - 100, 200*i + 200, cHeight/2 - 100, 200 * i - 100, cHeight / 2 );
    canvas.curveVertex( 200*i, cHeight/2 + 1000 );
    canvas.curveVertex( 200*i + 100, cHeight/2  + 1150);
    canvas.curveVertex( 200*i + 200, cHeight / 2  + 1150);
//    canvas.curveVertex( 200*i + 200, cHeight/2 - 100);
  }
  canvas.vertex(cWidth, cHeight / 2  + 1000);
  canvas.vertex(cWidth, cHeight);
  canvas.vertex(0, cHeight);
  canvas.vertex(0, cHeight / 2  + 1000);
  
  canvas.endShape();
  
  canvas.beginShape();
   
  canvas.fill(0);
  for (int i = 0; i < cHeight/200 + 200; i++) {
    
    canvas.curveVertex( 200*i, cHeight/2 + 1000 );
    canvas.curveVertex( 200*i + 100, cHeight/2  + 1150);
    canvas.curveVertex( 200*i + 200, cHeight / 2  + 1150);
  }
  canvas.vertex(cWidth, cHeight / 2  + 1000);
  canvas.vertex(cWidth, cHeight);
  canvas.vertex(0, cHeight);
  canvas.vertex(0, cHeight / 2  + 1000);
  
  canvas.endShape();
  canvas.endDraw();
}

void draw() {
  background(0);
  image(canvas, 0, 0, cWidth*.15, cHeight*.15);
}

void keyPressed() {
  canvas.save("printingCode.jpg"); 
}
