package DAO;

import logic.Bus;
import logic.Driver;
import logic.Route;

import java.util.Collection;
import java.sql.SQLException;

/**
 * Created by Alexey_O on 15.05.2017.
 */
public interface DriverDAO {
    public void addDriver(Driver driver) throws SQLException;
    public void updateDriver(Long driver_id, Driver driver) throws SQLException;
    public Driver getDriverById(Long driver_id) throws SQLException;
    public Collection getAllDrivers() throws SQLException;
    public void deleteDriver(Driver driver) throws SQLException;
    public Collection getDriversByBus(Bus bus) throws SQLException;
    public Collection getDriversByRoute(Route route) throws SQLException;
}
