package p2;

import java.sql.Date;
import java.util.*;

public class PedidoBD {
	private int codigo;
	private int persona;
	private Date fecha;
	private float importe;
	private int estado;
	private String direccion;
	
	
	public String getDireccion() {
		return direccion;
		
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getPersona() {
		return persona;
	}
	public void setPersona(int persona) {
		this.persona = persona;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public float getImporte() {
		return importe;
	}
	public void setImporte(float importe) {
		this.importe = importe;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	
}
