package com.j2r2a.handshaker.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;


@Entity

@NamedQueries({
    @NamedQuery(name="ListaOfertaEnviadaUsuario",query="SELECT s FROM Oferta s JOIN s.negociacion neg WHERE s.usuarioEnvia = :UsuarioMetido AND neg.aceptada = false ORDER BY s.id_oferta_enviada DESC"),
    @NamedQuery(name="ListaOfertaRecibidaUsuario",query="SELECT s FROM Oferta s JOIN s.negociacion neg WHERE s.usuarioRecibe = :UsuarioMetido AND neg.aceptada = false ORDER BY s.id_oferta_enviada DESC"),
    @NamedQuery(name = "CuantasOfertasTengo",query = "SELECT COUNT(u) FROM Oferta u where u.usuarioRecibe = :UsuarioMetido"),
    @NamedQuery(name="OfertaPorIDnegociacion",query="SELECT o FROM Oferta o JOIN o.negociacion neg WHERE neg.id_negociacion = :IDNegociacion")
})
public class Oferta{
	
	private long id;		
	//private Date fecha;
	private Servicio servicioSolicitado;
	private Servicio serviciOfrecido;
	private Usuario usuarioEnvia;
	private Usuario usuarioRecibe;
	private Negociacion negociacion;
	
	public static Oferta crearOferta(Servicio servicioSolicitado,Servicio serviciOfrecido,Usuario usuarioEnvia, Usuario usuarioRecibe,Negociacion negociacion){
		
		Oferta o = new Oferta();
		o.servicioSolicitado=servicioSolicitado;
		o.serviciOfrecido=serviciOfrecido;
		o.usuarioEnvia=usuarioEnvia;
		o.usuarioRecibe=usuarioRecibe;
		o.negociacion=negociacion;
		
		return o;
	}
	
	
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
	public Servicio getServicio_solicitado() {
		return servicioSolicitado;
	}
	public void setServicio_solicitado(Servicio servicioRecibido) {
		this.servicioSolicitado = servicioRecibido;
	}
	
	
	@OneToOne(targetEntity=Servicio.class) //Una oferta enviada tiene un servicio ofrecido
	public Servicio getServicio_ofrecido() {
		return serviciOfrecido;
	}
	public void setServicio_ofrecido(Servicio serviciOfrecido) {
		this.serviciOfrecido = serviciOfrecido;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Una oferta enviada es de 1 usuario
	public Usuario getUsuarioEnvia() {
		return usuarioEnvia;
	}
	public void setUsuarioEnvia(Usuario usuario) {
		this.usuarioEnvia = usuario;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Una oferta enviada es de 1 usuario
	public Usuario getUsuarioRecibe() {
		return usuarioRecibe;
	}
	public void setUsuarioRecibe(Usuario usuario) {
		this.usuarioRecibe = usuario;
	}
	
	@OneToOne(targetEntity=Negociacion.class,fetch = FetchType.EAGER, cascade = CascadeType.ALL) //Una oferta enviada le corresponde 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}
			
}