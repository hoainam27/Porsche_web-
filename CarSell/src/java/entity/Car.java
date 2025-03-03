/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author nam
 */
public class Car {
    
    private String name;
    private int id, quantity;
    private double price, max_speed, acceleration;

    public Car() {
    }

    public Car(String name, int id, int quantity, double price, double max_speed, double acceleration) {
        this.name = name;
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.max_speed = max_speed;
        this.acceleration = acceleration;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getMax_speed() {
        return max_speed;
    }

    public void setMax_speed(double max_speed) {
        this.max_speed = max_speed;
    }

    public double getAcceleration() {
        return acceleration;
    }

    public void setAcceleration(double acceleration) {
        this.acceleration = acceleration;
    }

    @Override
    public String toString() {
        return "Car{" + "name=" + name + ", id=" + id + ", quantity=" + quantity + ", price=" + price + ", max_speed=" + max_speed + ", acceleration=" + acceleration + '}';
    }
}
