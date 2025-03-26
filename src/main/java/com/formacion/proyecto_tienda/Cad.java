package com.formacion.proyecto_tienda;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

public class Cad {
	
	private Connection conn;
	
	public Cad() throws SQLException {
		
	String user = "avnadmin";
	String password = "AVNS_l6DfylfOtVlqCJnsEqJ";
	String url = "jdbc:mysql://avnadmin:AVNS_l6DfylfOtVlqCJnsEqJ@mysql-3bf733d-sm-aeff.k.aivencloud.com:23957/Tienda?ssl-mode=REQUIRED";
	
	conn = DriverManager.getConnection(url, user, password);
	
	}
	
	
	public void crearPedido(Pedido pedido) throws SQLException {
		//Query SQL.
		String sql = "INSERT INTO Pedido (cantidad, fecha_pedido, fecha_entrega, id_user, id_producto) VALUES (?, ?, ?, ?, ?)";
	    LocalDate fechaPedido = (pedido.getFecha_pedido() != null) ? pedido.getFecha_pedido().toLocalDate() : LocalDate.now();
	    LocalDate fechaEntrega = (pedido.getFecha_entrega() != null) ? pedido.getFecha_entrega().toLocalDate() : fechaPedido.plusDays(3); // Ejemplo: 3 días después

		try(PreparedStatement ps = conn.prepareStatement(sql)){
			//Asignamos el nombre a cada elemento
			ps.setInt(1, pedido.getCantidad());
	        ps.setDate(2, Date.valueOf(fechaPedido));
	        ps.setDate(3, Date.valueOf(fechaEntrega));
	        ps.setInt(4, pedido.getId_user());
			ps.setInt(5, pedido.getId_producto());
	
			//Ejecutamos la consulta de insercion
			ps.executeUpdate();
		}
	}
}
