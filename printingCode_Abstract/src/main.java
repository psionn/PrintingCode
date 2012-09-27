import processing.core.*;


@SuppressWarnings("serial")
public class main extends PApplet {
	
	WanderingPath myPath;
	PGraphics graphic;
	
	public void setup () {
		
		size(800,800,OPENGL);
		graphic = createGraphics(5100, 3300, P2D);
		smooth();
		background(0);
		myPath = new WanderingPath(graphic, this);
		println(myPath.steps + " " + myPath.path.size());
		myPath.render();
	}
	
	public void draw() {
		image(graphic, 0f, 0f, (float) (graphic.width*.2), (float) (graphic.height*.2));
		
//		stroke(255);
//		strokeWeight(5);
//		line(width/2, 0, width/2, height);
	}
	
}
