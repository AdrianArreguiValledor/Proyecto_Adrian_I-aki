package com.formacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.formacion.entities.Producto;
import com.formacion.repository.ProductoRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProductoService {

    private final ProductoRepository productoRepository;

    @Autowired
    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    
    public Producto obtenerProductoPorId(Integer id_producto) {
        return productoRepository.findById(id_producto).orElse(null);
    }

    public void saveProducto(Producto producto) {
        productoRepository.save(producto);
    }
    
    
    public List<Producto> obtenerTodosLosProductos() {
        return productoRepository.findAll();
    }
    

    // Método para eliminar un producto por ID
    public void eliminarProducto(Integer id_producto) {
        productoRepository.deleteById(id_producto);
    }
    
    
    public void actualizarProducto(Producto producto) {
        productoRepository.save(producto); // Guardar el producto actualizado en la base de datos
    }


    // Puedes agregar otros métodos como obtener por id o filtrar productos
}
