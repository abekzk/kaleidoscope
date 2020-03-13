class ObjectController {
  
  PGraphics texture;
  ArrayList<BeautifulObject> beautifulObjects;
  
  BeautifulObject targetObj = null;
  BeautifulObject ghostObj = null;
  
  BeautifulObject[] uiObjs = {
    new BeautifulObject(30, 220, "o", 40, color(150)),
    new BeautifulObject(30, 320, "d", 40, color(150)),
    new BeautifulObject(30, 420, "s", 40, color(150)),
    new BeautifulObject(30, 520, "h", 40, color(150)),
  };

  PShape[] uiColors = {
    createShape(RECT, 0, 0, 200, 200)
  };
   
  ObjectController() {
    texture = createGraphics(width, height);
    beautifulObjects = new ArrayList<BeautifulObject>();
    println(uiColors[0].width);
  }
  
  void addObject(BeautifulObject obj) {
    beautifulObjects.add(obj);
  }
  
  void selectObject() {
    
    for (BeautifulObject obj:uiObjs) {
      int r = obj.size / 2;
      if (mouseX > obj.x - r && mouseX < obj.x + r && mouseY > obj.y - r && mouseY < obj.y + r) {
        ghostObj = new BeautifulObject(obj.x, obj.y, obj.type, 60, color(255, 0, 0));
        targetObj = null;
        return;
      }
    }

    for (int i = beautifulObjects.size() - 1; i >= 0; i--) {
      BeautifulObject obj = beautifulObjects.get(i);
      int r = obj.size / 2;
      if (mouseX > obj.x - r && mouseX < obj.x + r && mouseY > obj.y - r && mouseY < obj.y + r) {
        targetObj = obj;
        return;
      }
    }
    targetObj = null;
  }

  void moveSelectObject() {
    if (ghostObj != null) {
      ghostObj.setPos(mouseX, mouseY);
    }
    else if (targetObj != null) {
      targetObj.setPos(mouseX, mouseY);
    }
  }
  
  void setObject() {
    if (ghostObj != null) {
      addObject(ghostObj);
      ghostObj = null;
    }
  }
  
  void drawEditor() {
    if (targetObj != null) {
      pushStyle();
      noFill();
      stroke(50, 100);
      rectMode(CENTER);
      rect(targetObj.x, targetObj.y, targetObj.size, targetObj.size);
      popStyle();
    }
    for (BeautifulObject obj:uiObjs) {
      shape(obj.shape, obj.x, obj.y);
    }
    if (ghostObj != null) {
      shape(ghostObj.shape, ghostObj.x, ghostObj.y);
    }
    
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
