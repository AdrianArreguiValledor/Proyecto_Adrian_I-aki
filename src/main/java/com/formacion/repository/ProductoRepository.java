package com.formacion.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.formacion.entities.Producto;


@Repository
public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    // Puedes agregar métodos personalizados si es necesario, como buscar por categoría o nombre

}