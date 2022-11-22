class Pantalla {
  
  PImage fondo;
  
  Pantalla(String nom) {
    this.fondo = loadImage(nom);
  }
  
  
  void mostrar(){
    
    image(this.fondo, 0, 0, width, height);
  }  
}
