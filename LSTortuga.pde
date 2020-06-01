
//import shapes3d.*;
//import shapes3d.path.*;
//import shapes3d.contour.*;

public class LSTortuga{

    PGraphics pg;
    PShape ramas;
    PShape flores;
    PShape arbol;
    float angulo_original;
    float largo_original;
    float grosor_original;
    boolean[] esqueleto;
    PImage texturaHoja;
    PImage texturaCorteza;

    public LSTortuga(){
        this.pg = new PGraphics();
        ramas = createShape(GROUP);
        flores = createShape(GROUP);
        arbol = createShape(GROUP);
        this.angulo_original = 0.0;
        this.largo_original = 0.0;
        this.grosor_original = 0.0;
        this.esqueleto = new boolean[2];
        this.esqueleto[0] = false;
        this.esqueleto[1] = false;
        texturaHoja = loadImage("recursos/hoja.jpg");
        texturaCorteza = loadImage("recursos/corteza.jpg");
    
    }

    public LSTortuga(PGraphics v,float a,float l,float g,boolean[] esq){
        this.pg = v;
        ramas = createShape(GROUP);
        flores = createShape(GROUP);
        arbol = createShape(GROUP);
        this.angulo_original = a;
        this.largo_original = l;
        this.grosor_original = g;
        this.esqueleto = esq;
        texturaHoja = loadImage("recursos/hoja.jpg");
        texturaCorteza = loadImage("recursos/corteza.jpg");
    }

    public PShape getArbol(){
        arbol.addChild(ramas);
        arbol.addChild(flores);
        arbol.translate(0,0,300);
        return arbol;
    }

    public void dibuja(float largo,float grosor){
        /*
        //pg.line(0,0,0,0,-largo,0);
        //Tube shape = creaTubo(largo,5.0,6);
        //shape.draw(pg);
        // pg.translate(0, -largo, 0);
        */
        PShape r;
        if(esqueleto[0]){
            r = crearCilindro(12, 1, largo);
            r.setFill(color(0));
        }else if(esqueleto[1]){
            r = crearCilindro(12, grosor, largo);
            r.noFill();
            r.noTexture();
        }else{
            r = crearCilindro(12, grosor, largo);
        }

        r.applyMatrix((PMatrix3D)pg.getMatrix());
        ramas.addChild(r);
        pg.translate(0, -largo, 0);
    }

    public void giraIzquierda(float angulo){
        pg.rotateZ(radians(-angulo));
    }

    public void giraDerecha(float angulo){
        pg.rotateZ(radians(angulo));
    }


    public void guarda(){
        pg.pushMatrix();
    }

    public void restaura(){       
        pg.popMatrix();
    }

    public void inclinarAtras(float angulo){
        pg.rotateX(radians(angulo));
    }

    public void inclinarAdelante(float angulo){
        pg.rotateX(radians(-angulo));
    }

    public void rotaIzquierda(float angulo){
        pg.rotateY(radians(-angulo));
    }

    public void rotaDerecha(float angulo){
        pg.rotateY(radians(angulo));
    }

    public void flor(float largo){
        /*
        pg.strokeWeight(5);
        pg.point(0,0,0);
        pg.strokeWeight(1);
        */
        PShape flor;
        if(esqueleto[0]){
            flor = createShape(SPHERE,5);
            flor.setFill(color(0));
        }else if(esqueleto[1]){
            flor = createShape(ELLIPSE,0, -largo/4, 5, 10);
            flor.noFill();
            flor.noTexture();
        }else{    
            flor = createShape(ELLIPSE,0, -largo/4, 5, 10);
            flor.setTexture(texturaHoja);
            //flor.setFill(color(0, 255, 40));
        }

        flor.applyMatrix((PMatrix3D)pg.getMatrix());
        flores.addChild(flor);
    }

    PShape crearCilindro(int caras, float r, float h) {
 
        PShape cilindro = createShape(GROUP);
        
        float angulo = 360 / caras;
        float alturaMedia = h / 2;
        
        // tapa de arriba
        PShape tapa1 = createShape();
        tapa1.beginShape();
        for (int i = 0; i < caras; i++) {
            float x = cos( radians( i * angulo ) ) * r;
            float y = sin( radians( i * angulo ) ) * r;
            tapa1.vertex( x, y, -alturaMedia);
        }
        tapa1.endShape(CLOSE);
        tapa1.setFill(color(240, 147, 91));
        cilindro.addChild(tapa1);
        
        // tapa de abajo
        PShape tapa2 = createShape();
        tapa2.beginShape();
        for (int i = 0; i < caras; i++) {
            float x = cos( radians( i * angulo ) ) * r;
            float y = sin( radians( i * angulo ) ) * r;
            tapa2.vertex( x, y, alturaMedia);
        }
        tapa2.endShape(CLOSE);
        tapa2.setFill(color(240, 147, 91));
        cilindro.addChild(tapa2);
        
        // pared del cuerpo
        PShape pared = createShape();
        pared.beginShape(QUAD_STRIP);
        pared.texture(texturaCorteza);
        for (int i = 0; i < caras + 1; i++) {
            float x = cos( radians( i * angulo ) ) * r;
            float y = sin( radians( i * angulo ) ) * r;
            float u = texturaCorteza.width / caras * i;
            pared.vertex( x, y, alturaMedia,u,0);
            pared.vertex( x, y, -alturaMedia,y,texturaCorteza.height);
        }
        pared.endShape(CLOSE);
        cilindro.addChild(pared);
        
        cilindro.rotateX(TWO_PI/4);
        cilindro.translate(0,-h/2,0);

        return cilindro;
    }


    /*
    Tube creaTubo(float largo,float radio,int detalle){
        Path path = new Linear(new PVector(0, 0, 0), new PVector(0, -largo, 0), 1);
        Oval hexagon = new Oval(radio, detalle);
        return new Tube(path, hexagon);
    }
    */

}
