import java.util.Iterator;
ArrayList<ParticleSystem> arr;

void setup() {
  size(500, 500, FX2D );
  arr = new ArrayList<ParticleSystem>();
  noStroke();
}

void mousePressed() {
  arr.add(new ParticleSystem(mouseX, mouseY));
}

float counter = 0;
void draw() {
  background(0);
  Iterator<ParticleSystem> it = arr.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.go();
  }
  println(frameRate);
}