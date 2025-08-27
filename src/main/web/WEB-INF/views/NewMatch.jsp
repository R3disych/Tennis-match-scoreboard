<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Новый матч</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 300px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Новый матч</h2>
    <form action="${pageContext.request.contextPath}/new-match" method="post">
        <div class="form-group">
            <label for="player1">Игрок 1:</label>
            <input type="text" id="player1" name="player1" required>
        </div>
        <div class="form-group">
            <label for="player2">Игрок 2:</label>
            <input type="text" id="player2" name="player2" required>
        </div>
        <button type="submit">Начать матч</button>
    </form>
</div>
</body>
</html>