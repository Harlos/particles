class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float weight;
  float lifeTime;

  Particle(PVector position) {
    location = position.copy();
    velocity = new PVector(random(-1, 1), random(-5, -2));
    acceleration = new PVector();
    weight = 1;
    lifeTime = 50;
  }

  void applyForce(PVector force) {
    acceleration.add(force.div(weight));
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.set(0, 0);
    lifeTime -= 2;
    //println(velocity);
  }

  void display() {
    fill(255, lifeTime);
    ellipse(location.x, location.y, 20, 20);
  }
};