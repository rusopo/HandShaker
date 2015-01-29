package com.j2r2a.handshaker.model;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity

@NamedQueries({
	
	@NamedQuery(name="ListarTodo",query="SELECT DISTINCT s FROM Servicio s"),
    @NamedQuery(name="BusquedaPorCategoria",query="SELECT s FROM Servicio s JOIN s.categoria sCat WHERE sCat.id= :CategoriaMetida"),
	@NamedQuery(name="ExisteServicioPorNombre",query="SELECT s FROM Servicio s WHERE s.id = :IdServicioMetido"),
	@NamedQuery(name = "CuantosOfertan",query = "SELECT COUNT(u) FROM Usuario u, IN(u.habilidades) AS s where s.id = :IdServicioMetido"),
	@NamedQuery(name = "ListaUsuariosServicio",query = "SELECT u FROM Usuario u, IN(u.habilidades) AS s where s.id = :IdServicioMetido AND u.id <> :idUsuarioMetido AND u.id <> 1"),
	@NamedQuery(name="BusquedaServicioPorTextoYCategoria",query="SELECT s FROM Servicio s JOIN s.categoria sCat WHERE LOWER(s.nombre) LIKE :textoMetido AND sCat.id= :categoriaMetida"),
	@NamedQuery(name="BusquedaServicioPorSoloTexto",query="SELECT s FROM Servicio s WHERE LOWER(s.nombre) LIKE :textoMetido"),
	@NamedQuery(name="BorrarServicio",query="DELETE FROM Servicio s WHERE s.id = :IDServicio")
})

public class Servicio{
		
	private long id;	
	private String nombre;
	private Categoria categoria;
	private String descripcion;	
	private List<Usuario> usuarios1; //Para habilidades
	private List<Usuario> usuarios2; //Para intereses	
	private long contadorUsuarios;
	
	public Servicio(){}
	
	public static Servicio crearServicio(String nombre,Categoria categoria,String descripcion,long contadorUsuarios){
		
		Servicio serv= new Servicio();
		serv.nombre=nombre;
		serv.setCategoria(categoria);
		serv.descripcion=descripcion;
		serv.contadorUsuarios=contadorUsuarios;
		
		return serv;
	}
	
	@Id
    @GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	
	
	@ManyToMany(targetEntity=Usuario.class, mappedBy="habilidades")
	public List<Usuario> getUsuarios1() {
		return usuarios1;
	}

	public void setUsuarios1(List<Usuario> usuarios) {
		this.usuarios1 = usuarios;
	}
	
	
	@ManyToMany(targetEntity=Usuario.class, mappedBy="intereses")
	public List<Usuario> getUsuarios2() {
		return usuarios2;
	}

	public void setUsuarios2(List<Usuario> usuarios) {
		this.usuarios2 = usuarios;
	}
	
	
	@OneToOne(targetEntity=Categoria.class)
	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public long getContadorUsuarios() {
		return contadorUsuarios;
	}

	public void setContadorUsuarios(long contadorUsuarios) {
		this.contadorUsuarios = contadorUsuarios;
	}
	
	
}