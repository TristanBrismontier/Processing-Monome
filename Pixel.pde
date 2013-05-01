class Pixel
{

  int x;
  int y;
  color c;
  int sw;
  int w;
  int col=0;
  boolean fs=false;
  SquareWave sine;
  float [] freq = new float[2];


  Pixel(int x_, int y_)
  {
    x = x_;
    y = y_;
    c = color(255,255,212); 
    w=30;
    sine = new SquareWave(0, 0.5,out.sampleRate());
  }

  Pixel(int x_, int y_, int w_, int sw_,float freq1_,float freq2_)
  {
    x = x_;
    y = y_;
    c = color(255,255,212); 
    w = w_;
    sw = sw_;
    sine = new SquareWave(0, 0.5,out.sampleRate());
    freq[0]=freq1_;
    freq[1]=freq2_;

  }

  void display()
  {
    strokeWeight(sw);
    fill(c);
    rectMode(CORNER);
    rect(x,y,w,w);
  }

  boolean pospix(float mx, float my)
  {
    boolean resp=false;
    if(mx>=x && mx<=x+w)
    {
      if(my>=y && my<=y+w)
      {
        resp=true;
        fs=!fs;
      }
    }
    return resp;
  }

  void init()
  {
    fs = false;
  }

  void changeColor(int col_)
  {
    col = col_;
    if(col == 0)
    {
      out.removeSignal(sine);      
      if(fs==true)
      {
        c = color(255,209,9);
      }
      else
      {

        c = color(255,255,212);
      }

    }
    else
    {
      
      if(fs==true)
      {
        c = color(255,80,62);
        sine.setFreq(freq[oct]);
        out.addSignal(sine);
      }
      else
      {
        c = color(255,208,154);
      }

    }

    
  }


void changeColor()
  {
    if(col == 0)
    {
      out.removeSignal(sine);      
      if(fs==true)
      {
        c = color(255,209,9);
      }
      else
      {

        c = color(255,255,212);
      }

    }
    else
    {
      
      if(fs==true)
      {
        c = color(255,80,62);
        sine.setFreq(freq[oct]);
        out.addSignal(sine);
      }
      else
      {
        c = color(255,208,154);
      }

    }

    
  }


}













