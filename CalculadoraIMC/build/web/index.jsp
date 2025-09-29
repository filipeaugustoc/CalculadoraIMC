<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Calculadora de IMC</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .container { background: white; padding: 20px 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; width: 320px; }
        h1 { color: #333; }
        label { display: block; margin-top: 15px; text-align: left; color: #555; font-weight: bold; }
        input[type="text"] { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 20px; }
        input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Calculadora de IMC</h1>
        <p>Insira seus dados para calcular.</p>

        <form action="calcular.jsp" method="POST">
            
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="peso">Peso (kg):</label>
            <input type="text" id="peso" name="peso" placeholder="Ex: 70.5" required>

            <label for="altura">Altura (m):</label>
            <input type="text" id="altura" name="altura" placeholder="Ex: 1.75" required>

            <br>
            <input type="submit" value="Calcular IMC">
        </form>
    </div>
</body>
</html>