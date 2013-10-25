class Card
{
  int num, suite;
  int x,y;
  String me;
  PImage img;
  PImage face;
  boolean playable;
  public Card(int num, int suite, PImage img)
  {
    this.num = num;
    this.suite = suite;
    this.img= img;
    this.face = img;
    playable = false;
    x = 50*num;
    y = 100;
    switch (num)
    {
    case 14:
      this.num = 1; 
      me = "A"; 
      break;
    case 11: 
      me = "J"; 
      break;
    case 12: 
      me = "Q"; 
      break;
    case 13: 
      me = "K"; 
      break;
    default: 
      me = ""+num;
    }

    switch (suite)
    {
    case 1: 
      me += " Spade"; 
      break;
    case 2: 
      me += " Heart"; 
      break;
    case 3: 
      me += " Diamond"; 
      break;
    case 4: 
      me += " Clubs"; 
      break;
    }
  }

  public PImage getImg()
  {
    return img;
  }

  public void display()
  {
    image(img,x,y);
  }

  public String toString()
  {
    return me;
  }
  
  public boolean isPlayable()
  {
    return this.playable;
  }
  
  public void makePlayable()
  {
    this.playable = true;
  }
  
  public int getNum()
  {
    return num;
  }
}

