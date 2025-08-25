package tennismatchscoreboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tennismatchscoreboard.entity.TennisMatch;
import tennismatchscoreboard.service.TennisMatchService;

import java.io.IOException;

@WebServlet("/match-score")
public class MatchScoreController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matchId = request.getParameter("matchId");

        TennisMatch match = TennisMatchService.getMatchById(Integer.parseInt(matchId));

        if (match == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Match not found");
            return;
        }

        request.setAttribute("match", match);
        request.getRequestDispatcher("/WEB-INF/views/MatchScore.jsp").forward(request, response);
    }
}
