package DAO.Impl;

import DAO.RouteDAO;
import logic.Bus;
import logic.Driver;
import logic.Route;
import java.sql.SQLException;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import javax.swing.*;
import org.hibernate.Session;
import org.hibernate.Query;

public class RouteDAOImpl implements RouteDAO{

    @Override
    public void addRoute(Route route) throws SQLException {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(route);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public void updateRoute(Long route_id, Route route) throws SQLException {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.update(route);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public Route getRouteById(Long route_id) throws SQLException {
        Session session = null;
        Route route = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            route = (Route) session.load(Route.class, route_id);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'findById'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return route;
    }

    @Override
    public Collection getAllRoutes() throws SQLException {
        Session session = null;
        List routes = new ArrayList<Route>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            routes = session.createCriteria(Route.class).list();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'getAll'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return routes;
    }

    @Override
    public void deleteRoute(Route route) throws SQLException {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.delete(route);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при удалении", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public Collection getRoutesByDriver(Driver driver) throws SQLException {
        Session session = null;
        List routes = new ArrayList<Route>();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Long driver_id = driver.getId();
            Query query = session.createQuery(
                    " select r "
                            + " from Route r INNER JOIN r.drivers driver"
                            + " where driver.id = :driverId "
            )
                    .setLong("driverId", driver_id);
            routes = (List<Route>) query.list();
            session.getTransaction().commit();

        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return routes;
    }

    @Override
    public Collection getRoutesByBus(Bus bus) throws SQLException {
        Session session = null;
        List routes = new ArrayList<Route>();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Long bus_id = bus.getId();
            Query query = session.createQuery("from Route where bus_id = :busId ").setLong("busId", bus_id);
            routes = (List<Route>) query.list();
            session.getTransaction().commit();

        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return routes;
    }
}
