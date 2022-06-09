//https://youtu.be/b6jLdXsdAgg link del video, deje un comentario en la descripcion del mismo.
int cant;
int tam;
void setup (){
  size(600,600);
  cant= 21;
  tam= width/cant;
  

  }
   void draw (){
    background((random(0, 255)));
    for(int x= 0; x<cant; x++) {
     for(int y=0; y<cant;y++) { 
       float distan= dist(mouseX, mouseY,x*tam, y*tam);
       fill(0);
       stroke(200);
       circle(x*tam+tam/2,distan, cant);
       cuadradorein();
      } 
    } 
 }
 void keyPressed(){
   if( key ==  's')
   cant= 21;
    }
 void mousePressed(){
   cant++;
   }
 void cuadradorein(){
   
   fill(#E50C0F);
   rect(460,550,100,50);
   textSize(10);
   fill(0);
   text("flash warning",470 ,580);
   }
   
