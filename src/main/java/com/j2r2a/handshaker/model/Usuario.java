package com.j2r2a.handshaker.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@Entity

@NamedQueries({
	@NamedQuery(name="delUser", query="delete from Usuario u where u.id= :idParam"),
    @NamedQuery(name="ExisteUsuarioLogin",query="select u from Usuario u where u.alias = :UsuarioMetido"),
    @NamedQuery(name="ListaUsuarios",query="SELECT DISTINCT c FROM Usuario c"),
    @NamedQuery(name="ExisteUsuarioPorID",query="SELECT u FROM Usuario u WHERE u.id = :IDMetido")
})

public class Usuario{
	

	private long id;
	private String alias;
	private String nombre;
	private long edad;
	private String email;
	private String contrasenia;
	private String salt;
	//private String foto;
	private double latitud;
	private double longitud;
	private ArrayList<Integer> valoracion;
	private List<Servicio> habilidades;
	private List<Servicio> intereses;
	
	public Usuario(){}
	
	public static Usuario crearUsuario(String alias, String nombre,long edad,String email,String contrasenia,double latitud,double longitud) {
		
		Usuario u = new Usuario();
		u.alias = alias;
		u.nombre=nombre;
		u.edad=edad;
		u.email=email;
	
		Random r = new Random();		
		// generate new, random salt; build hashedAndSalted
		byte[] saltBytes = new byte[16];
		r.nextBytes(saltBytes);
		u.salt = byteArrayToHexString(saltBytes);
		u.contrasenia = generateHashedAndSalted(contrasenia,u.salt);
		
		//u.foto=foto;		
		u.latitud=latitud;
		u.longitud=longitud;
		
		u.valoracion=new ArrayList<Integer>();
		u.habilidades= new ArrayList<Servicio>();
		u.intereses=new ArrayList<Servicio>();
		
		
		return u;
	}
	
	public boolean isPassValid(String pass) {
		
		return generateHashedAndSalted(pass, this.salt).equals(this.contrasenia);		
	}
	
	@Id
    @GeneratedValue
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}

	@Column(unique=true)
	public String getAlias() {
		return alias;
	}


	public void setAlias(String alias) {
		this.alias = alias;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public long getEdad() {
		return edad;
	}


	public void setEdad(long edad) {
		this.edad = edad;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContrasenia() {
		return contrasenia;
	}


	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
		
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public double getLatitud() {
		return latitud;
	}


	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}


	public double getLongitud() {
		return longitud;
	}


	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}


	public ArrayList<Integer> getValoracion() {
		return valoracion;
	}


	public void setValoracion(ArrayList<Integer> valoracion) {
		this.valoracion = valoracion;
	}

	@ManyToMany(targetEntity=Servicio.class)//Un usuario tiene n habilidades de tipo Servicio
	@JoinTable(name="habilidadesUsuario",joinColumns = {@JoinColumn(name = "IDUsuario")}, inverseJoinColumns = {@JoinColumn(name = "IDServicio")})
	public List<Servicio> getHabilidades() {
		return habilidades;
	}


	public void setHabilidades(List<Servicio> habilidades) {
		this.habilidades = habilidades;
	}

	@ManyToMany(targetEntity=Servicio.class) //Un usuario tiene n intereses de tipo Servicio
	@JoinTable(name="interesesUsuario",joinColumns = {@JoinColumn(name = "IDUsuario")}, inverseJoinColumns = {@JoinColumn(name = "IDServicio")}) 
	public List<Servicio> getIntereses() {
		return intereses;
	}
	
	public void annadirInteres(Servicio s){
		//Iterator it = this.intereses.iterator();
		boolean esta=false;
		for(Servicio serv : this.intereses){
			if(serv.getNombre().toUpperCase() == s.getNombre().toUpperCase()){
				esta=true;
			}
		}
		if(!esta){
			this.intereses.add(s);
		}
	}
	/*public void eliminaInteres(Servicio s){
		
		this.intereses.remove(s);
	}*/

	public void setIntereses(List<Servicio> intereses) {
		this.intereses = intereses;
	}
		
	public void printUsuario(){
		
		System.out.println("id: " + this.id + " alias: " + this.alias + " nombre: " + this.nombre + " Email: " + this.email + " edad: " + this.edad 
				+" contrasenia: " + this.contrasenia + " salt: " + this.salt + " Latitud: " + this.latitud + " Longitud: " + this.longitud);
	}
	
	
	/**
	 * Generate a hashed&salted hex-string from a user's pass and salt
	 * @param pass to use; no length-limit!
	 * @param salt to use
	 * @return a string to store in the BD that does not reveal the password even
	 * if the DB is compromised. Note that brute-force is possible, but it will
	 * have to be targeted (ie.: use the same salt)
	 */
	public static String generateHashedAndSalted(String pass, String salt) {
		byte[] saltBytes = hexStringToByteArray(salt);
		byte[] passBytes = pass.getBytes();
		byte[] toHash = new byte[saltBytes.length + passBytes.length];
		System.arraycopy(passBytes, 0, toHash, 0, passBytes.length);
		System.arraycopy(saltBytes, 0, toHash, passBytes.length, saltBytes.length);
		return byteArrayToHexString(hash(toHash));
	}	

	/**
	 * Converts a byte array to a hex string
	 * @param b converts a byte array to a hex string; nice for storing
	 * @return the corresponding hex string
	 */
	public static String byteArrayToHexString(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (int i=0; i<b.length; i++) {
			sb.append(Integer.toString((b[i]&0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
	
	/**
	 * Converts a hex string to a byte array
	 * @param hex string to convert
	 * @return equivalent byte array
	 */
	public static byte[] hexStringToByteArray(String hex) {
		byte[] r = new byte[hex.length()/2];
		for (int i=0; i<r.length; i++) {
			String h = hex.substring(i*2, (i+1)*2);
			r[i] = (byte)Integer.parseInt(h, 16);
		}
		return r;
	}
	
	/**
	 * Returns the SHA-1 of a byte array
	 * @return
	 */
	public static byte[] hash(byte[] bytes) {
		MessageDigest md = null;
	    try {
	        md = MessageDigest.getInstance("SHA-1");
	    } catch(NoSuchAlgorithmException e) {
	        e.printStackTrace();
	    } 
	    return md.digest(bytes);
	}
	
	
}