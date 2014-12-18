package com.j2r2a.handshaker.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity

@NamedQueries({
    @NamedQuery(name="ListaOfertaEnviadaUsuario",query="SELECT s FROM OfertaEnviada s WHERE s.usuario = :UsuarioMetido" ),
    
})
public class OfertaEnviada{
	
	private long id;		
	//private Date fecha;
	private Servicio servicioRecibido;
	private Usuario usuario;
	private Negociacion negociacion;
	private List<ServicioOfrecido> listaServiciosOfrecidos;
	
	
	@Id
    @GeneratedValue
	public long getId_oferta_enviada() {
		return id;
	}
	public void setId_oferta_enviada(long id) {
		this.id = id;
	}
	/*
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}*/
	
	@OneToOne(targetEntity=Servicio.class) //Una oferta enviada tiene un servicio recibido
	public Servicio getServicio_recibido() {
		return servicioRecibido;
	}
	public void setServicio_recibido(Servicio servicioRecibido) {
		this.servicioRecibido = servicioRecibido;
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
	
	@OneToMany(targetEntity=ServicioOfrecido.class) //Una oferta enviada puede tener 0,1 o mas servicios ofrecidos
	@JoinColumn(name="idOfertaEnviada")
	public List<ServicioOfrecido> getLista_servicios_ofrecidos() {
		return listaServiciosOfrecidos;
	}
	public void setLista_servicios_ofrecidos(
			List<ServicioOfrecido> lista_servicios_ofrecidos) {
		this.listaServiciosOfrecidos = lista_servicios_ofrecidos;
	}
			
}