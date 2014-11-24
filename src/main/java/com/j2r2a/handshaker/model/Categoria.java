package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@NamedQueries({
	
    @NamedQuery(name="ExisteCategoria",query="select c from Categoria c where c.nombreCategoria = :CategoriaMetida"),
    @NamedQuery(name="ListaCategorias",query="select c from Categoria c")
})

@Entity
public class Categoria{
	
	private long id_categoria;
	private String nombreCategoria;
	//private Servicio servicio;
	
	public Categoria (){}
	
	public static Categoria createCategoria(String nombreCategoria){
		Categoria c= new Categoria();
		c.nombreCategoria= nombreCategoria;
		//c.servicio=servicio;
		
		return c;
	}
	
	@Id
	@GeneratedValue
	public long getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(long id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getNombreCategoria() {
		return nombreCategoria;
	}
	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}
	
	/*
	@OneToOne(targetEntity=Servicio.class) //Un usuario tiene n intereses de tipo Servicio
	@JoinColumn(name="id_servicio") 
	public Servicio getServicio() {
		return servicio;
	}
	public void setServicio(Servicio servicio) {
		this.servicio = servicio;
	}
	*/
	
}