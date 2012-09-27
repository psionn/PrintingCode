import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class WanderingPath {
  PVector startingPos, endingPos;
  PGraphics surface;
  TColor col = TColor.newHSV(map(190, 0, 360, 0, 1), map(90, 0, 360, 0, 1), map(90, 0, 360, 0, 1));
  ColorTheoryStrategy s = new AnalogousStrategy();
  ColorList colList = ColorList.createUsingStrategy(s, col);
  ColorList moreColors = new ColorRange(colList).addBrightnessRange(0.8, 1).getColors(null, 106, 0.05);
  int steps;
  ArrayList<PVector> path = new ArrayList<PVector>();

  WanderingPath(PGraphics canvas) {

    println(col.hue() + " " + col.saturation() + " " + col.brightness());
    surface = canvas;
    float w = surface.width;
    float h = surface.height;
    startingPos = new PVector(random(w), 0);//random(-300, 0) );
    PApplet.println("Start : " + startingPos.x +  ",  " + startingPos.y);
    endingPos = new PVector(random(0, w), h);//random(h, h + 300));
    float a = PVector.angleBetween(startingPos, endingPos);
    PApplet.println("End : " + endingPos.x +  ",  " + endingPos.y);
    steps = Math.round(random(30));
    path.add(startingPos);

    for (int i = 0; i < steps; i++) {
      int move = Math.round(random(w/4));
      int width = Math.round(random(h/4));
      float angle = a + PApplet.radians(50-random(100));
      PVector lastPos = path.get(path.size()-1);
      PVector newPos = new PVector((float)(Math.cos(angle) * move) + lastPos.x, (float) (Math.sin(angle) * move) + lastPos.y, width );
      newPos.lerp(endingPos, (i+1+steps)/(steps*2));
      path.add(newPos);
    }
  }

  public void render() {
    
    TColor c = colList.getRandom();
    surface.beginDraw();
    surface.beginShape();
    surface.colorMode(HSB, 1, 1, 1);
    surface.background(1,0,1);
    surface.fill(c.hue(), c.saturation(), c.brightness());
    surface.curveVertex(startingPos.x, startingPos.y);
    for (int i = 0; i < path.size(); i++ ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x+(w*3), y);
    }
    surface.curveVertex(endingPos.x, endingPos.y);
    for (int i = path.size()-1; i >= 0; i-- ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x-(w*3), y);
    }
    surface.curveVertex(startingPos.x, startingPos.y);
    surface.endShape();

    TColor c1 = colList.getRandom();
    surface.beginShape();
    surface.fill(c1.hue(), c1.saturation(), c1.brightness());
    surface.curveVertex(startingPos.x, startingPos.y);
    for (int i = 0; i < path.size(); i++ ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x+(w*2), y);
    }
    surface.curveVertex(endingPos.x, endingPos.y);
    for (int i = path.size()-1; i >= 0; i-- ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x-(w*2), y);
    }
    surface.curveVertex(startingPos.x, startingPos.y);
    surface.endShape();

    TColor c2 = moreColors.getRandom();
    surface.beginShape();
    surface.fill(c2.hue(), c2.saturation(), c2.brightness());
    surface.curveVertex(startingPos.x, startingPos.y);
    for (int i = 0; i < path.size(); i++ ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x+w, y);
    }
    surface.curveVertex(endingPos.x, endingPos.y);
    for (int i = path.size()-1; i >= 0; i-- ) {
      float x = path.get(i).x;
      float y = path.get(i).y;
      float w = path.get(i).z;

      surface.curveVertex(x-w, y);
    }
    surface.curveVertex(startingPos.x, startingPos.y);
    surface.endShape();
    surface.endDraw();
  }
}

