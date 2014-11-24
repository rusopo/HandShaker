package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Servicio_ofrecido{
	
	
	private long id_servicio_ofrecido;	
	private Usuario usuario;
	private Servicio servicio_ofrecido;
	
	@Id
    @GeneratedValue
	public long getId_servicio_ofrecido() {
		return id_servicio_ofrecido;
	}
	public void setId_servicio_ofrecido(long id_servicio_ofrecido) {
		this.id_servicio_ofrecido = id_servicio_ofrecido;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un servicio ofrecido es para 1 usuario
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@OneToOne(targetEntity=Servicio.class) //Un servicio ofrecido corresponde a 1 servicio
	public Servicio getServicio_ofrecido() {
		return servicio_ofrecido;
	}
	public void setServicio_ofrecido(Servicio servicio_ofrecido) {
		this.servicio_ofrecido = servicio_ofrecido;
	}


}