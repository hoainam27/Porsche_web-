/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Car;
import java.util.ArrayList;

/**
 *
 * @author nam
 */
public class CarDAO extends MyDAO {

    // Lấy danh sách tát cả xe
    public ArrayList<Car> getAllCars() {
        ArrayList<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cars.add(new Car(
                        rs.getString("name"),
                        rs.getInt("id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getDouble("max_speed"),
                        rs.getDouble("acceleration")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cars;
    }

    // Tìm kiếm xe theo tên
    public ArrayList<Car> searchCarByName(String name) {
        ArrayList<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car WHERE name LIKE ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                cars.add(new Car(
                        rs.getString("name"),
                        rs.getInt("id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getDouble("max_speed"),
                        rs.getDouble("acceleration")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cars;
    }

    // Thêm xe mới
    public void addCar(Car car) {
        String sql = "INSERT INTO Car (name, quantity, price, max_speed, acceleration) VALUES (?, ?, ?, ?, ?)";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, car.getName());
            ps.setInt(2, car.getQuantity());
            ps.setDouble(3, car.getPrice());
            ps.setDouble(4, car.getMax_speed());
            ps.setDouble(5, car.getAcceleration());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa xe theo ID
    public void deleteCar(int id) {
        String sql = "DELETE FROM Car WHERE id = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin xe
    public void updateCar(Car car) {
        String sql = "UPDATE Car SET name = ?, quantity = ?, price = ?, max_speed = ?, acceleration = ? WHERE id = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, car.getName());
            ps.setInt(2, car.getQuantity());
            ps.setDouble(3, car.getPrice());
            ps.setDouble(4, car.getMax_speed());
            ps.setDouble(5, car.getAcceleration());
            ps.setInt(6, car.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
