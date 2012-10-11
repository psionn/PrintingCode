import processing.core.*;
import processing.core.PGraphics;

@SuppressWarnings("serial")
public class grids extends PApplet {
	PGraphics canvas;
	PImage img;
	GridContainer gc;

	public void setup() {
		size(600,600,OPENGL);
		background(0);
		canvas = createGraphics(5500,3300, OPENGL);
		canvas.beginDraw();
		canvas.background(color(125,0,0));
		canvas.colorMode(HSB, 1);
		canvas.endDraw();
		gc = new GridContainer(this, canvas, 20);
		gc.render(canvas);

		img = canvas.get();
	}
	
	public void draw() {
		background(0);
		image(img,0,0,(int)Math.round(canvas.width*.1), (int)Math.round(canvas.height*.1));//canvas.get(),0f,0f, (float) (canvas.width * .1), (float) (canvas.height * .1));

//		hex.draw();
	}
	
	public void keyPressed() {
		canvas.save("image.tif");
		
	}
	public void mousePressed() {

		gc.render(canvas);
		img = canvas.get();
		
	}
}
