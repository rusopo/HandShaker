package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity

@NamedQueries({
	@NamedQuery(name="ExisteValoracionPorId",query="SELECT DISTINCT v FROM Valoracion v WHERE v.id= :IdValoracionMetido"),
	@NamedQuery(name="ListaValoracionesUsuarios",query="SELECT v FROM Valoracion v WHERE v.usuarioQueValora = :UsuarioMetido AND v.estaValorado = false"),
	@NamedQuery(name="ListaValoracionesPorId",query="SELECT v FROM Valoracion v JOIN v.usuarioValorado u WHERE u.id = :IDUsuarioMetido AND v.estaValorado=true")
})

public class Valoracion {
	
	private long id;
	private Usuario usuarioValorado;
	private Usuario usuarioQueValora;
	private long puntuacion;
	private boolean estaValorado;
	
	public static Valoracion crearValoracion(Usuario usuarioValorado,Usuario usuarioQueValora,long puntuacion,boolean estaValorado){
		
		Valoracion v= new Valoracion();
		
		v.usuarioValorado=usuarioValorado;
		v.usuarioQueValora=usuarioQueValora;
		v.puntuacion=puntuacion;
		v.estaValorado=estaValorado;
		
		return v;
		
	}
	
	@Id
    @GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@OneToOne(targetEntity=Usuario.class)
	public Usuario getUsuarioValorado() {
		return usuarioValorado;
	}
	public void setUsuarioValorado(Usuario usuarioValorado) {
		this.usuarioValorado = usuarioValorado;
	}
	
	@OneToOne(targetEntity=Usuario.class)
	public Usuario getUsuarioQueValora() {
		return usuarioQueValora;
	}
	public void setUsuarioQueValora(Usuario usuarioQueValora) {
		this.usuarioQueValora = usuarioQueValora;
	}
	public long getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(long puntuacion) {
		this.puntuacion = puntuacion;
	}

	public boolean isEstaValorado() {
		return estaValorado;
	}

	public void setEstaValorado(boolean estaValorado) {
		this.estaValorado = estaValorado;
	}
	
	
}
