package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;


@Entity

@NamedQueries({
	
    @NamedQuery(name="ListaOfertaRecibidaUsuario",query="SELECT DISTINCT s FROM Oferta_recibida s"),
    
})

public class Oferta_recibida{
	
	
	private long id_oferta_recibida;	
	private Servicio_ofrecido servicio_recibido;
	private Usuario usuario;
	private Negociacion negociacion;
	
	@Id
    @GeneratedValue
	public long getId_oferta_recibida() {
		return id_oferta_recibida;
	}
	public void setId_oferta_recibida(long id_oferta_recibida) {
		this.id_oferta_recibida = id_oferta_recibida;
	}
	
	@OneToOne(targetEntity=Servicio_ofrecido.class)  //Una oferta recibida corresponde a 1 servicio ofrecido
	public Servicio_ofrecido getServicio_recibido() {
		return servicio_recibido;
	}
	public void setServicio_recibido(Servicio_ofrecido servicio_recibido) {
		this.servicio_recibido = servicio_recibido;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un oferta recibida es para 1 usuario
	public Usuario getUsuario_receptor() {
		return usuario;
	}
	public void setUsuario_receptor(Usuario usuario_receptor) {
		this.usuario = usuario_receptor;
	}
	
	@OneToOne(targetEntity=Negociacion.class) //Una oferta recibida tiene 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}
	

}