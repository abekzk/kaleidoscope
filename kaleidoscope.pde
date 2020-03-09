// 万華鏡プログラム

ArrayList<BeautifulObject> beautifulObjects;
PGraphics mirror;

void setup() {
  size(300, 300, P2D);
  beautifulObjects = new ArrayList<BeautifulObject>();
  mirror = createGraphics(width, height);
  textureMode(NORMAL);
  for (int i = 0; i < 5; i++) {
    beautifulObjects.add(new BeautifulObject());
  }
}

void draw() {
  background(255);
  mirror.beginDraw();
  mirror.background(255);
  mirror.translate(mirror.width / 2, mirror.height / 2);
  mirror.rotate(radians(millis() / 100 % 360));
  for (BeautifulObject obj:beautifulObjects) {
    obj.draw(mirror);
  }
  mirror.endDraw();
  //image(mirror, 0, 0);
  beginShape();
  texture(mirror);
  vertex(width / 2, 0, 0.5, 0);
  vertex(width, height, 1, 1);
  vertex(0, height, 0, 1);
  endShape(CLOSE);
}

void mousePressed() {
  beautifulObjects.add(new BeautifulObject(mouseX, mouseY, "d", 50, color(255, 0, 0)));
}
