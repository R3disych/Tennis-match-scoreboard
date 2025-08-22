package tennismatchscoreboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(
        name = "CreateMatch",
        urlPatterns = {"/new-game"}
)
public class CreateMatchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/NewMatch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String player1Name = request.getParameter("player1");
        String player2Name = request.getParameter("player2");

        if (player1Name.equals(player2Name)) {
            request.setAttribute("message", "Player 1 and Player 2 names are the same.");
            request.getRequestDispatcher("/WEB-INF/views/NewMatch.jsp").forward(request, response);
            return;
        }
    }
}
