package com.formacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.formacion.entities.Producto;
import com.formacion.repository.ProductoRepository;

import java.util.List;
import java.util.Optional;

@Service  // Indica que esta clase es un servicio de Spring, es decir, contiene la lógica de negocio.
public class ProductoService {

    // Inyección de la dependencia ProductoRepository, que es la interfaz que maneja las operaciones CRUD con la base de datos
    private final ProductoRepository productoRepository;

    // Constructor con @Autowired para inyectar el ProductoRepository
    @Autowired
    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;  // Se asigna la referencia del repositorio a la propiedad
    }

    // Método para obtener un producto por su ID. Si el producto no existe, devuelve null.
    public Producto obtenerProductoPorId(Integer id_producto) {
        return productoRepository.findById(id_producto).orElse(null);  // Busca el producto en la base de datos por ID
    }

    // Método para guardar un producto en la base de datos (se puede usar tanto para insertar como para actualizar productos)
    public void saveProducto(Producto producto) {
        productoRepository.save(producto);  // Guarda el producto en la base de datos
    }
    
    // Método para obtener todos los productos almacenados en la base de datos.
    public List<Producto> obtenerTodosLosProductos() {
        return productoRepository.findAll();  // Obtiene todos los productos del repositorio
    }

    // Método para eliminar un producto de la base de datos por su ID.
    public void eliminarProducto(Integer id_producto) {
        productoRepository.deleteById(id_producto);  // Elimina el producto con el ID proporcionado
    }
    
    // Método para actualizar un producto en la base de datos (realiza la misma acción que saveProducto ya que lo actualiza si existe).
    public void actualizarProducto(Producto producto) {
        productoRepository.save(producto);  // Guarda o actualiza el producto en la base de datos
    }

}
