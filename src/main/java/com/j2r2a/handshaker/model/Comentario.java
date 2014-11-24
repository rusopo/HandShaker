package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Comentario{
	

	private long id_comentario;	
	private Usuario usuario;
	private String texto_comentario;
	private Negociacion negociacion;
	
	@Id
    @GeneratedValue
	public long getId_comentario() {
		return id_comentario;
	}
	public void setId_comentario(long id_comentario) {
		this.id_comentario = id_comentario;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un comentario es de 1 usuario
	public Usuario getId_usuario() {
		return usuario;
	}
	public void setId_usuario(Usuario id_usuario) {
		this.usuario = id_usuario;
	}
	
	public String getTexto_comentario() {
		return texto_comentario;
	}
	public void setTexto_comentario(String texto_comentario) {
		this.texto_comentario = texto_comentario;
	}
	
	@OneToOne(targetEntity=Negociacion.class) //Un comentario es de 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}
	
			
}