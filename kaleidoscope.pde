ArrayList<BeautifulObject> beautifulObjects;

void setup() {
  size(300, 300);
  beautifulObjects = new ArrayList<BeautifulObject>();
}

void draw() {
  background(255);
  for (BeautifulObject obj:beautifulObjects) {
    obj.draw();
  }
}

void mousePressed() {
  beautifulObjects.add(new BeautifulObject(mouseX, mouseY, "o", 100));
}
