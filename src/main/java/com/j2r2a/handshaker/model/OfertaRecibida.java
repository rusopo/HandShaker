package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

/*
@Entity

@NamedQueries({
	
    @NamedQuery(name="ListaOfertaRecibidaUsuario",query="SELECT s FROM OfertaRecibida s"),
    
})

public class OfertaRecibida{
	
	
	private long id;	
	private ServicioOfrecido servicioRecibido;
	private Usuario usuario;
	private Negociacion negociacion;
	
	@Id
    @GeneratedValue
	public long getId_oferta_recibida() {
		return id;
	}
	public void setId_oferta_recibida(long id) {
		this.id = id;
	}
	
	@OneToOne(targetEntity=ServicioOfrecido.class)  //Una oferta recibida corresponde a 1 servicio ofrecido
	public ServicioOfrecido getServicio_recibido() {
		return servicioRecibido;
	}
	public void setServicio_recibido(ServicioOfrecido servicioRecibido) {
		this.servicioRecibido = servicioRecibido;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un oferta recibida es para 1 usuario
	public Usuario getUsuario_receptor() {
		return usuario;
	}
	public void setUsuario_receptor(Usuario usuarioReceptor) {
		this.usuario = usuarioReceptor;
	}
	
	@OneToOne(targetEntity=Negociacion.class) //Una oferta recibida tiene 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}
	

}*/