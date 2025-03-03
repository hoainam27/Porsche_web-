package com.example.porschebackend;

import entity.Car;
import dao.MyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


@WebServlet("/searchCar")
public class CarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carName = request.getParameter("name");
        ArrayList<Car> carList = searchCarByName(carName);

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(carList.toString());
    }

    private ArrayList<Car> searchCarByName(String name) {
        ArrayList<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car WHERE name LIKE ?";

        try (PreparedStatement ps = new MyDAO().con.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
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
}
