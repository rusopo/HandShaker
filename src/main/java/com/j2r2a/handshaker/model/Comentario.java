package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;


@Entity
@NamedQueries({
	//@NamedQuery(name="DameListaComentarios", query="SELECT c FROM Comentario c, WHERE c.id_negociacion = : IdNegociacionMetido "),
	//SELECT s FROM Servicio s WHERE s.id_servicio = :IdServicioMetido
    
})
public class Comentario{
	

	private long id;	
	private Usuario usuario;
	private String textoComentario;
	private Negociacion negociacion;
	
	@Id
    @GeneratedValue
	public long getId_comentario() {
		return id;
	}
	public void setId_comentario(long id) {
		this.id = id;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Un comentario es de 1 usuario
	public Usuario getId_usuario() {
		return usuario;
	}
	public void setId_usuario(Usuario idUsuario) {
		this.usuario = idUsuario;
	}
	
	public String getTexto_comentario() {
		return textoComentario;
	}
	public void setTexto_comentario(String texto_comentario) {
		this.textoComentario = texto_comentario;
	}
	
	@OneToOne(targetEntity=Negociacion.class) //Un comentario es de 1 negociacion
	public Negociacion getNegociacion() {
		return negociacion;
	}
	public void setNegociacion(Negociacion negociacion) {
		this.negociacion = negociacion;
	}

	
			
}