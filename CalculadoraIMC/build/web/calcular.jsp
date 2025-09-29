<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>Resultado do IMC</title>
    <style>
        body {font-family: sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .container { background: white; padding: 20px 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; }
        h1 { color: #333; }
        .resultado{ font-size: 24px; margin: 20px 0; font-weight: bold; }
        .classificacao { font-size: 18px; color: #555; }
        a { background-color: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; margin-top: 20px; display: inline-block; }
        a:hover {background-color: #0056b3; }
        .erro {color: red; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Resultado do Calculo</h1>
        <%-- Início do código java (Scriptlet) --%>
        <%
            // Declaração de variáveis que usaremos
            String nome = "";
            double peso = 0;
            double altura = 0;
            double imc = 0;
            String classificacao = "";
            String erro = null;
            
            try {
                // 1. Pegar os parâmetros
                String nomeStr = request.getParameter("nome");
                String pesoStr = request.getParameter("peso");
                String alturaStr = request.getParameter("altura");

                
                // 2. VERIFICAR SE OS DADOS FORAM REALMENTE ENVIADOS (MUITO IMPORTANTE!)
                if (nomeStr == null || pesoStr == null || alturaStr == null || 
                    nomeStr.trim().isEmpty() || pesoStr.trim().isEmpty() || alturaStr.trim().isEmpty()) {
                    throw new Exception("Todos os campos do formulário são obrigatórios.");
                }
                
                // 3. Agora que sabemos que não são nulos, podemos usá-los
                nome = nomeStr;
                peso = Double.parseDouble(pesoStr.replace(",", "."));
                altura = Double.parseDouble(alturaStr.replace(",", "."));
                
                // 4. Realizar o cálculo
                if (altura > 0) {
                    imc = peso / (altura * altura);
                } else {
                    throw new Exception("A altura não pode ser zero.");
                }
                
                // 5. Classificar o resultado
                if (imc < 18.5) {
                    classificacao = "Abaixo do peso";
                } else if (imc < 24.9) {
                    classificacao = "Peso normal";
                } else if (imc < 29.9) {
                    classificacao = "Sobrepeso";
                } else if (imc < 34.9) {
                    classificacao = "Obesidade Grau I";
                } else if (imc < 39.9) {
                    classificacao = "Obesidade Grau II";
                } else {
                    classificacao = "Obesidade Grau III (mórbida)";
                }

                
            } catch (NumberFormatException e) {
                erro = "Erro: Peso e altura devem ser números válidos.";
            } catch (Exception e) {
                erro = "Ocorreu um erro: " + e.getMessage();
            }
            %>
            <%-- Fim do código Java --%>
            
            <%-- Exibindo o resultado ou a mensagem de erro --%>
            <%
                if (erro != null) {
            %>
                <p class ="erro"><%= erro %></p>
            <%                        
                } else {
            %>
                <p>Seu IMC é:</p>
                <p class="resultado"><%= String.format("%.2f", imc)%></p>
                <p class="classificacao">Sua classificação é:<strong><%= classificacao %></strong></p>
            <%
                }
            %>
            
            <br>
            <a href="index.jsp">Calcular Novamente</a>
    </div>
</body>
</html>