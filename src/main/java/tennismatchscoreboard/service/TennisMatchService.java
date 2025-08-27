package tennismatchscoreboard.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import tennismatchscoreboard.entity.Player;
import tennismatchscoreboard.entity.TennisMatch;
import tennismatchscoreboard.util.HibernateUtil;

import java.util.List;

public class TennisMatchService {
    private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public static TennisMatch updateScore(int matchId, int playerNumber, String action) {
        TennisMatch tennisMatch = getMatchById(matchId);

        if (tennisMatch != null) {
            if (playerNumber == 1) {
                int newScore = action.equals("increment") ?
                        tennisMatch.getScoreFirstPlayer() + 1 :
                        Math.max(0, tennisMatch.getScoreSecondPlayer() - 1);
                tennisMatch.setScoreFirstPlayer(newScore);
            } else {
                int newScore = action.equals("increment") ?
                        tennisMatch.getScoreSecondPlayer() + 1 :
                        Math.max(0, tennisMatch.getScoreFirstPlayer() - 1);
                tennisMatch.setScoreSecondPlayer(newScore);
            }

            updateTennisMatch(tennisMatch);
        }
        return tennisMatch;
    }

    public static void finishMatch(int matchId) {
        TennisMatch tennisMatch = getMatchById(matchId);
        if (tennisMatch != null && tennisMatch.getMatch_status() == TennisMatch.MatchStatus.IN_PROGRESS) {
            tennisMatch.completeMatch();
            updateTennisMatch(tennisMatch);
        }
    }

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

    public static void updateTennisMatch(TennisMatch tennisMatch) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.merge(tennisMatch);
        session.getTransaction().commit();
        session.close();
    }

    public static List<TennisMatch> getCompletedTennisMatches() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<TennisMatch> completedMatches = session
                .createQuery("FROM TennisMatch WHERE match_status = 'COMPLETED'").list();
        session.getTransaction().commit();
        return completedMatches;
    }
}
