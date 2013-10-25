ArrayList cards = new ArrayList(52);
ArrayList column1 = new ArrayList(5);
ArrayList column2 = new ArrayList(5);
ArrayList column3 = new ArrayList(5);
ArrayList column4 = new ArrayList(5);
ArrayList column5 = new ArrayList(5);
ArrayList column6 = new ArrayList(5);
ArrayList column7 = new ArrayList(5);
ArrayList hand = new ArrayList(17);
ArrayList discard = new ArrayList(52);
boolean gameOver;
boolean cont;
int state;
boolean button1, button2, button3, button4;
int text1, text2, text3, text4;

public void setup()
{
  size(800,800);
  int xoff = 84;
  int yoff = 118;
  PImage allcards = loadImage("cards.png");
  PImage back = loadImage("back.png");
  state = 0;
  cont = false;
  
  button1 = false;
  button2 = false;
  button3 = false;
  button4 = false;
  text1 = 0;
  text2 = 0;
  text3 = 0;
  text4 = 0;

  for(int i = 1; i < 5; i++)
  {
    for(int j = 1; j<14; j++)
    {
      cards.add(new Card(15-j,i,allcards.get((j-1)*xoff,(i-1)*yoff,xoff,yoff)));
    }
  }
  for(int i = 0; i<cards.size()*3; i++)
  {
    int shuf = (int)random(0,cards.size());
    Card tmp = (Card)cards.remove(shuf);
    cards.add(tmp);
  }
  int i = 0;
  while(cards.size() > 47)
  {
    column1.add((Card)cards.remove(0));
    ((Card)column1.get(i)).x = 75;
    ((Card)column1.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 42)
  {
    column2.add((Card)cards.remove(0));
    ((Card)column2.get(i)).x = 175;
    ((Card)column2.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 37)
  {
    column3.add((Card)cards.remove(0));
    ((Card)column3.get(i)).x = 275;
    ((Card)column3.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 32)
  {
    column4.add((Card)cards.remove(0));
    ((Card)column4.get(i)).x = 375;
    ((Card)column4.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 27)
  {
    column5.add((Card)cards.remove(0));
    ((Card)column5.get(i)).x = 475;
    ((Card)column5.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 22)
  {
    column6.add((Card)cards.remove(0));
    ((Card)column6.get(i)).x = 575;
    ((Card)column6.get(i)).y = 150 + 25*i;
    i++;
  }
  i = 0;
  while(cards.size() > 17)
  {
    column7.add((Card)cards.remove(0));
    ((Card)column7.get(i)).x = 675;
    ((Card)column7.get(i)).y = 150 + 25*i;
    i++;
  }
  ((Card)column1.get(column1.size()-1)).makePlayable();
  ((Card)column2.get(column2.size()-1)).makePlayable();
  ((Card)column3.get(column3.size()-1)).makePlayable();
  ((Card)column4.get(column4.size()-1)).makePlayable();
  ((Card)column5.get(column5.size()-1)).makePlayable();
  ((Card)column6.get(column6.size()-1)).makePlayable();
  ((Card)column7.get(column7.size()-1)).makePlayable();
  i = 0;
  while(cards.size() > 0)
  {
    hand.add((Card)cards.remove(0)); 
    ((Card)hand.get(i)).x = 200;
    ((Card)hand.get(i)).y = 450;
    ((Card)hand.get(i)).img = back;
    i++;
  }
  gameOver = false;
}

void draw()
{
  if(state == -2)
    drawScores();
  else if(state == -1)
    drawSummary();
  else if (state == 0)
    drawMenu();
  else
    drawGame(state, cont);
}

void drawMenu()
{
  fill(0,100,0);
  rect(0,0,width,height);
  stroke(255);
  fill(255);
  textSize(80);
  text("Golf Solitaire", 170, 175);
  stroke(0);
  if(button1)
    fill(0,0,100);
  else
    fill(160);
  rect(275, 260, 250, 75);
  stroke(text1);
  fill(text1);
  textSize(30);
  text("Start Game", 324, 308);
  stroke(0);
  if(button2)
    fill(0,0,100);
  else
    fill(160);
  rect(275, 350, 250, 75);
  stroke(text2);
  fill(text2);
  textSize(30);
  text("Single Round", 310, 398);
  stroke(0);
  if(button3)
    fill(0,0,100);
  else
    fill(160);
  rect(275, 440, 250, 75);
  stroke(text3);
  fill(text3);
  textSize(30);
  text("High Scores", 321, 488);
  stroke(0);
  if(button4)
    fill(0,0,100);
  else
    fill(160);
  rect(275, 530, 250, 75);
  stroke(text4);
  fill(text4);
  textSize(30);
  text("Start Game", 324, 308);
  fill(0);
  textSize(30);
  text("Quit", 370, 578);
}

void drawGame(int hole, boolean cnt)
{
  textSize(13);
  state = hole;
  cont = cnt;
  if(state == 18)
    cnt = false;
  fill(0,100,0);
  rect(0,0,width,height);
  stroke(0);
  for(int i = 0; i<column1.size(); i++)
    ((Card)column1.get(i)).display();
  for(int i = 0; i<column2.size(); i++)
    ((Card)column2.get(i)).display();
  for(int i = 0; i<column3.size(); i++)
    ((Card)column3.get(i)).display();
  for(int i = 0; i<column4.size(); i++)
    ((Card)column4.get(i)).display();
  for(int i = 0; i<column5.size(); i++)
    ((Card)column5.get(i)).display();
  for(int i = 0; i<column6.size(); i++)
    ((Card)column6.get(i)).display();
  for(int i = 0; i<column7.size(); i++)
    ((Card)column7.get(i)).display();
  for(int i = 0; i<hand.size(); i++)
    ((Card)hand.get(i)).display();
  for(int i = 0; i<discard.size(); i++)
    ((Card)discard.get(i)).display();
  stroke(255);
  noFill();
  rect(193, 443, 98, 132);
  rect(493, 443, 98, 132);
  fill(255);
  text("Hand", 225, 590);
  text("Cards Remaining: "+hand.size(), 183, 610);
  text("Discard", 515, 590);
  if(column1.size() == 0 && column2.size() == 0 && column3.size() == 0 && column4.size() == 0 
  && column5.size() == 0 && column6.size() == 0 && column7.size() == 0)
  {
    gameOver = true;
    textSize(40);
    text("GAME OVER", 305, 75);
    textSize(20);
    int score = -1 * hand.size();
    text("Score: " + score, 375, 100);
    textSize(13);
  }
  else if(hand.size() == 0 && !checkMoves())
  {
    gameOver = true;
    textSize(40);
    text("GAME OVER", 305, 75);
    textSize(20);
    int score = column1.size() + column2.size() + column3.size() + column4.size() + column5.size() + column6.size() + column7.size();
    text("Score: " + score, 375, 100);
    textSize(13);
    if(cont)
      text("TRUE", 45, 45);
    else
      text("FALSE", 45, 45);
  }
}

void drawScores()
{
  fill(0,100,0);
  rect(0,0,width,height);
  stroke(255);
  fill(255);
  textSize(80);
  text("High Scores", 190, 175);
}

void drawSummary()
{
  fill(0,100,0);
  rect(0,0,width,height);
  stroke(255);
  fill(255);
  textSize(80);
  text("Game Summary", 190, 175);
}

int getColumn()
{
  int x = mouseX;
  if(75<=x && x<=159)
    return 1;
  if(175<=x && x<=259)
    return 2;
  if(275<=x && x<=359)
    return 3;
  if(375<=x && x<=459)
    return 4;
  if(475<=x && x<=559)
    return 5;
  if(575<=x && x<=659)
    return 6;
  if(675<=x && x<= 759)
    return 7;
  return -1;
}

void flipCard(int col)
{
  int target;
  int current = ((Card)discard.get(discard.size()-1)).num;
  if(col == 1 && column1.size() > 0 && ((Card)column1.get(column1.size()-1)).y <= mouseY && mouseY <= (((Card)column1.get(column1.size()-1)).y + 118))
  {
    target = ((Card)column1.get(column1.size()-1)).getNum();
    if(((Card)column1.get(column1.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column1.remove(column1.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used); 
      if(column1.size() > 0)
        ((Card)column1.get(column1.size()-1)).makePlayable();
    }
  }
  if(col == 2 && column2.size() > 0 && ((Card)column2.get(column2.size()-1)).y <= mouseY && mouseY <= (((Card)column2.get(column2.size()-1)).y + 118))
  {  
    target = ((Card)column2.get(column2.size()-1)).getNum();
    if(((Card)column2.get(column2.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column2.remove(column2.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column2.size() > 0)
        ((Card)column2.get(column2.size()-1)).makePlayable();
    }
  }
  if(col == 3 && column3.size() > 0 && ((Card)column3.get(column3.size()-1)).y <= mouseY && mouseY <= (((Card)column3.get(column3.size()-1)).y + 118))
  {
    target = ((Card)column3.get(column3.size()-1)).getNum();
    if(((Card)column3.get(column3.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column3.remove(column3.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column3.size() > 0)
        ((Card)column3.get(column3.size()-1)).makePlayable();
    }
  }
  if(col == 4 && column4.size() > 0 && ((Card)column4.get(column4.size()-1)).y <= mouseY && mouseY <= (((Card)column4.get(column4.size()-1)).y + 118))
  {
    target = ((Card)column4.get(column4.size()-1)).getNum();
    if(((Card)column4.get(column4.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column4.remove(column4.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column4.size() > 0)
        ((Card)column4.get(column4.size()-1)).makePlayable();
    }
  }
  if(col == 5 && column5.size() > 0 && ((Card)column5.get(column5.size()-1)).y <= mouseY && mouseY <= (((Card)column5.get(column5.size()-1)).y + 118))
  {
    target = ((Card)column5.get(column5.size()-1)).getNum();
    if(((Card)column5.get(column5.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column5.remove(column5.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column5.size() > 0)
        ((Card)column5.get(column5.size()-1)).makePlayable();
    }
  }
  if(col == 6 && column6.size() > 0 && ((Card)column6.get(column6.size()-1)).y <= mouseY && mouseY <= (((Card)column6.get(column6.size()-1)).y + 118))
  {
    target = ((Card)column6.get(column6.size()-1)).getNum();
    if(((Card)column6.get(column6.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column6.remove(column6.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column6.size() > 0)
        ((Card)column6.get(column6.size()-1)).makePlayable();
    }
  }
  if(col == 7 && column7.size() > 0 && ((Card)column7.get(column7.size()-1)).y <= mouseY && mouseY <= (((Card)column7.get(column7.size()-1)).y + 118))
  {
    target = ((Card)column7.get(column7.size()-1)).getNum();
    if(((Card)column7.get(column7.size()-1)).isPlayable() && Math.abs(current - target) == 1)
    {
      Card used = (Card)column7.remove(column7.size()-1);
      used.x = 500;
      used.y = 450;
      discard.add(used);
      if(column7.size() > 0)
        ((Card)column7.get(column7.size()-1)).makePlayable();
    }
  }
}

void mouseReleased()
{
  if(state == 0)
  {
    if(275 <= mouseX && mouseX <= 525)
    {
      if(260 <= mouseY && mouseY <= 335)
        drawGame(1, true);
      else if (350 <= mouseY && mouseY <= 425)
        drawGame(1, false);
      else if (440 <= mouseY && mouseY <= 515)
        drawScores();
      else if (530 <= mouseY && mouseY <= 605)
        System.exit(0);
    }
    button1 = false;
    button2 = false;
    button3 = false;
    button4 = false;
    text1 = 0;
    text2 = 0;
    text3 = 0;
    text4 = 0;
  }
}

void mousePressed()
{ 
  if(state == 0)
  {
    if(275 <= mouseX && mouseX <= 525)
    {
      if(260 <= mouseY && mouseY <= 335)
      {
        button1 = true;
        text1 = 255;
      }
      else if (350 <= mouseY && mouseY <= 425)
      {
        button2 = true;
        text2 = 255;
      }
      else if (440 <= mouseY && mouseY <= 515)
      {
        button3 = true;
        text3 = 255;
      }
      else if (530 <= mouseY && mouseY <= 605)
      {
        button4 = true;
        text4 = 255;
      }
    }
  }
  else if(state > 0)
  {
    if(gameOver)
    {
      if(cont)
      {
        state++;
        gameOver = false;
      }
      else
        state = -1;
    }
    else if(200 <= mouseX && mouseX <= 284 && 450 <= mouseY && mouseY <= 568)
      drawCard();
    else if(discard.size()>0)
    {
      int col = getColumn();
      if(col != -1)
        flipCard(col);
    }
  }
}


void keyPressed()
{
  
}

void drawCard()
{
  if(!gameOver && hand.size() > 0)
  {
   Card used = (Card)hand.remove(hand.size()-1);
   used.img = used.face; 
   used.x = 500;
   used.y = 450;
   discard.add(used);
  }
}

boolean checkMoves()
{
  ArrayList playableCards = new ArrayList();
  int current = ((Card)discard.get(discard.size()-1)).getNum();
  if(column1.size() > 0)
    playableCards.add(column1.get(column1.size()-1));
  if(column2.size() > 0)
    playableCards.add(column2.get(column2.size()-1));
  if(column3.size() > 0)
    playableCards.add(column3.get(column3.size()-1));
  if(column4.size() > 0)
    playableCards.add(column4.get(column4.size()-1));
  if(column5.size() > 0)
    playableCards.add(column5.get(column5.size()-1));
  if(column6.size() > 0)
    playableCards.add(column6.get(column6.size()-1));
  if(column7.size() > 0)
    playableCards.add(column7.get(column7.size()-1));
  for(int i = 0; i < playableCards.size(); i++)
  {
    if(Math.abs(((Card)playableCards.get(i)).getNum() - current) == 1)
      return true;
  }
  return false;
}
