package com.formacion.repository;

import com.formacion.entities.User;  // Asegúrate de que esta importación esté presente

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface User2Repository extends JpaRepository<User, Long> {

	Optional<User> findByfirstName(String string);
}
