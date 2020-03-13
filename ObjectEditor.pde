class ObjectEditor {
  
  ObjectController objectController;
  
  BeautifulObject targetObj = null;
  BeautifulObject phantomObj = null;
  
  BeautifulObject[] uiObjs = {
    new BeautifulObject(30, 220, "o", 40, color(150)),
    new BeautifulObject(30, 320, "d", 40, color(150)),
    new BeautifulObject(30, 420, "s", 40, color(150)),
    new BeautifulObject(30, 520, "h", 40, color(150)),
  };

  ObjectEditor(ObjectController objectController) {
    this.objectController = objectController;
  }

  void display() {
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
    if (phantomObj != null) {
      shape(phantomObj.shape, phantomObj.x, phantomObj.y);
    }
  }

  void selectTargetObject() {
    targetObj = objectController.getMouseoverObj();
  }

  void moveTargetObject() {
     if (targetObj != null) {
      targetObj.setPos(mouseX, mouseY);
    }
  }
  
  void removeTargetObject() {
    if (targetObj != null) {
      objectController.removeObject(targetObj);
      targetObj = null;
    }
  }

  void selectPhantomObject() {
    for (BeautifulObject obj:uiObjs) {
      if (obj.isMouseOver()) {
        phantomObj = new BeautifulObject(obj.x, obj.y, obj.type, 60, color(255, 0, 0));
        targetObj = null;  // 重複選択を避けるため
      }
    }
  }

  void movePhantomObject() {
    if (phantomObj != null) {
      phantomObj.setPos(mouseX, mouseY);
    }
  }
  
  void embodyPhantomObject() {
    if (phantomObj != null) {
      objectController.addObject(phantomObj);
      phantomObj = null;
    }
  }

}

class UIButton {
  int x;
  int y;
  int w;
  int h;
  String text;
  String discripthin;
  
  UIButton(int x, int y, int w, int h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  UIButton(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = "";
  }
  
  boolean isMouseOver() {
    return false;
  }
  
}
