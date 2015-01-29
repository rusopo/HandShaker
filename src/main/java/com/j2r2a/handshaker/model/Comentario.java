package com.j2r2a.handshaker.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;


@Entity
@NamedQueries({
	@NamedQuery(name="DameListaComentariosPorIDNegociacion",query= "SELECT c FROM Comentario c JOIN c.negociacion cNeg WHERE cNeg.id = :IdNegociacionMetido")
    
})
public class Comentario{
	

	private long id;	
	private Usuario usuario;
	private String textoComentario;
	private Date fechaComentario;
	private Negociacion negociacion;
	
	public static Comentario crearComentario(Usuario usuario,String textoComentario,Negociacion idNegociacion,Date fecha){
		
		Comentario c = new Comentario();
		c.usuario=usuario;
		c.textoComentario=textoComentario;
		c.fechaComentario = fecha;
		c.negociacion=idNegociacion;
			
		return c;
	}
	
	@Id
    @GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un comentario es de 1 usuario
	public Usuario getUsuarioComenta() {
		return usuario;
	}
	public void setUsuarioComenta(Usuario Usuario) {
		this.usuario = Usuario;
	}
	
	public String getTextoComentario() {
		return textoComentario;
	}
	public void setTextoComentario(String texto_comentario) {
		this.textoComentario = texto_comentario;
	}
	
	@ManyToOne(targetEntity=Negociacion.class) //Un comentario es de 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}

	public Date getFechaComentario() {
		return fechaComentario;
	}

	public void setFechaComentario(Date fechaComentario) {
		this.fechaComentario = fechaComentario;
	}
	
			
}