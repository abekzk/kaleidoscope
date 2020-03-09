// 万華鏡プログラム

ArrayList<BeautifulObject> beautifulObjects;
PGraphics mirror;

void setup() {
  size(300, 300);
  beautifulObjects = new ArrayList<BeautifulObject>();
  mirror = createGraphics(width, height);
  for (int i = 0; i < 5; i++) {
    beautifulObjects.add(new BeautifulObject());
  }
}

void draw() {
  background(255);
  mirror.beginDraw();
  for (BeautifulObject obj:beautifulObjects) {
    obj.draw(mirror);
  }
  mirror.endDraw();
  image(mirror, 0, 0);
}

void mousePressed() {
  beautifulObjects.add(new BeautifulObject(mouseX, mouseY, "d", 50, color(255, 0, 0)));
}
