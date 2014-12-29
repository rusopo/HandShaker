package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/*
@Entity
public class ServicioOfrecido{
	
	
	private long id;	
	private Usuario usuario;
	private Servicio servicioOfrecido;
	//private OfertaEnviada ofertaEnviada;
	
	@Id
    @GeneratedValue
	public long getId_servicio_ofrecido() {
		return id;
	}
	public void setId_servicio_ofrecido(long id) {
		this.id = id;
	}

	
	@OneToOne(targetEntity=Usuario.class) //Un servicio ofrecido es para 1 usuario
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	@OneToOne(targetEntity=OfertaEnviada.class) //Un servicio ofrecido corresponde a 1 oferta enviada
	public OfertaEnviada getOferta_enviada() {
		return ofertaEnviada;
	}
	public void setOferta_enviada(OfertaEnviada oferta_enviada) {
		this.ofertaEnviada = oferta_enviada;
	}
	
	
	@OneToOne(targetEntity=Servicio.class) //Un servicio ofrecido corresponde a 1 servicio
	public Servicio getServicio_ofrecido() {
		return servicioOfrecido;
	}
	public void setServicio_ofrecido(Servicio servicio_ofrecido) {
		this.servicioOfrecido = servicio_ofrecido;
	}

}*/