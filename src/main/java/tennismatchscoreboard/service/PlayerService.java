package tennismatchscoreboard.service;

import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import tennismatchscoreboard.entity.Player;
import tennismatchscoreboard.util.HibernateUtil;

public class PlayerService {
    private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public static Player findOrCreate(String playerName) {
        Session session = sessionFactory.openSession();
        String queryString = "FROM Player WHERE name = :playerName";
        Query queryObject = session.createQuery(queryString);
        queryObject.setParameter("playerName", playerName);

        Player player;
        try {
            player = (Player) queryObject.getSingleResult();
        } catch (NoResultException e) {
            player = new Player();
            player.setName(playerName);

            session.beginTransaction();
            session.persist(player);
            int id = player.getId();
            player.setId(id);

            session.getTransaction().commit();
        }
        session.close();
        return player;
    }
}
