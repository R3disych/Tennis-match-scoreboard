package tennismatchscoreboard.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tennis_match")
public class TennisMatch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "first_player_id")
    private Player firstPlayer;

    @ManyToOne
    @JoinColumn(name = "second_player_id")
    private Player secondPlayer;

    @Column(name = "score_first_player")
    private int scoreFirstPlayer;

    @Column(name = "score_second_player")
    private int scoreSecondPlayer;

    @Enumerated(EnumType.STRING)
    private MatchStatus match_status = MatchStatus.IN_PROGRESS;

    public enum MatchStatus {
        IN_PROGRESS, COMPLETED, CANCELLED
    }

    public TennisMatch() {

    }

    public TennisMatch(int id, Player firstPlayer, Player secondPlayer, int scoreFirstPlayer, int scoreSecondPlayer) {
        this.id = id;
        this.firstPlayer = firstPlayer;
        this.secondPlayer = secondPlayer;
        this.scoreFirstPlayer = scoreFirstPlayer;
        this.scoreSecondPlayer = scoreSecondPlayer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Player getFirstPlayer() {
        return firstPlayer;
    }

    public void setFirstPlayer(Player firstPlayer) {
        this.firstPlayer = firstPlayer;
    }

    public Player getSecondPlayer() {
        return secondPlayer;
    }

    public void setSecondPlayer(Player secondPlayer) {
        this.secondPlayer = secondPlayer;
    }

    public int getScoreFirstPlayer() {
        return scoreFirstPlayer;
    }

    public void setScoreFirstPlayer(int scoreFirstPlayer) {
        this.scoreFirstPlayer = scoreFirstPlayer;
    }

    public int getScoreSecondPlayer() {
        return scoreSecondPlayer;
    }

    public void setScoreSecondPlayer(int scoreSecondPlayer) {
        this.scoreSecondPlayer = scoreSecondPlayer;
    }

    public MatchStatus getMatch_status() {
        return match_status;
    }

    public void completeMatch() {
        match_status = MatchStatus.COMPLETED;
    }
}
