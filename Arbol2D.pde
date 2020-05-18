/*
--------------------------------------------------
Esta clase crea un arbol en 2d que posteriormente 
se muesta en una vista de la librerya G4P.

El listener de esta libreria se comporta como un
semaforo.

validate(); deja de hacer llamada al metodo draw()
invalidate(); hace llamada al metodo draw()
--------------------------------------------------
*/
    public class Arbol2D extends GViewListener{
    //Atributos
    
    //Constructor
    public Arbol2D () {
        
    }

    //Equivale al draw 
    public void update() {
      PGraphics v = getGraphics();
      v.beginDraw();
      v.background(211,134, 120);
        
      v.endDraw();
      validate(); // view is current no need to update
    }
    
}
