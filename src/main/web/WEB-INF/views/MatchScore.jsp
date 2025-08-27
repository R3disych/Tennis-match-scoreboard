<%--
  Created by IntelliJ IDEA.
  User: Unfortunately_Redis
  Date: 25.08.2025
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Теннисный матч</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .match-container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            width: 90%;
            max-width: 600px;
            text-align: center;
        }

        .match-header {
            color: #333;
            margin-bottom: 30px;
            border-bottom: 2px solid #667eea;
            padding-bottom: 15px;
        }

        .players-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .player-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            width: 45%;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .player-card:hover {
            transform: translateY(-5px);
        }

        .player-name {
            font-size: 18px;
            font-weight: bold;
            color: #495057;
            margin-bottom: 15px;
        }

        .player-score {
            font-size: 36px;
            font-weight: bold;
            color: #667eea;
            margin: 10px 0;
        }

        .score-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }

        .score-btn {
            background: #667eea;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .score-btn:hover {
            background: #5a67d8;
        }

        .match-info {
            background: #e9ecef;
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }

        .match-id {
            font-size: 14px;
            color: #6c757d;
        }

        .action-buttons {
            margin-top: 30px;
        }

        .action-btn {
            background: #28a745;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin: 0 10px;
        }

        .action-btn:hover {
            background: #218838;
        }

        .btn-danger {
            background: #dc3545;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .vs-text {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="match-container">
    <div class="match-header">
        <h1>🎾 Теннисный матч</h1>
        <div class="match-id">ID матча: #${match.id}</div>
    </div>

    <div class="players-container">
        <div class="player-card">
            <div class="player-name">${match.firstPlayer.name}</div>
            <div class="player-score">${match.scoreFirstPlayer}</div>
            <div class="score-buttons">
                <button class="score-btn" onclick="updateScore(${match.id}, 1, 'increment')">+</button>
                <button class="score-btn" onclick="updateScore(${match.id}, 1, 'decrement')">-</button>
            </div>
        </div>

        <div class="vs-text">VS</div>

        <div class="player-card">
            <div class="player-name">${match.secondPlayer.name}</div>
            <div class="player-score">${match.scoreSecondPlayer}</div>
            <div class="score-buttons">
                <button class="score-btn" onclick="updateScore(${match.id}, 2, 'increment')">+</button>
                <button class="score-btn" onclick="updateScore(${match.id}, 2, 'decrement')">-</button>
            </div>
        </div>
    </div>

    <div class="match-info">
        <h3>Статус матча</h3>
        <p>${match.scoreFirstPlayer > match.scoreSecondPlayer ?
                'Лидирует: ' + match.firstPlayer.name :
                match.scoreFirstPlayer < match.scoreSecondPlayer ?
                        'Лидирует: ' + match.secondPlayer.name :
                        'Ничья'}</p>
    </div>

    <div class="action-buttons">
        <button class="action-btn" onclick="finishMatch(${match.id})">
            🏆 Завершить матч
        </button>
        <button class="action-btn btn-danger" onclick="goToHome()">
            ← На главную
        </button>
    </div>
</div>

<script>
    function updateScore(matchId, playerNumber, action) {
        // Здесь будет AJAX запрос для обновления счета
        console.log('Update score for match:', matchId, 'player:', playerNumber, 'action:', action);
        // Обновить страницу или счет через AJAX
        location.reload();
    }

    function finishMatch(matchId) {
        if (confirm('Завершить матч?')) {
            // AJAX запрос для завершения матча
            console.log('Finish match:', matchId);
            window.location.href = '../..';
        }
    }

    function goToHome() {
        window.location.href = '../..';
    }
</script>
</body>
</html>
