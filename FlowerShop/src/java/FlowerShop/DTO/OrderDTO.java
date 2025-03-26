/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FlowerShop.DTO;

/**
 *
 * @author tho02
 */
import java.sql.Timestamp;

public class OrderDTO {
    private int orderId;
    private int userId;
    private double totalPrice;
    private String orderStatus;
    private String phone;
    private String address;
    private Timestamp createdAt;

    public OrderDTO() {}

    public OrderDTO(int orderId, int userId, double totalPrice, String orderStatus, String phone, String address, Timestamp createdAt) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
        this.phone = phone;
        this.address = address;
        this.createdAt = createdAt;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }


}

