package com.j2r2a.handshaker.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Oferta_enviada{
	
	private long id_oferta_enviada;		
	private Date fecha;
	private Servicio servicio_recibido;
	private Usuario usuario;
	private Negociacion negociacion;
	private List<Servicio_ofrecido> lista_servicios_ofrecidos;
	
	
	@Id
    @GeneratedValue
	public long getId_oferta_enviada() {
		return id_oferta_enviada;
	}
	public void setId_oferta_enviada(long id_oferta_enviada) {
		this.id_oferta_enviada = id_oferta_enviada;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	@OneToOne(targetEntity=Servicio.class) //Una oferta enviada tiene un servicio recibido
	public Servicio getServicio_recibido() {
		return servicio_recibido;
	}
	public void setServicio_recibido(Servicio servicio_recibido) {
		this.servicio_recibido = servicio_recibido;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Una oferta enviada es de 1 usuario
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@OneToOne(targetEntity=Negociacion.class) //Una oferta enviada le corresponde 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}
	
	@OneToMany(targetEntity=Servicio_ofrecido.class) //Una oferta enviada puede tener 0,1 o mas servicios ofrecidos
	@JoinColumn(name="id_oferta_enviada")
	public List<Servicio_ofrecido> getLista_servicios_ofrecidos() {
		return lista_servicios_ofrecidos;
	}
	public void setLista_servicios_ofrecidos(
			List<Servicio_ofrecido> lista_servicios_ofrecidos) {
		this.lista_servicios_ofrecidos = lista_servicios_ofrecidos;
	}
			
}