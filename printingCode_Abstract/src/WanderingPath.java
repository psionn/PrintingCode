import java.util.ArrayList;

import processing.core.*;
import toxi.color.*;

public class WanderingPath {
	PApplet parent;
	PVector startingPos, endingPos;
	PGraphics surface;
	ColorRange c;
	int steps;
	ArrayList<PVector> path = new ArrayList<PVector>();
	
	WanderingPath(PGraphics canvas, PApplet p) {
		parent = p;
		surface = canvas;
		float w = surface.width;
		float h = surface.height;
//		c.addHueRange(0.9f, 1.0f);
//		c.addBrightnessRange(0.9f, 1.0f);
		startingPos = new PVector(parent.random(w), parent.random(-300, 0) );
		PApplet.println("Start : " + startingPos.x +  ",  " + startingPos.y);
		endingPos = new PVector(parent.random(0, w), parent.random(h, h + 300));
		float a = PVector.angleBetween(startingPos, endingPos);
		PApplet.println("End : " + endingPos.x +  ",  " + endingPos.y);
		steps = Math.round(parent.random(30));
		path.add(startingPos);
		
		for (int i = 0; i < steps; i++) {
			int move = Math.round(parent.random(w/4));
			int width = Math.round(parent.random(h/4));
			float angle = a + PApplet.radians(50-parent.random(100));
			PVector lastPos = path.get(path.size()-1);
			PVector newPos = new PVector((float)(Math.cos(angle) * move) + lastPos.x, (float) (Math.sin(angle) * move) + lastPos.y, width );
			newPos.lerp(endingPos, (i+1+steps)/(steps*2));
			path.add(newPos);
		}
	}
	
	public void render() {
		surface.fill(surface.color(0,0,255));
		surface.ellipse(startingPos.x, startingPos.y, 1000, 1000);
		surface.ellipse(endingPos.x, endingPos.y, 1000, 1000);
		surface.beginShape();
//		TColor color = c.getColor();
		surface.stroke(surface.color(255,0,0));
		surface.strokeWeight(5);
		surface.noFill();
		surface.curveVertex(startingPos.x, startingPos.y);
		for (int i = 0; i < path.size(); i++ ) {
			float x = path.get(i).x;
			float y = path.get(i).y;
			surface.curveVertex(x, y);
			PApplet.println("X: " + x  + " , Y: " + y);
		}
		surface.curveVertex(endingPos.x, endingPos.y);
		surface.endShape();
	}
	
	
	
}
