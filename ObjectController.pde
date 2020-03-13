class ObjectController {
  
  PGraphics texture;
  ArrayList<BeautifulObject> beautifulObjects;
  
  ObjectController() {
    texture = createGraphics(width, height);
    beautifulObjects = new ArrayList<BeautifulObject>();
  }

  void addObject(BeautifulObject obj) {
    beautifulObjects.add(obj);
  }

  void removeObject(BeautifulObject obj) {
    beautifulObjects.remove(beautifulObjects.indexOf(obj));
  }

  BeautifulObject getMouseoverObj() {
    for (int i = beautifulObjects.size() - 1; i >= 0; i--) {
      BeautifulObject obj = beautifulObjects.get(i);
      if (obj.isMouseOver()) {
        return obj;
      }
    }
    return null;
  }

  void drawTexture(boolean isAnnimation) {
    int centerX = texture.width / 2;
    int centerY = texture.height / 2;
    texture.beginDraw();
    texture.background(255, 0);
    texture.translate(centerX, centerY);
    if (isAnnimation) {
      texture.rotate(radians(millis() / 10 % 360));
    }
    for (BeautifulObject obj:beautifulObjects) {
      texture.shape(obj.shape, obj.x - centerX, obj.y - centerY);
    }
    texture.endDraw();
  }
  
}
