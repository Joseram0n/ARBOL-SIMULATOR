/*
--------------------------------------------------
Esta clase crea un arbol en 3d que posteriormente 
se muesta en una vista de la librerya G4P.

El listener de esta libreria se comporta como un
semaforo.

validate(); deja de hacer llamada al metodo draw()
invalidate(); hace llamada al metodo draw()
--------------------------------------------------
*/
    public class Arbol3D extends GViewListener{
    //Atributos

    //Constructor
    public Arbol3D () {
        
    }

    //Equivale al draw 
    public void update() {
     PGraphics v = getGraphics();
        v.beginDraw();
        v.background(20, 20, 120);
        
        v.endDraw();
        validate(); // view is current no need to update
    }


}
