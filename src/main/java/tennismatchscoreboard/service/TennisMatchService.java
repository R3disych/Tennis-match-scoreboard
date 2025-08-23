package tennismatchscoreboard.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import tennismatchscoreboard.entity.Player;
import tennismatchscoreboard.entity.TennisMatch;
import tennismatchscoreboard.util.HibernateUtil;

public class TennisMatchService {
    private static final SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public static TennisMatch createTennisMatch(Player player1, Player player2) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        TennisMatch tennisMatch = new TennisMatch();
        tennisMatch.setFirstPlayer(player1);
        tennisMatch.setSecondPlayer(player2);
        session.persist(tennisMatch);
        session.getTransaction().commit();
        int id = tennisMatch.getId();
        tennisMatch.setId(id);
        session.close();
        return tennisMatch;
    }

    public static TennisMatch getMatchById(int id) {
        Session session = sessionFactory.openSession();
        TennisMatch tennisMatch = session.find(TennisMatch.class, id);
        session.close();
        return tennisMatch;
    }
}
