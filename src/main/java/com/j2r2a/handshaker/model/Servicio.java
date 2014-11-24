package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity

@NamedQueries({
	
	@NamedQuery(name="ListarTodo",query="SELECT DISTINCT s FROM Servicio s"),
    @NamedQuery(name="BusquedaPorCategoria",query="SELECT DISTINCT s FROM Servicio s JOIN s.categoria sCat WHERE sCat.id_categoria= :CategoriaMetida")
   
})

public class Servicio{
	
	
	private long id_servicio;	
	private String nombre;

	private Categoria categoria;
	private String descripcion;
	
	private Usuario usuario;
	
	public Servicio(){}
	
	public static Servicio crearServicio(String nombre,Categoria categoria,String descripcion,Usuario usuario){
		
		Servicio serv= new Servicio();
		serv.nombre=nombre;
		serv.setCategoria(categoria);
		serv.descripcion=descripcion;
		serv.usuario=usuario;
		
		return serv;
	}
	
	@Id
    @GeneratedValue
	public long getId_servicio() {
		return id_servicio;
	}
	public void setId_servicio(long id_servicio) {
		this.id_servicio = id_servicio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
		

	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	@OneToOne(targetEntity=Categoria.class)
	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	
}