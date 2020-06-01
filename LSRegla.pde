import java.util.ArrayList;

// TODO implementar sistema de probabilidad de reglas mejorado
public class LSRegla {
	
	String var;
	ArrayList<String> reglas;
	
  public LSRegla() {
    super();
    this.var = new String();
    this.reglas = new ArrayList<String>();
  }

	public LSRegla(String var, String regla) {
		super();
		this.var = var;
		this.reglas = new ArrayList<String>();
		this.reglas.add(regla);
	}

	public LSRegla(String var, ArrayList<String> reglas) {
		super();
		this.var = var;
		this.reglas = reglas;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public String getRegla() {
		return this.reglas.get(0);
	}

	public void setRegla(String regla) {
		this.reglas.set(0,regla);
	}

	public ArrayList<String> getReglas() {
		return reglas;
	}

	public void setReglas(ArrayList<String> reglas) {
		this.reglas = reglas;
	}

	@Override
	public boolean equals(Object obj) {
		LSRegla r = (LSRegla)obj;
		return this.var == r.getVar() && this.reglas == r.getReglas();
	}

	@Override
	public String toString() {
		return "Var: " + this.var + " -> " + this.reglas.toString();
	}
}
