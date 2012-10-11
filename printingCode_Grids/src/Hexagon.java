import processing.core.*;

public class Hexagon {
	PApplet parent;
	PVector location;
	float size;
	int clr;
	
	Hexagon(PApplet p, PVector l, int c, float s) {
		parent = p;
		location = l;
		clr = c;
		size = s;
	}
	
	public void draw() {
//		parent.fill(color);
//		parent.ellipse(location.x, location.y, size, size);
		parent.fill(clr);
		parent.stroke(parent.color(255));
		parent.beginShape();
		for (int i = 0 ; i < 6; i++) {
			parent.vertex((float)(Math.cos(PApplet.radians(i*60-30))*size+location.x), (float)( Math.sin(PApplet.radians(i*60-30))*size+location.y));
			
		}
		parent.endShape();
		
	}
	
	public void draw(PGraphics gfx) {
//		parent.fill(color);
//		parent.ellipse(location.x, location.y, size, size);
		gfx.fill(clr);
		gfx.stroke(gfx.color(255));
		gfx.beginShape();
		for (int i = 0 ; i < 6; i++) {
			gfx.vertex((float)(Math.cos(PApplet.radians(i*60-30))*size+location.x), (float)( Math.sin(PApplet.radians(i*60-30))*size+location.y));
			
		}
		gfx.endShape();
		
	}
	
}
