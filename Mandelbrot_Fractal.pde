// Mandelbrot Fractal
// Programmed by John Costello 23/02/2019

float[][] cr=new float[1001][1001];
float[][] ci=new float[1001][1001];
float[][] zr=new float[1001][1001];
float[][] zi=new float[1001][1001];
float[][] zm=new float[1001][1001];
int[][] iterationCounter=new int[1001][1001];
float zrCurrent, ziCurrent, zrNew, ziNew;
//==========================================================================
float zoomFactor=4;
float panValueX=-0.75;
float panValueY=0;
//==========================================================================
void setup()
{  
   size(1001,1001);
   noLoop();
}
//==========================================================================
void draw()
{  
   background(255);
   mandelbrotData();
   displayFractal();
} 
//==========================================================================
void mandelbrotData()
{  
   for(int y=0;y<1001;y++)
   {
      for(int x=0;x<1001;x++)
      {
         cr[x][y]=(x-500.)/(100*zoomFactor)+panValueX;
         ci[x][y]=(y-500.)/(100*zoomFactor)+panValueY;
         zr[x][y]=0.;
         zi[x][y]=0.;
         iterationCounter[x][y]=0;
      }
   }  
   for(int iteration=1;iteration<=50;iteration++)
   {
      for(int y=0;y<1001;y++)
      {
         for(int x=0;x<1001;x++)
         {  
            zrCurrent=zr[x][y];
            ziCurrent=zi[x][y];
            zrNew=(zrCurrent*zrCurrent-ziCurrent*ziCurrent)+cr[x][y];
            ziNew=(2*zrCurrent*ziCurrent)+ci[x][y];            
            zr[x][y]=zrNew;
            zi[x][y]=ziNew;
            zm[x][y]=sqrt(zrNew*zrNew+ziNew*ziNew);
            if(zm[x][y]<=2)
            {
               iterationCounter[x][y]++;
            }  
         }
      }
   }
}
//==========================================================================
void displayFractal()
{   
   loadPixels();
   for(int y=0;y<1001;y++)
   {
      for(int x=0;x<1001;x++)
      {
         if(iterationCounter[x][y]==50)
         {
            pixels[x+y*1001]=color(255,0,0);
         }
         else if(iterationCounter[x][y]<50 && iterationCounter[x][y]>=45)
         {
            pixels[x+y*1001]=color(255,128,0);
         }
         else if(iterationCounter[x][y]<45 && iterationCounter[x][y]>=40)
         {
            pixels[x+y*1001]=color(255,255,0);
         } 
         else if(iterationCounter[x][y]<40 && iterationCounter[x][y]>=35)
         {
            pixels[x+y*1001]=color(128,255,0);
         } 
         else if(iterationCounter[x][y]<35 && iterationCounter[x][y]>=30)
         {
            pixels[x+y*1001]=color(0,255,0);
         } 
         else if(iterationCounter[x][y]<30 && iterationCounter[x][y]>=25)
         {
            pixels[x+y*1001]=color(0,255,128);
         } 
         else if(iterationCounter[x][y]<25 && iterationCounter[x][y]>=20)
         {
            pixels[x+y*1001]=color(0,255,255);
         } 
         else if(iterationCounter[x][y]<20 && iterationCounter[x][y]>=15)
         {
            pixels[x+y*1001]=color(0,128,255);
         }   
         else if(iterationCounter[x][y]<15 && iterationCounter[x][y]>=10)
         {
            pixels[x+y*1001]=color(0,0,255);
            
         } 
         else if(iterationCounter[x][y]<10 && iterationCounter[x][y]>=5)
         {
            pixels[x+y*1001]=color(128,0,255);
            
         }          
         else
         {
            pixels[x+y*1001]=color(255);
         } 
      }  
   }
   updatePixels();
}
