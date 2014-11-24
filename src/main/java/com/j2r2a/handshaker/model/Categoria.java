package com.j2r2a.handshaker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@NamedQueries({
	
    @NamedQuery(name="ExisteCategoria",query="SELECT c FROM Categoria c where c.nombreCategoria = :CategoriaMetida"),
    @NamedQuery(name="ListaCategorias",query="SELECT DISTINCT c FROM Categoria c")
})

@Entity
public class Categoria{
	
	private long id_categoria;
	private String nombreCategoria;
	
	public Categoria (){}
	
	public static Categoria createCategoria(String nombreCategoria){
		
		Categoria c= new Categoria();
		c.nombreCategoria= nombreCategoria;
		
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
		
	
}