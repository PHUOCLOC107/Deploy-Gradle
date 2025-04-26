package vn.edu.hcmuaf.fit.clock.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Log implements Serializable {
    private int id;
    private int userId;
    private String action;
    private String description;
    private Timestamp createdAt;

    public Log() {
    }

    public Log(int id, int userId, String action, String description, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.action = action;
        this.description = description;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
