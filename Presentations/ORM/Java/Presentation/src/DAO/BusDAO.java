package DAO;

import logic.Bus;
import logic.Driver;
import logic.Route;

import java.util.Collection;
import java.sql.SQLException;

public interface BusDAO {
    public void addBus(Bus bus) throws SQLException;
    public void updateBus(Long bus_id, Bus bus) throws SQLException;
    public Bus getBusById(Long bus_id) throws SQLException;
    public Collection getAllBusses() throws SQLException;
    public void deleteBus(Bus bus) throws SQLException;
    public Collection getBussesByDriver(Driver driver) throws SQLException;
    public Collection getBussesByRoute(Route route) throws SQLException;

}
