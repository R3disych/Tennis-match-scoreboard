<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tennis match scoreboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            justify-content: space-between;
            align-items: center;
        }

        .link-box {
            width: 200px;
            height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #ffffff, #f0f0f0);
        }

        .link-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .link-box a {
            text-decoration: none;
            color: #444;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 30px;
            background-color: #e0e0e0;
            transition: all 0.3s ease;
        }

        .link-box a:hover {
            background-color: #4CAF50;
            color: white;
        }

        .icon {
            font-size: 50px;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        .center-image {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 40px;
        }

        .center-image img {
            max-width: 100%;
            max-height: 400px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Левая ссылка - Новая игра -->
        <div class="link-box">
            <div class="icon">🎮</div>
            <h3>Новая игра</h3>
            <p>Начните новое захватывающее приключение</p>
            <a href="${pageContext.request.contextPath}/new-game">Играть</a>
        </div>

        <!-- Центральное изображение -->
        <div class="center-image">
            <img src="${pageContext.request.contextPath}/images/mainimg.jpg" alt="Логотип игры">
        </div>

        <!-- Правая ссылка - Завершенные матчи -->
        <div class="link-box">
            <div class="icon">🏆</div>
            <h3>История матчей</h3>
            <p>Просмотрите результаты завершенных игр</p>
            <a href="${pageContext.request.contextPath}/completed-matches">Просмотреть</a>
        </div>
    </div>
</body>
</html>