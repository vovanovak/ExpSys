package DAO;

/**
 * Created by dima2 on 5/15/2017.
 */


import logic.Bus;
import logic.Driver;
import logic.Route;

import java.util.Collection;
import java.sql.SQLException;

public interface RouteDAO {
    public void addRoute(Route route) throws SQLException;
    public void updateRoute(Long route_id, Route route) throws SQLException;
    public Route getRouteById(Long route_id) throws SQLException;
    public Collection getAllRoutes() throws SQLException;
    public void deleteRoute(Route route) throws SQLException;
    public Collection getRoutesByDriver(Driver driver) throws SQLException;
    public Collection getRoutesByBus(Bus bus) throws SQLException;
}
