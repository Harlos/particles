class ParticleSystem {
  ArrayList<Particle> particles;
  PVector location;

  ParticleSystem(float x, float y) {
    particles = new ArrayList<Particle>();
    location = new PVector(x, y);
  }

  void applyForce(PVector force) {
    Iterator<Particle> it = particles.iterator();    
    while (it.hasNext()) {
      Particle p = it.next();
      p.applyForce(force);
    }
  }

  void update() {
    for(int i = 0; i <20; i++)
    particles.add(new Particle(location));
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      if (p.lifeTime < 0)
        it.remove();
      p.update();
    }
  }

  void display() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.display();
    }
  }

  void go() {
    applyForce(new PVector(0, 0.1));
    PVector puff = PVector.sub(new PVector(mouseX, mouseY), location);
    puff.normalize();
    puff.mult(0.5);
    applyForce(puff);
    update();
    display();
  }
}