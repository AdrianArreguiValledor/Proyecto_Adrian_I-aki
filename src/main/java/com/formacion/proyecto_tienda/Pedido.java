package com.formacion.proyecto_tienda;

import java.sql.Date;

public class Pedido {
	
	private int id;
	private int cantidad;
	private Date fecha_pedido;
	private Date fecha_entrega;
	private int id_producto;
	private int id_user;
	
	
	public Pedido() {
		super();
	}


	public Pedido(int cantidad, Date fecha_pedido, Date fecha_entrega, int id_producto, int id_user) {
		super();
		this.cantidad = cantidad;
		this.fecha_pedido = fecha_pedido;
		this.fecha_entrega = fecha_entrega;
		this.id_producto = id_producto;
		this.id_user = id_user;
	}

	
	
	

	public int getId_producto() {
		return id_producto;
	}


	
	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}


	public int getId_user() {
		return id_user;
	}


	public void setId_user(int id_user) {
		this.id_user = id_user;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getCantidad() {
		return cantidad;
	}


	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	public Date getFecha_pedido() {
		return fecha_pedido;
	}


	public void setFecha_pedido(Date fecha_pedido) {
		this.fecha_pedido = fecha_pedido;
	}


	public Date getFecha_entrega() {
		return fecha_entrega;
	}


	public void setFecha_entrega(Date fecha_entrega) {
		this.fecha_entrega = fecha_entrega;
	}
	

}
