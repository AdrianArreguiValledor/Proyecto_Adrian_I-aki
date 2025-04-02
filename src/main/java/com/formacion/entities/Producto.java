package com.formacion.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "producto")
public class Producto {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_producto;
    private String nombre;
    private String descripcion;
    private Double precio;
    private Integer stock;   

    @Enumerated(EnumType.STRING) // Guarda el nombre del Enum en la BD
    private Categoria categoria; 

    public enum Categoria {
        portatil,
        ordenador,
        periferico
    }
}