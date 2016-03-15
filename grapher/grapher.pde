/*Program: Amazing Graphing Program
  Author:  Nicholas Mullikin
  Date:    11/10/14
  Notes:    The asciify function takes its data from the picture of the graph.
            The data only outputs to the text file when the graph is clicked.
    */
//import g4p_controls.*;
PrintWriter output;
PrintWriter output1;
PImage img;
int res ;//how often the characters are placed
char[] chars;

float a = 1;//y = a(x-h)^2+k
float size = 1;
int ch = 0;
float h = 0;
float k = 0;
int lx;
float x = 0;
float y = 0;
PFont regular = createFont("Calibria",12);



void setup()
{
  size (900,600);
   output = createWriter("data/graph.txt");
  output1 = createWriter("data/info.txt"); 
  //size(img.width,img.height);
  
}//setup end
void draw()
{

  
  

if (a < 0.00001 && a > - 0.00001)//prevents a  = 0
{
  if (random(10)>=5)
   {a=0.00001;}
  else
   {a=-0.00001;} 
}


drawGrid();

if(ch % 2 == 0)//click on off
  {
  h = map(mouseX,0,600,-80,80);
  k = map(mouseY,0 , 600, -80,80);//real coordinates
  lx = mouseX;
  }

for ( int i = 0; i <600 ; i+=18)
 {
 stroke(0,0,255);
 if (lx >600)
  {
    lx = 600; 
  }
 line(lx, 5+i,lx, 10+i );//parabolic line
  
}

grapher();
information();

if (keyPressed && (key == 's' || key == 'S'))
{
save("graph");
}

if (keyPressed && (key == 'a' || key == 'A'))
{
  img = loadImage("graph.tif");
asciify1();
}
if (keyPressed && (key == 'z' || key == 'Z'))
{
  img = loadImage("graph.tif");
asciify();
}

}//end

void grapher()
{
for (x = -80; x < 80; x+=1)//grapher
  {
    float a1 = map(a, -10,10,-20,20);
         y = a1*(sq(x-h))+k;
  float y2 = a1*(sq(x+1-h))+k; 
  
  float x1 = map(x , -80, 80,0,600);
  float y1 = map(y , -80, 80,0,600);
  float x2 = map(x+1 , -80, 80,0,600);
        y2 = map(y2 , -80, 80,0,600);
  line(x1,y1,x2,y2);
  stroke(30,0,100);
  ellipse(x1,y1,2,2);
  //println(x1+" "+y);
  ellipse(mouseX,mouseY,2,2);
  //ellipse(300, x, 3,3);
}
}



void information()
{
//roots
                                                                                                                                                                                                                                                  
float b = -2 * h * (a);
float c = h*(h) * (a) + k;
float quadformn = (-b-sqrt(sq(b)-4*a*c))/2*a;
float quadformp = (-b+sqrt(sq(b)-4*a*c))/2*a; 
float imgp1 = (sqrt(-1*(sq(b)-4*a*c)))/2*a;
float imgp2 = (-b)/2*a;
float imgn1 = (-sqrt(-1*(sq(b)-4*a*c)))/2*a;
float imgn2 = (-b)/2*a;

//ellipse( 300+map(quadformn, -80 , 80 ,-300  ,300), 300 ,3,3);


fill(0, 102, 153,204);//information
textFont(regular);

if ( (sq(b)-4*a*c) > 0)
{
  text("The roots of this equation are "+quadformp+" and "+quadformn,605,30);
 // println("The roots of this equation are "+quadformp+ "and "+quadformn,605,30);
}
else if ( (sq(b)-4*a*c) == 0)
{
  text("The root of this equation is "+quadformp,605,30);
  
}
else if ( (sq(b)-4*a*c) < 0)
{
  if (imgn2 > 0 && imgp2 > 0)
  {
    text("The roots of this equation are "+imgp1+"i + "+imgp2+"\n and "+imgn1 + "i + "+imgn2,605,15);
    
  }
  else if (imgn2 < 0 && imgp2 > 0)
  {
    text("The roots of this equation are "+imgp1+"i + "+imgp2+"\n and "+imgn1 + "i - "+(-imgn2),605,15);
    
    
  }
  
  else if (imgn2 > 0 && imgp2 < 0)
  {
    text("The roots of this equation are "+imgp1+"i - "+(-imgp2)+"\n and "+imgn1 + "i + "+imgn2,605,15);
  
    
  }
  
  else if (imgn2 < 0 && imgp2 < 0)
  {
    text("The roots of this equation are "+imgp1+"i - "+(-imgp2)+"\n and "+imgn1 + "i - "+(-imgn2),605,15);
    
    
  }

}



if ( b >= 0 && c >= 0)
{
text("y = "+(-a)+" * x^2 + "+(b)+" x + "+(c),605,50);

}
else if ( b >= 0 && c < 0)
{
text("y = "+(-a)+" * x^2 + "+(b)+" x - "+(-c),605,50);

}
else if ( b < 0 && c >= 0)
{
text("y = "+(-a)+" * x^2 - "+(-b)+" x + "+(c),605,50);
}
else if ( b < 0 && c < 0)
{
text("y = "+(-a)+" * x^2 - "+(-b)+" x - "+(-c),605,50);
}




if ( h >= 0 && k >= 0)
{
text("y = "+(-a)+" * ( h - "+(h)+")^2 + "+k,605,70);
}
else if ( h >= 0 && k < 0)
{
text("y = "+(-a)+" * ( h - "+(h)+")^2 - "+(-k),605,70);
}
else if ( h < 0 && k >= 0)
{
text("y = "+(-a)+" * ( h + "+(-h)+")^2 + "+k,605,70);
}
else if ( h <= 0 && k <= 0)
{
text("y = "+(-a)+" * ( h + "+(-h)+")^2 - "+(-k),605,70);
}


text("X of parabola is "+(h/4)+"     Y is "+ (-k/4)+" ",605,120);
text("-To stop the parabola from moving, hit 'space' ",605,150);
text("-To save a picture of the graph, hit 's' ",605,175);
text("-To asciify the saved graph on screen, hold 'a' ",605,200);
text("-To asciify the saved graph in a text file, press 'z' ",605,225);
text("-To manually change the a value,\n use the mouse wheel",605,250);

//text((mouseX-300)+" "+(-mouseY+300),mouseX+5,mouseY+5);
text((mouseX)+" "+(mouseY),mouseX+5,mouseY+5);
for (int i = -10; i <=10; i++)
  {
  text("  X     |     Y  ",682,295);//table
  
  text("____________________",650,295);
 
  text("|",710,410+i*10);
 
  text(i+" ",690,415+i*10); 
  
  text(a*(sq(i-h))+k,720,415+i*10); 

  
  
  }
}


void keyPressed()
{
  if (key == ' ')
{
 ch++; 
}  
  
}


void mouseWheel(MouseEvent event) {
  if (a<2&&a>-2)
  {
    if(event.getCount() == 1)
      {a=a-0.1;
    }
    if(event.getCount() == -1)
      {a=a+0.1;
    }
  }
  else
  {
    if(event.getCount() == 1)
      {a=a-1;
    }
    if(event.getCount() == -1)
      {a=a+1;
    }
  }
  //changes a value or slope
}


void mouseClicked()
{
  //ch++;
if (mouseButton == LEFT)
{
  a = random(10);
}
  if (mouseButton == RIGHT)
{
  a = random(-10,0);
}
//roots
                                                                                                                                                                                                                                                  
float b = -2 * h * (a);
float c = h*(h) * (a) + k;
float quadformn = (-b-sqrt(sq(b)-4*a*c))/2*a;
float quadformp = (-b+sqrt(sq(b)-4*a*c))/2*a; 
float imgp1 = (sqrt(-1*(sq(b)-4*a*c)))/2*a;
float imgp2 = (-b)/2*a;
float imgn1 = (-sqrt(-1*(sq(b)-4*a*c)))/2*a;
float imgn2 = (-b)/2*a;
fill(0, 102, 153,204);//information
textFont(regular);

if ( (sq(b)-4*a*c) > 0)
{
  output1.println("The roots of this equation are "+ quadformp + "and "+ quadformn);
}
else if ( (sq(b)-4*a*c) == 0)
{
  output1.println("The root of this equation is "+quadformp);
}
else if ( (sq(b)-4*a*c) < 0)
{
  if (imgn2 > 0 && imgp2 > 0)
  {
    output1.println("The roots of this equation are "+imgp1+"i + "+imgp2+"\n and "+imgn1 + "i + "+imgn2);
  }
  else if (imgn2 < 0 && imgp2 > 0)
  {
    output1.println("The roots of this equation are "+imgp1+"i + "+imgp2+"\n and "+imgn1 + "i - "+(-imgn2));  
  }
  
  else if (imgn2 > 0 && imgp2 < 0)
  {
  output1.println("The roots of this equation are "+imgp1+"i - "+(-imgp2)+"\n and "+imgn1 + "i + "+imgn2);  
  }
  else if (imgn2 < 0 && imgp2 < 0)
  {
     output1.println("The roots of this equation are "+imgp1+"i - "+(-imgp2)+"\n and "+imgn1 + "i - "+(-imgn2)); 
  }

}



if ( b >= 0 && c >= 0)
{
output1.println("y = "+(-a)+" * x^2 + "+(b)+" x + "+(c));
}
else if ( b > 0 && c < 0)
{
output1.println("y = "+(-a)+" * x^2 + "+(b)+" x - "+(-c));
}
else if ( b <= 0 && c >= 0)
{
output1.println("y = "+(-a)+" * x^2 - "+(-b)+" x + "+(c));
}
else if ( b < 0 && c < 0)
{
output1.println("y = "+(-a)+" * x^2 - "+(-b)+" x - "+(-c));
}




if ( h >= 0 && k >= 0)
{
output1.println("y = "+(-a)+" * ( h - "+(h)+")^2 + "+k);
}
else if ( h >= 0 && k < 0)
{
output1.println("y = "+(-a)+" * ( h - "+(h)+")^2 - "+(-k));
}
else if ( h < 0 && k >= 0)
{

output1.println("y = "+(-a)+" * ( h + "+(-h)+")^2 + "+k);
}
else if ( h <= 0 && k <= 0)
{

output1.println("y = "+(-a)+" * ( h + "+(-h)+")^2 - "+(-k));
}

output1.println("  X     |     Y  \n");
  output1.println("\n____________________");
for (int i = -10; i <=10; i++)
  {
  
  
  output1.print(i);
  output1.print(" |");
  output1.println(a*(sq(i-h))+k);


}//switches between moving and not moving




output1.flush();
output1.close();

}


void drawGrid() 
{
  
background(255);  
stroke(200);
for ( int  i = 0; i <40; i ++)//graph lines
  { 
//  line(0,0+i*30*(1/abs(a)),600,0+i*30*(1/abs(a)));
//  line(0+i*30*(1/abs(a)),0,0+i*30*(1/abs(a)),600);
  line(0,0+i*15,600,0+i*15);
  line(0+i*15,0,0+i*15,600);
  line(1,330, 1,270);
  }
  
stroke(0);
line(0,300,600,300);
line(300,0,300,600);
fill(255,0,0);
stroke(255,0,0);
ellipse(mouseX,mouseY,8,8);
}


void asciify()
{ 
  background(255);
  res = 2;
  //res = 1+mouseX/50;
  String[] text = new String[900];
  chars = new char[256];
  String letters = "█▓#@$o;:|_,.";
 // String letters = "█▓▒░#≡%$@*o;:_,.";
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letters.length()));//changes the length of the string into 256 character to make setting the brightness easier
    chars[i] = letters.charAt(index);
  }
  //PFont mono = createFont("Ariel",1+mouseY/50);
  PFont mono = createFont("Ariel",5);
  textFont(mono);
 
  
  img.filter(GRAY);
  img.loadPixels();
  for (int y = 0; y < img.height; y += res) {
    for (int x = 0; x < img.width; x += res) {
       
      color pixel = img.pixels[y * img.width + x];
      //text(chars[int(brightness(pixel))], x, y);
      output.print(chars[int(brightness(pixel))]);
      
    }
    output.println(" ");
    
  }
 output.flush();  // Writes the remaining data to the file
output.close(); 
  
  //println((1+mouseY/50)+" "+(1+mouseX/50));
 // println(res);
}


void asciify1()
{ 
  background(255);
  res = 2;
  //res = 1+mouseX/50;
  String[] text = new String[900];
  chars = new char[256];
  String letters = "█▓#@$o;:|_,.";
 // String letters = "█▓▒░#≡%$@*o;:_,.";
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letters.length()));//changes the length of the string into 256 character to make setting the brightness easier
    chars[i] = letters.charAt(index);
  }
  //PFont mono = createFont("Ariel",1+mouseY/50);
  PFont mono = createFont("Ariel",5);
  textFont(mono);
 
  
  img.filter(GRAY);
  img.loadPixels();
  for (int y = 0; y < img.height; y += res) {
    for (int x = 0; x < img.width; x += res) {
       
      color pixel = img.pixels[y * img.width + x];
      text(chars[int(brightness(pixel))], x, y);
      //output.print(chars[int(brightness(pixel))]);
      
    }
   // output.println(" ");
    
  }
//output.flush(); // Writes the remaining data to the file
//  output.close(); // Finishes the file
  //exit();
  
  //println((1+mouseY/50)+" "+(1+mouseX/50));
 // println(res);
}
