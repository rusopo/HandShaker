package com.j2r2a.handshaker.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
@NamedQueries({
	@NamedQuery(name="DameListaNegociacion", query="SELECT DISTINCT n FROM Negociacion n "),
	@NamedQuery(name="ExisteNegociacionPorID",query="SELECT n FROM Negociacion n WHERE n.id_negociacion = :IdNegociacionMetido"),
	@NamedQuery(name="EliminarNegociacionPorID",query="DELETE FROM Negociacion n WHERE n.id_negociacion = :IdNegociacionMetido"),
	
	/*@NamedQuery(name="DameListaComentarios",
	query= "SELECT c FROM Comentario c JOIN c.negociacion cNeg WHERE cNeg.id_negociacion = :IdNegociacionMetido"),*/
	/*@NamedQuery(name = "ListaUsuariosServicio", 
	query = "SELECT u FROM Usuario u, IN(u.habilidades) AS s where s.id_servicio = :IdServicioMetido"),*/
   
})


public class Negociacion{
	
	private long id;	
	private Usuario usuario1;
	private Usuario usuario2;
	private List<Comentario> listaComentarios;
	private boolean aceptada;
	
	public static Negociacion crearNegociacion(Usuario usuario1,Usuario usuario2,boolean aceptada){
		
		Negociacion negociacion= new Negociacion();
		negociacion.usuario1=usuario1;
		negociacion.usuario2=usuario2;
		negociacion.listaComentarios=new ArrayList<Comentario>();
		negociacion.aceptada=aceptada;
		
		return negociacion;
	}
	
	@Id
    @GeneratedValue
	public long getId_negociacion() {
		return id;
	}
	public void setId_negociacion(long id) {
		this.id = id;
	}
		
	@OneToOne(targetEntity=Usuario.class) //Una negociacion es de un usuario
	public Usuario getUsuario1() {
		return usuario1;
	}
	public void setUsuario1(Usuario usuario1) {
		this.usuario1 = usuario1;
	}
	
	@OneToOne(targetEntity=Usuario.class) //Una negociacion es de otro usuario
	public Usuario getUsuario2() {
		return usuario2;
	}
	public void setUsuario2(Usuario usuario2) {
		this.usuario2 = usuario2;
	}
	
	@OneToMany(mappedBy="negociacion", fetch = FetchType.EAGER, cascade = CascadeType.ALL) //Una negociacion tiene n comentarios tipo Comentario
	public List<Comentario> getLista_comentarios() {
		return listaComentarios;
	}
	public void setLista_comentarios(List<Comentario> lista_comentarios) {
		this.listaComentarios = lista_comentarios;
	}
	
	public boolean getAceptada() {
		return aceptada;
	}
	public void setAceptada(boolean aceptada) {
		this.aceptada = aceptada;
	}
		
}