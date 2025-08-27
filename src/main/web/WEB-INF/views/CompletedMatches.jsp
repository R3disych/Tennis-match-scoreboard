<%--
  Created by IntelliJ IDEA.
  User: Unfortunately_Redis
  Date: 27.08.2025
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Завершенные матчи</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      margin: 0;
      padding: 20px;
      min-height: 100vh;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
      color: #333;
    }

    .header h1 {
      margin: 0;
      font-size: 2.5em;
      color: #2c3e50;
    }

    .stats {
      background: #f8f9fa;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 30px;
      display: flex;
      justify-content: space-around;
      align-items: center;
    }

    .stat-item {
      text-align: center;
    }

    .stat-number {
      font-size: 2em;
      font-weight: bold;
      color: #667eea;
    }

    .stat-label {
      color: #6c757d;
      font-size: 0.9em;
    }

    .matches-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .matches-table th,
    .matches-table td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid #e9ecef;
    }

    .matches-table th {
      background: #667eea;
      color: white;
      font-weight: bold;
    }

    .matches-table tr:nth-child(even) {
      background: #f8f9fa;
    }

    .matches-table tr:hover {
      background: #e3f2fd;
      transition: background 0.3s ease;
    }

    .player-name {
      font-weight: bold;
      color: #2c3e50;
    }

    .score {
      font-size: 1.2em;
      font-weight: bold;
      color: #28a745;
    }

    .winner {
      background: #d4edda !important;
    }

    .winner .player-name {
      color: #155724;
    }

    .action-buttons {
      text-align: center;
      margin-top: 30px;
      padding-top: 20px;
      border-top: 2px solid #e9ecef;
    }

    .btn {
      display: inline-block;
      padding: 12px 25px;
      background: #667eea;
      color: white;
      text-decoration: none;
      border-radius: 25px;
      margin: 0 10px;
      transition: all 0.3s ease;
      border: none;
      cursor: pointer;
      font-size: 16px;
    }

    .btn:hover {
      background: #5a67d8;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .btn-home {
      background: #6c757d;
    }

    .btn-home:hover {
      background: #5a6268;
    }

    .empty-state {
      text-align: center;
      padding: 50px;
      color: #6c757d;
    }

    .empty-state i {
      font-size: 4em;
      margin-bottom: 20px;
      color: #dee2e6;
    }

    @media (max-width: 768px) {
      .matches-table {
        font-size: 0.9em;
      }

      .matches-table th,
      .matches-table td {
        padding: 10px;
      }

      .stats {
        flex-direction: column;
        gap: 15px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>🏆 Завершенные матчи</h1>
    <p>История всех сыгранных теннисных матчей</p>
  </div>

  <div class="stats">
    <div class="stat-item">
      <div class="stat-number">${completedMatches.size()}</div>
      <div class="stat-label">Всего матчей</div>
    </div>
    <div class="stat-item">
      <div class="stat-number">
        <c:set var="totalPoints" value="0" />
        <c:forEach items="${completedMatches}" var="match">
          <c:set var="totalPoints" value="${totalPoints + match.scoreFirstPlayer + match.scoreSecondPlayer}" />
        </c:forEach>
        ${totalPoints}
      </div>
      <div class="stat-label">Всего очков</div>
    </div>
    <div class="stat-item">
      <div class="stat-number">
        <c:set var="uniquePlayers" value="${[]}" />
        <c:forEach items="${completedMatches}" var="match">
          <c:if test="${!uniquePlayers.contains(match.firstPlayer.name)}">
            <c:set var="uniquePlayers" value="${uniquePlayers.add(match.firstPlayer.name)}" />
          </c:if>
          <c:if test="${!uniquePlayers.contains(match.secondPlayer.name)}">
            <c:set var="uniquePlayers" value="${uniquePlayers.add(match.secondPlayer.name)}" />
          </c:if>
        </c:forEach>
        ${uniquePlayers.size()}
      </div>
      <div class="stat-label">Уникальных игроков</div>
    </div>
  </div>

  <c:choose>
    <c:when test="${not empty completedMatches}">
      <table class="matches-table">
        <thead>
        <tr>
          <th>ID</th>
          <th>Игрок 1</th>
          <th>Игрок 2</th>
          <th>Счет</th>
          <th>Победитель</th>
          <th>Дата завершения</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${completedMatches}" var="match">
          <c:set var="isPlayer1Winner" value="${match.scoreFirstPlayer > match.scoreSecondPlayer}" />
          <c:set var="isPlayer2Winner" value="${match.scoreSecondPlayer > match.scoreFirstPlayer}" />
          <c:set var="isDraw" value="${match.scoreFirstPlayer == match.scoreSecondPlayer}" />

          <tr class="${isPlayer1Winner || isPlayer2Winner ? 'winner' : ''}">
            <td>#${match.id}</td>
            <td class="player-name ${isPlayer1Winner ? 'winner' : ''}">
                ${match.firstPlayer.name}
              <c:if test="${isPlayer1Winner}"> 👑</c:if>
            </td>
            <td class="player-name ${isPlayer2Winner ? 'winner' : ''}">
                ${match.secondPlayer.name}
              <c:if test="${isPlayer2Winner}"> 👑</c:if>
            </td>
            <td class="score">
                ${match.scoreFirstPlayer} - ${match.scoreSecondPlayer}
              <c:if test="${isDraw}"> (ничья)</c:if>
            </td>
            <td>
              <c:choose>
                <c:when test="${isPlayer1Winner}">${match.firstPlayer.name}</c:when>
                <c:when test="${isPlayer2Winner}">${match.secondPlayer.name}</c:when>
                <c:otherwise>Ничья</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:when>
    <c:otherwise>
      <div class="empty-state">
        <div>📋</div>
        <h3>Нет завершенных матчей</h3>
        <p>Сыграйте несколько матчей, и они появятся здесь</p>
      </div>
    </c:otherwise>
  </c:choose>

  <div class="action-buttons">
    <a href="${pageContext.request.contextPath}/new-match" class="btn">
      🎮 Начать новый матч
    </a>
    <a href="${pageContext.request.contextPath}/" class="btn btn-home">
      ← На главную
    </a>
  </div>
</div>
</body>
</html>
