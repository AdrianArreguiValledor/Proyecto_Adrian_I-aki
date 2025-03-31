package com.formacion.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "Usuario")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_user;
    private String nombre; // Email o nombre de usuario
    private String email; // Contraseña
    private String contrasena;     // Rol del usuario
    private String apellido; //apellido
    private String rol;     // Rol del usuario


}
