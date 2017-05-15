package logic;

/**
 * Created by dima2 on 5/15/2017.
 */

import java.util.Set;
import java.util.HashSet;

public class Bus {
    private Long id;
    private String number;
    private Set drivers = new HashSet();
    private Long route_id;

    public Bus() {
    }
    public void setId(Long id) {
        this.id = id;
    }
    public void setNumber(String number) {
        this.number = number;
    }
    public void setDrivers(Set drivers) {
        this.drivers = drivers;
    }
    public void setRoute_id(Long route_id) {
        this.route_id = route_id;
    }
    public Long getId() {
        return id;
    }
    public String getNumber() {
        return number;
    }
    public Set getDrivers() {
        return drivers;
    }
    public Long getRoute_id() {
        return route_id;
    }
}
