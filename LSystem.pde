import java.util.ArrayList;
import com.google.gson.*;
import java.util.Stack;
import java.io.*;

/**
 * Clase que define un sistema L-System
 * @author Joseram0n
 */
/*
  
*/
public class LSystem {
	//Atributos
	int niveles; // numero de iteraciones
	String axioma; // regla de inicio
	float grosor; // grosor para ramas
	float angulo; //angulo para turn,pitch y roll
	float largo; // longitud inicial
	float groDec; // decrecimiento de grosor
	float larDec; // decreciemiento largo
	ArrayList<LSRegla> reglas; // conjunto de reglas
	transient ArrayList<String> resultado; // resultado arlacenado
	transient LSTortuga tortuga; // tortuga de dibujado
	transient PShape arbolFinal;
	transient boolean cambio;
	transient boolean[] esqueleto;
	transient Stack<Float> pilaGro;
  	transient Stack<Float> pilaLar;

	public LSystem(){
		this.niveles =  0;
		this.axioma = new String();
		this.grosor = 0.0;
		this.angulo = 0.0;
		this.largo = 0.0;
		this.reglas = new ArrayList<LSRegla>();
		this.resultado = new ArrayList<String>();
		this.tortuga = new LSTortuga();
		this.cambio = false;
		this.esqueleto = new boolean[2];
		this.esqueleto[0] = false;
		this.esqueleto[1] = false;
		this.larDec = 1.0;
		this.groDec = 1.0;
		pilaGro = new Stack<Float>();
		pilaLar = new Stack<Float>();
  	}

	public LSystem(int n,String axi,float g,float ang,float lar,ArrayList<LSRegla> r,float dl,float dg){
		this.niveles =  n;
		this.axioma = axi;
		this.grosor = g;
		this.angulo = ang;
		this.largo = lar;
		this.reglas = r;
		this.resultado = new ArrayList<String>();
		this.tortuga = new LSTortuga();
		this.cambio = false;
		this.esqueleto = new boolean[2];
		this.esqueleto[0] = false;
		this.esqueleto[1] = false;
		this.larDec = dl;
		this.groDec = dg;
		pilaGro = new Stack<Float>();
		pilaLar = new Stack<Float>();
	}

	public int getIteraciones(){
		return this.niveles;
	}

	public void setIteraciones(int n){
		this.niveles = n;
	}

	public String getAxioma(){
		return this.axioma;
	}

	public void setAxioma(String axi){
		this.axioma = axi;
	}

	public float getGrosor(){
		return this.grosor;
	}

	public void setGrosor(float g){
		this.grosor = g;
	}

	public float getAngulo(){
		return this.angulo;
	}

	public void setAngulo(float ang){
		this.angulo = ang;
	}

	public float getLargo(){
		return this.largo;
	}

	public void setLargo(float lar){
		this.largo = lar;
	}

	public ArrayList<LSRegla> getReglas(){
		return this.reglas;
	}

	public void setReglas(ArrayList<LSRegla> rs){
		this.reglas = rs;
	}

	public ArrayList<String> getResultado(){
		return this.resultado;
	}

	public boolean[] getEsqueletoEstado(){
		return esqueleto;
	}

	public void setDecrecimientoLongitud(float dl){
		this.larDec = dl;
	}
	
	public void setDecreciemientoGrosor(float dg){
		this.groDec = dg;
	}
	
	public float getDecrecimientoLongitud(){
		return this.larDec;
	}
	
	public float getDecreciemientoGrosor(){
		return this.groDec;
	}

	public void setEsqueletoEstado(boolean estado,int tipo){
		if(tipo < 2){
			if(estado != this.esqueleto[tipo]){
				cambio = true;
				this.esqueleto[tipo] = estado;
			}
		}
	}
	
	public void guardar(){
		//Debido a un bug en JOGL,el dialogo se muesta detras del Applet.Ocurre en modo P2D/P3D
		selectOutput("Guardar fichero:", "guardarFichero",dataFile("*.json"),this,null,null);
	}

	public void cargar(){
		//Debido a un bug en JOGL,el dialogo se muesta detras del Applet.Ocurre en modo P2D/P3D
		selectInput("Selecciona un fichero:", "leerFichero",dataFile("*.json"),this,null,null);
	}

	public void leerFichero(File selection){
  		if (selection == null) {
  			println("Window was closed or the user hit cancel.");
  		} else {
  			println("User selected " + selection.getAbsolutePath());
  			try{
  			LSystem temp = new Gson().fromJson(new FileReader(selection.getAbsolutePath()), LSystem.class);

  			this.niveles = temp.getIteraciones();
  			this.axioma = temp.getAxioma();
  			this.grosor = temp.getGrosor();
  			this.angulo = temp.getAngulo();
  			this.reglas = temp.getReglas();
			this.larDec = temp.getDecrecimientoLongitud();
			this.groDec = temp.getDecreciemientoGrosor();
		
			this.resultado = new ArrayList<String>();
			this.tortuga = new LSTortuga();
			this.cambio = false;
			this.esqueleto = new boolean[2];
			this.esqueleto[0] = false;
			this.esqueleto[1] = false;
			this.pilaGro = new Stack<Float>();
			this.pilaLar = new Stack<Float>();
			this.arbolFinal = null;

			genera();

			//TESTING
			//a3d.updateArbolView(this);

  			} catch (IOException e) {
          		e.printStackTrace();
     		}
  		}
  	}

	public void guardarFichero(File selection){

		if (selection == null) {
			println("Window was closed or the user hit cancel.");
		} else {
			try{
				Writer writer = new FileWriter(selection.getAbsolutePath());
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				gson.toJson(this,writer);
				writer.close();	
			}catch (IOException e) {
				e.printStackTrace();
   			}
		}
	}

	@Override
	public String toString() {
		String out = new String();
		out = "Iteraciones: " + this.niveles;
		out = out + "\nAxiomas: " + this.axioma;
		out = out + "\nGrosor: " + this.grosor;
		out = out + "\nAngulo: " + this.angulo;
		out = out + "\nReglas: " + this.reglas.toString();
		out = out + "\nLargo: " + this.largo;
		out = out + "\n(%)Decrecimiento Grosor: " + this.groDec;
		out = out + "\n(%)Decrecimiento Largo: " + this.larDec;
		out = out + "\nResultado: " + this.resultado;
		return out;
	}

	public void genera(){
		if(reglas.size() >= 1){
			resultado.add(axioma);
			String temp = "";
			for(int i = 0; i < niveles; i++){ //itera por cada nivel
				for(int j = 0; j < resultado.get(i).length(); j++){ // itera por cada char de resultado anterior
					boolean reglaEcontrada = false;
					char c = resultado.get(i).charAt(j);
					for(int k = 0; k < reglas.size();k++){ // comparar con reglas
						if(c == reglas.get(k).getVar().charAt(0)){
							//temp = temp.replace(reglas.get(k).getVar(),reglas.get(k).getRegla());
							temp = temp + reglas.get(k).getRegla();
							reglaEcontrada = true;
						}
					}
					if(reglaEcontrada == false){
						temp = temp + c;
					}
				}
				resultado.add(temp);
				temp = "";
			}
			cambio = true;
		}
	}

	public void dibuja(PGraphics v){
		if(resultado != null){
			if(cambio == false){
				v.shape(arbolFinal);
			} else {
				for(int i = resultado.size()-1; i < resultado.size();i++){
					String temp = resultado.get(i);
					tortuga = new LSTortuga(v,this.largo,this.angulo,this.grosor,this.esqueleto); 
					float lar = this.largo;
					float gro = this.grosor;
					for(int j = 0; j < temp.length();j++){
						switch(temp.charAt(j)){
							//Movimiento
							case 'F':
								tortuga.dibuja(lar,gro);
								lar = lar * larDec;
								gro = gro * groDec;
							case 'G':
								//tortuga.mueve(param);
								break;
							//Orientacion
							case '+':
								tortuga.giraDerecha(angulo);
								break;
							case '-':
								tortuga.giraIzquierda(angulo);
								break;
							case '&':
								tortuga.inclinarAtras(angulo);
								break;
							case '^':
								tortuga.inclinarAdelante(angulo);
								break;
							case '\\':
								tortuga.rotaIzquierda(angulo);
								break;
							case '/':
								tortuga.rotaDerecha(angulo);
								break;
							case '<': //incrementar diametro
							case '>':
							case '|':
								//tortuga.gira180(param);
								break;
							//Estructura
							case '[':
							    pilaLar.push(lar);
                				pilaGro.push(gro);
								tortuga.guarda();
								break;
							case ']':
								lar = pilaLar.pop();
                				gro = pilaGro.pop();
								tortuga.restaura();
								break;
							//Crecimiento/Decrecimiento
							//por implementar
							//Flor
							case '*':
								tortuga.flor(lar);
								break;
							default:
								break;
						}
					}
					arbolFinal = tortuga.getArbol();
					cambio = false;
				}
			}
		}
	}


}
