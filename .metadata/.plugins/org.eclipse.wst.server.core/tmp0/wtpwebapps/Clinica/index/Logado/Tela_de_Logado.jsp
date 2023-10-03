<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  String nome = request.getParameter("nome_User");
  String email = request.getParameter("email_User");
  String senha = request.getParameter("senha_User");
  int id = Integer.parseInt(request.getParameter("id_User"));
  %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clíca Santos</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="CSS-logado.css">
    <script src="script.js"></script>
  </head>
  <style>
    .txt {
    border-collapse: collapse;
    width: 100%;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra suave */
    }
    th, td {
    border: 1px solid #ccc;
    text-align: center;
    padding: 12px; /* Maior espaço interno */
    }
    th {
    background-color: #f2f2f2;
    }
    tr:hover {
    background-color: #bcb8b8; /* Cor de fundo quando hover (passar o mouse) */
    }
    .hoje {
    background-color: #1E90FF;
    color:#fff;
    }
    .conteiner-titulo-0{
    margin-top: 15%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    text-align: center;
    justify-items: center;
    padding: 25px;
    }
    .container-calendario{
    background-color: #fff; 
    }
    .container-calendario .icon-seta{
    cursor: pointer;
    }
    .container-calendario.icon-seta:hover{
    background-color: #1E90FF;
    }
    #mesExibido{
    font-size: 30px;
    }
  </style>
  </head>
  <body>
    <header>
      <nav class="nav-menu">
        <div class="hamburger-menu" onclick="toggleMenu()">
          <span class="material-icons  controla">reorder</span>
        </div>
        <ul class="menu-list">
          <li><a class="nav-menu-a" href="#">Agenda</a></li>
          <li><a class="nav-menu-a" href="#">Calendário</a></li>
          <li><a class="nav-menu-a" href="#">Serviços</a></li>
          <li><a class="nav-menu-a" href="#" class="dropbtn" onclick="redirecionarParaAnimais()">Animais</a></li>
          <li class="dropdown">
            <button class="btnLogin-popup">Login</button>
            <div class="dropdown-content">
              <span class="a-dropdown" onclick="openModalEntrar()">Alterar</span>
              <span class="a-dropdown" onclick="openModalCadastrar()">Deletar </span>                  
            </div>
          </li>
        </ul>
      </nav>
    </header>
    <div class="logo">
      <img class="logo" src="imgs/Logo_Clínica-removebg-preview.png">
    </div>
    <section>
      <img class="img3" src="imgs/castracao-de-caes-e-gatos.jpg" alt="Img3">
      <div class="conteiner-titulo-0">
        <div class="texto">
          <h1 class="txt-agenda">Seja bem-vindo senhor <%=nome %> </h1>
        </div>
        <div class="container-calendario">
          <span onclick="mesAnterior()"><span class="material-symbols-outlined  icon-seta">arrow_back</span></span>
          <span id="mesExibido" ></span>
          <span onclick="proximoMes()"><span class="material-symbols-outlined icon-seta">arrow_forward</span></span>
          <p id="calendario" class="txt" ></p>
        </div>
      </div>
    </section>
    <div id="entrar" class="modal">
      <!-- modal alterar -->
      <div class="modal-content">
        <span class="close" onclick="closeModal_entrar()">&times;</span>
        <div class="container">
          <h1>Alterar</h1>
          <h2>Tem certeza que deseja alterar?</h2>
        </div>
        <form action="../../User/Alterar.jsp" method="post">
          <p>Código de usuário</p>
          <input type="text" name="idcliente" id="idcliente" disabled="disabled" value="<%=id%>">
          <input type="hidden" name="huser" id="huser" value="<%=id%>">
          <p>Nome:</p>
          <input type="text" name="nome" id="nome" value="<%=nome%>">
          <p>E-mail:</p>
          <input type="email" name="email" id="email" value="<%=email%>" required>
          <input type="hidden" name="email_antigo" id="email_antigo" value="<%=email%>" >
          <p>Senha:</p>
          <input type="password" name="senha_entrar" id="senha_entrar" value="<%=senha%>" required><!-- visibilidade de senha entrar -->
          <label id="mostrar_senha_entrar" class="box-modal" onclick="exibirSenhaEntrar()">🔒</label>
          <button type="submit" class="button-modal">Alterar</button>
        </form>
      </div>
    </div>
    <div id="cadastrar" class="modal">
      <!-- modal deletar -->
      <div class="modal-content">
        <span class="close" onclick="closeModal_cadastrar()">&times;</span>
        <div class="container">
          <h1>Cadastre-se</h1>
          <h2>Curando patinhas e corações: nossa clínica veterinária é o lar do cuidado e amor.</h2>
        </div>
        <form action="../../User/Deletar.jsp" method="post">
          <input type="text" name="idcliente" id="idcliente" disabled="disabled" value="<%= id %>">
          <input type="hidden" name="huser" id="huser" value="<%= id %>">
          <p>Nome:</p>
          <input type="text" name="nome" id="nome" disabled="disabled" value="<%= nome%>">
          <p>E-mail:</p>
          <input type="email" name="email" id="email" disabled="disabled" value="<%= email%>" required>
          <p>Senha:</p>
          <input type="password" name="senha_cadastrar" id="senha_cadastrar" disabled="disabled" Value="<%=senha%>" required> <!-- visibilidade de senha cadastrar -->
          <label id="mostrar_senha_cadastrar" class="box-modal" onclick="exibirSenhaCadastro()">🔒</label>
          <button type="submit" class="button-modal">Deletar</button>
        </form>
      </div>
    </div>
    <!-- segunda parte do site. corpo após o tituloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
    <header class="segunda-parte">
      <div class="container-titulo-1">
        <div>
          <h1 id="h1-segunda-parte">Cirurgiões Veterinários para cães e gatos em Belém do Pará</h1>
          <p id="p-segunda-parte">O centro cirúrgico da Clínica Santos possui os materiais e equipamentos necessários para realizar um procedimento seguro e com a mais alta qualidade, além de que contamos com uma médica veterinária especializada em cirurgia de tecidos moles.
            <br><br>
            As indicações de cirurgias são variadas, no entanto, as mais realizadas são as castrações seguidas da mastectomia e das cirurgias oculares e abdominais.
          </p>
        </div>
        <img id="imagem-titulo-1" src="imgs/img1.jpg" alt="imagem-de-cachorro">
      </div>
    </header>
    <!-- terceira parte do siteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee -->
    <article>
      <div class="container-titulo-2">
        <h1 id="titulo-segunda-parte">Serviços Veterinarios</h1>
        <div class="container-box">
          <div class="box">
            <img class="imagem-box" src="imgs/icon-Cirurgias.png" alt="immagem-de-fisio">
            <p>Fisioterapia veterinária</p>
            <br>
            <p>Cirurgias de segurança com uma equipe especializada. Cirurgias veterinárias em Belém.</p>
          </div>
          <div class="box">
            <img class="imagem-box" src="imgs/icon-fisio.png" alt="immagem-de-fisio">
            <p>Fisioterapia veterinária</p>
            <br>
            <p>Fisioterapia para animais de todos os portes. Fisioterapia animal em Belém.</p>
          </div>
          <div class="box">
            <img class="imagem-box" src="imgs/icon-exame.png" alt="immagem-de-exame">
            <p>Exames</p>
            <br>
            <p>Exames de sangue e exames laboratoriais. Exames médicos em Belém.</p>
          </div>
          <div class="box">
            <img class="imagem-box" src="imgs/icon-consulta.png" alt="immagem-de-fisio">
            <p>Consultas</p>
            <br>
            <p>Agende sua consulta com um médico especializado. Consultas médicas em Belém.</p>
          </div>
        </div>
        <br>
        <div id="end-da-terceira-parte">
          <p id="p-terceira-parte">Nossa clínica veterinária oferece serviços de qualidade com preços acessíveis. Consultas e exames em diversas especialidades. Conheça a nossa clínica em Belém.</p>
          <button id="button-segunda-parte">Sobre a Clínica</button>
        </div>
      </div>
    </article>
    <!-- fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooter -->
    <footer>
      <div class="footer-content">
        <div class="footer-logo">
          <img  class="img-logo" src="imgs/Logo_Clínica-removebg-preview.png" alt="Logo da Clínica">
        </div>
        <div class="footer-links">
          <ul class="footer-menu">
            <li><a href="#">Termos de Uso</a></li>
            <li><a href="#">Política de Privacidade</a></li>
            <li><a href="#">Mapa do Site</a></li>
          </ul>
        </div>
        <div class="footer-contact">
          <p>Entre em contato:</p>
          <p>Telefone: (91) 94002-8922</p>
          <p>Email: contato@clinicasantos.com</p>
        </div>
        <div class="social-icons">
          <a href="#" class="icon"><i class="fab fa-facebook"></i></a>
          <a href="#" class="icon"><i class="fab fa-twitter"></i></a>
          <a href="#" class="icon"><i class="fab fa-instagram"></i></a>
          <a href="#" class="icon"><i class="fab fa-linkedin"></i></a>
          <a href="#" class="icon"><i class="fab fa-youtube"></i></a>
          <a href="#" class="icon"><i class="fab fa-github"></i></a>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2023 Clínica Santos. Todos os direitos reservados.</p>
      </div>
    </footer>
    <form id="return_Form" action="../../Animal_User/Pagina_animal.jsp" method="post">
      <input type="hidden" name="id_User" id="id_User" value="<%=id%>" />    
      
    </form>
    <script>
      exibirCalendario();
      
      function redirecionarParaAnimais() {
      	 document.getElementById("return_Form").submit();
      }
    </script>
  </body>
</html>