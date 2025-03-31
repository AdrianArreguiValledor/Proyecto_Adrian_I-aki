package com.formacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.formacion.entities.Usuario;
import com.formacion.repository.UserRepository;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Usuario findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // Guardar un usuario
    public void saveUser(Usuario user) {
        System.out.println("Guardando usuario: " + user.getEmail());  // Esto es solo un ejemplo de logging
        userRepository.save(user);  // Guardamos el usuario en la base de datos
        System.out.println("Usuario guardado con éxito: " + user.getEmail());
    }

    // Obtener todos los usuarios
    public List<Usuario> findAllUsers() {
        return userRepository.findAll();
    }
}
