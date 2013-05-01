/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/6455*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
Freq freqs;
Pixel[][] pix = new Pixel[16][8];

Potar potarVol;
int w=40;
int sw = 5;
int pi =0;
int pia=15;
int oct=0;
int vit=5;


void setup(){
  size(900,520);
  background(0);
  frameRate(30);

  freqs = new Freq();
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);

  potarVol = new Potar(40,170);  

  for(int i=0;i<16;i++)
  {
    for(int j=0;j<8;j++)
    {       
      pix[i][j] = new Pixel(85+i*50,60+j*50,w,sw,freqs.tab[0][j],freqs.tab[1][j]);
    }
  }
}



void draw()
{
  potarVol.display();
  if(mousePressed)
  {
    if(potarVol.check(mouseX,mouseY))
    { 
      potarVol.move(mouseY);
      for(int i=0;i<16;i++)
      {
        for(int j=0;j<8;j++)
        { 
          pix[i][j].sine.setAmp(potarVol.getValue());
        }
      }
    }
  }




  if(frameCount % vit == 0)
  {

    if(pi==16)
    {
      pi=0;
      pia=15;
    }
    for(int j=0;j<8;j++)
    { 

      pix[pi][j].changeColor(1);
      pix[pi][j].display();
      pix[pia][j].changeColor(0);
      pix[pia][j].display();
    }  
    pia=pi;
    pi++;
  }  
}



void mousePressed()
{
  for(int i=0;i<16;i++)
  {
    for(int j=0;j<8;j++)
    {
      if(pix[i][j].pospix(mouseX,mouseY)==true)
      {
        pix[i][j].changeColor(0);
        pix[i][j].display();
      }
    }
  }
}


void keyPressed()
{
  if(key==' ')
  {
    for(int i=0; i<16;i++)
    {
      for(int j=0; j<8 ;j++)
      {
        pix[i][j].init();
        pix[i][j].changeColor(0);
      }
    }
    for(int i=0;i<16;i++)
    {
      for(int j=0;j<8;j++)
      {
        pix[i][j].display(); 
      }
    }

  }
  if(keyCode==LEFT)
  {
    vit++;
  }
  if(keyCode == RIGHT)
  {
    vit--;
  }
  vit = constrain(vit,1,30);
  if(keyCode==UP)
  {
    oct=0;
    for(int i=0; i<16;i++)
    {
      for(int j=0; j<8 ;j++)
      {
        pix[i][j].changeColor();
      }
    }
  }

  if(keyCode==DOWN)
  {
    oct=1;
    for(int i=0; i<16;i++)
    {
      for(int j=0; j<8 ;j++)
      {
        pix[i][j].changeColor();
      }
    }
  }
}


void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

















