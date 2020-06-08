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
    PGraphics v;
    PeasyCam pcam;
    LSystem ls;
    boolean primerValidate;
    
    //Constructor
    public Arbol3D (PeasyCam pcam) {
        this.pcam = pcam;

        this.ls = arbolSys;
        this.v = (PGraphics3D) getGraphics();

        LSRegla r = new LSRegla("A","^FB//B/////B*");
        LSRegla r1 = new LSRegla("B","[^^F//////A*]");
        //LSRegla r = new LSRegla("F","F[-/F]+F");
        //LSRegla r1 = new LSRegla("X","F-[[/////X]+X]-X");
        ArrayList<LSRegla> reg = new ArrayList<LSRegla>();
        reg.add(r);
        reg.add(r1);
        ls = new LSystem(4,"FA",5.0,35.0,30.0,reg,0.8,0.8);
        //ls = new LSystem(2,"F",3.0,35.0,50.0,reg);
        ls.genera();
        
        arbolSys = ls;
        
        primerValidate = false;
    }

    //Equivale al draw 
    public void update() {
        //Cada frame se obtienen los graficos del Applet pader padar dibujar
        v = (PGraphics3D) getGraphics();
        v.beginDraw();
        //A partir de aqui se puede dibujar en el buffer
        v.resetMatrix();
        v.lights(); //Luces ;)
        v.background(20, 20, 120);
        v.translate(width()/2,height()/2);
        pcam.feed();
        //sistema de coordenadas
        v.stroke(255,0,0);
        v.line(50,0,0,100,0,0);
        v.text('X',100,0,0);
        v.stroke(0,255,0);
        v.line(50,0,0,50,-50,0);
        v.text('Y',50,-50,0);
        v.stroke(0,0,255);
        v.line(50,0,0,50,0,50);
        v.text('z',50,0,50);
        
        v.stroke(0);

        ls.dibuja(v);

        v.endDraw();

        //Solo se ejecuta la primera vez
        if(primerValidate == false){
            validate(); // No se necesita, siempre se refresca,pero para optimizar el buffer se deja
            //pcam.setDistance(300); //Testing distancia ideal
            primerValidate = true;
        }

    }

    public void mouseEntered() {
        invalidate();
    }

    public void mouseExited() {
        validate();
    }
    
    public void updateArbolView(LSystem nuevo){
        this.pcam.reset();
        this.ls = nuevo;
        primerValidate = false;
        invalidate();
    }


}
