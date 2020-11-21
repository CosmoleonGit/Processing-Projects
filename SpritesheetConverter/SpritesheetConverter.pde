void setup(){
  // The last two parameters represent the width and height of each sprite respectively.
  
  PImage[] sprites = convert("Character Spritesheet.png", 18, 27);
  
  for (int i = 0; i < sprites.length; i++){
    sprites[i].save("Sprites/spr_" + i + ".png");
  }
  
  println("Successfully converted " + sprites.length + " sprite(s)!");
  exit();
}

PImage[] convert(String spritesheet, int w, int h){
  PImage sheet = loadImage(spritesheet);
  
  if (sheet.width % w != 0 || sheet.height % h != 0){
    throw new IllegalStateException("The size of the sprites and the spritesheet size must be in proportion.");
  }
  
  ArrayList<PImage> sprites = new ArrayList<PImage>();
  
  for (int x = 0; x < sheet.width / w; x++){
    for (int y = 0; y < sheet.height / h; y++){
      PImage sprite = sheet.get(x * w, y * h, w, h);
      
      boolean empty = true;
      
      for (int j = 0; j < sprite.width; j++){
        for (int k = 0; k < sprite.height; k++){
          if (sprite.get(j, k) != color(0, 0, 0, 0)){
            empty = false;
          }
        }
      }
      
      if (!empty){
        sprites.add(sprite);
      } else {
        return sprites.toArray(new PImage[0]);
      }
      
    }
  }
  
  return sprites.toArray(new PImage[0]);
}
