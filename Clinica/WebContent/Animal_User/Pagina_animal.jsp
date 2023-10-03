<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DTO.UserDTO"%>
<%@page import="DAO.AnimalClienteDAO"%>
<%@page import="DTO.Animal_UserDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <title>Tela de Listar Cliente</title>
     <link rel="stylesheet" href="CSS.css">
    <style>
    
      @charset "ISO-8859-1";
  /* Estilo Geral */
      * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      }
      body {
      min-height: 100vh;
      min-width: 100vw;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(45deg, rgb(0, 0, 255), rgb(20, 20, 210), rgb(30, 30, 146), rgb(32, 32, 100));
      font-family: Arial, Helvetica, sans-serif;
      }
      main.container {
      background: white;
      padding: 2rem;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
      border-radius: 8px;
      width: 90%;
      max-width: 1200px;
      }
      h1 {
      text-align: center;
     
      padding: 10px;
      }
      table {
      border-collapse: collapse;
      width: 100%;
      }
      th, td {
      padding: 1rem;
      text-align: center;
      border-bottom: 1px solid #ccc;
      }
      th {
      background-color: lightgray;
      font-weight: bold;
      }
      #pesq-caixa{
      border: 1px solid #b7b6b6;
      border-radius: 4px;
      }
      #pesq-animal-button{
      background: linear-gradient(45deg, rgb(0, 0, 255), rgb(20, 20, 210), rgb(30, 30, 146), rgb(32, 32, 100));
      color: white;
      padding: 12px ;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px
      }
      #desfazer-button{
      background: linear-gradient(45deg, rgb(255, 0, 0), rgb(210, 20, 20), rgb(146, 30, 30), rgb(100, 32, 32));
      color: white;
      padding: 12px ;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px
      }
      .button-Dados{
      display: inline-block;
      margin-top: 1rem;
      text-decoration: none;
      background-color: #1E90FF;
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      cursor: pointer;
      border: none;
      font-size: 15px;
      }
      #delet-button{
      display: inline-block;
      margin-top: 1rem;
      text-decoration: none;
      background-color: rgb(255, 0, 0);
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      }
      #alt-button{
      display: inline-block;
      margin-top: 1rem;
      text-decoration: none;
      background-color: rgb(153, 255, 0);
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      }
      #cadastrar-button {
      display: inline-block;
      margin-left: 0%;
      text-decoration: none;
      background-color: #333;
      color: #fff;
      padding: 10px;
      border-radius: 4px;
      margin-bottom:2px	;
      }
      .button_vacina {
      display: inline-block;
      margin-top: 1rem;
      text-decoration: none;
      background-color: #3087db;
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      border: none;
      font-size:16px;
      }
      .button_vacina:hover{
      transform: scale(0.95); 
      transition: transform 0.3s ease;
      }
      #pesq-button:hover {
      transform: scale(0.95); 
      transition: transform 0.3s ease; 
      }
      #delet-button:hover {
      transform: scale(0.95); 
      transition: transform 0.3s ease; 
      }
      .button-Dados:hover {
      transform: scale(0.95); 
      transition: transform 0.3s ease; 
      }
      #alt-button:hover {
      transform: scale(0.95); 
      transition: transform 0.3s ease;
      }
      #cadastrar-button:hover {
      transform: scale(0.95);
      transition: transform 0.3s ease;
      }
      /** modal do cadastrar **/
      /* Estilos do modal */
      .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.6);
      }
      .modal-content {
      background-color: #fff;
      margin: 6% auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
      max-width: 500px;
      width: 80%;
      }
      .close {
      color: #1e1d1d;
      float: right;
      font-size: 30px;
      font-weight: bold;
      cursor: pointer;
      }
      .close:hover {
      color: #525151;
      }
      .modal-form{
      display: flex;
      flex-direction: column;
      }
      input, .button-modal {
      margin-bottom: 5px;
      padding: 12px;
      border: 2px solid #868686;
      border-radius: 5px;
      outline: none;
      transition: border-color 0.3s;
      font-size: 16px;
      }
      input:hover {
      border-color: #1e8fffa5;
      }
      .button-modal {
      padding: 12px;
      background-color: #1E90FF;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: 600;
      transition: background-color 0.3s;
      }
      .button-modal:hover {
      background-color: #75aade;
      }
      .container {
      padding: 10px;
      }  
      /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\zzzzz */
      .register {
      color: #1E90FF;
      cursor: pointer;
      text-decoration: underline;
      }
      .cont{
      display: flex;
      justify-content: space-between ;
      align-items: center;
      justify-items: center;
      }
      select {
      margin-bottom: 5px;
      padding: 12px;
      border: 2px solid #868686;
      border-radius: 5px;
      outline: none;
      transition: border-color 0.3s;
      font-size: 16px;
      background-color: white; /* Cor de fundo */
      color: #333; /* Cor do texto */
      width: 100%; /* Preencha 100% da largura do elemento pai */
      }
      /* Estilo quando hover (mouse sobre o elemento) */
      select:hover {
      border-color: #1e8fffa5;
      }
      /* Estilize o placeholder no select */
      select {
      color: #000; /* Cor desejada para o placeholder */
      }
      /* Estilize o placeholder no input type date */
      input[type="date"]::placeholder {
      color: #000; /* Cor desejada para o placeholder */
      }
      /* Estilize o placeholder no input type text */
      input[type="text"]::placeholder {
      color: #000; /* Cor desejada para o placeholder */
      }
      .material-symbols-outlined{
      cursor:pointer;
      }
      .material-symbols-outlined:hover{
      background-color: #1E90FF;
      color: #ffffff;
      border-radius: 10px;
      }
      /*modal dados */
      #modal-dados-dados {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      }
      #modal-dados-dados:hover {
      background-color: #555; /* Cor mais escura no hover */
      }
      /* Estilização do modal */
      .modal-dados {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7); 
      }
      .modal-container {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      background: white;
      padding: 3rem;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
      border-radius: 8px;
      width: 90%;
      max-width: 1200px;
      }
      .fechar {
      color: #1e1d1d;
      float: right;
      font-size: 30px;
      font-weight: bold;
      cursor: pointer;
      }
      
     
      
    </style>
  </head>
  <body>
    <% 
      int idDesejado = Integer.parseInt(request.getParameter("id_User")); // O ID referente ao usuario para filtrar
      
      AnimalClienteDAO animal = new AnimalClienteDAO();
      ArrayList<Animal_UserDTO> users = animal.ListarAnimaisClientes();
      int id_animal= 0;
      String nome_animal = "";
      String especie = "";
      String raca = "";
      String data_nascimento = "";
      
      
      
      UserDAO listar = new UserDAO();
      ArrayList<UserDTO> lista = listar.ArrayListarUser();
      String nome_User = "";
      String email_User = "";
      String senha_User = "";
      
      boolean encontrou = false; // Flag para indicar se pelo menos um usuário foi encontrado
      
      //manda para o form voltar
      for (UserDTO user : lista) {
          if (user.getId_user()== idDesejado) {
           
            nome_User = user.getNome();
            email_User = user.getEmail();
            senha_User = user.getSenha();            
          }
        }
      
      %>
    <main class="container">
      <span onclick="voltar()" class="material-symbols-outlined">home</span>
      <h1>Lista de animais</h1>
      <div class="cont">
        <div id="pesq-div">
          <input type="text" id="pesq-animal-caixa" placeholder="Digite o nome do animal">
          <button id="pesq-animal-button">Pesquisar por Animal</button>
          <button id="desfazer-button">Desfazer</button>
        </div>
        <div class="cont-2">
          <a href="#" id="cadastrar-button" onclick="openModalCadastrar()">Cadastrar</a>   
        </div>
      </div>
      <table>
        <tr>
          <th>Código animal</th>
          <th>Nome</th>
          <th>Ficha</th>
          <th>Alterar</th>
          <th>Deletar</th>
        </tr>
        <%
          for (Animal_UserDTO user : users) {
            if (user.getCliente().getId_user() == idDesejado) { // Verifica se o ID corresponde ao desejado
              encontrou = true; // Define a flag como verdadeira
              
              id_animal = user.getId_animal();
              nome_animal = user.getNome_animal();
              especie = user.getEspecie();
              raca = user.getRaca();
              data_nascimento = user.getData_nascimento();
          %>
        <tr>
          <td><%= user.getId_animal()%></td>
          <td><%= user.getNome_animal() %></td>
          <td>
            <button class="button-Dados" onclick="mostrarModal(<%= id_animal %>, '<%= nome_animal %>', '<%= especie %>', '<%= raca %>', '<%= data_nascimento %>','<%=nome_User%>')">Dados</button>
          </td>
          <td><a  href="#" id="alt-button" onclick="preencherFormularioAlterar(<%= id_animal %>, '<%= nome_animal %>', '<%= especie %>', '<%= raca %>', '<%= data_nascimento %>')">Alterar</a></td>
          <td><a href="#" id="delet-button" onclick="preencherFormularioDeletar(<%= id_animal %>, '<%= nome_animal %>', '<%= especie %>', '<%= raca %>', '<%= data_nascimento %>')">Deletar</a></td>
        </tr>
        <tr id="animal-nao-encontrado" style="display: none;">
          <td colspan="6">
            <h1>Animal não encontrado</h1>
          </td>
        </tr>
        <%
          }
          }
          
          if (!encontrou) {
          %>
        <table>
          <tr>
            <td colspan="1">
              <h1>Você não possui animais cadastrados</h1>
            </td>
          </tr>
          <%
            }
            %>
        </table>
      </table>
      <!-- modal cadastrar animal -->
      <div id="cadastrar" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal_cadastrar()">&times;</span>
          <div class="container">
            <h1 class="cadastra">Cadastre seu animal</h1>
          </div>
          <form action="Cadastrar_animal.jsp" method="post" class="modal-form">
            <input type="text" id="nome_animal" name="nome_animal" placeholder="Nome do animal" required>
            <select id="especie" name="especie" required>
              <option value="">Selecione uma espécie</option>
              <option value="Cachorro">Cachorro</option>
              <option value="Gato">Gato</option>
              <option value="Pássaro">Pássaro</option>
              <option value="Hamster">Hamster</option>
              <option value="Coelho">Coelho</option>
              <option value="Rato">Rato</option>
              <option value="Peixe">Peixe</option>
              <option value="Cavalo">Cavalo</option>
              <option value="Papagaio">Papagaio</option>
              <option value="Tartaruga">Tartaruga</option>
              <option value="Galinha">Galinha</option>
              <option value="Porco">Porco</option>
              <option value="Serpente">Serpente</option>
              <option value="Elefante">Elefante</option>
            </select>
            <select id="raca" name="raca" placeholder="Raça animal" required >
              <option value="">Selecione uma raça</option>
            </select>
            <input type="date" id="data_nascimento" name="data_nascimento" required>
            <input type="hidden" id="id_cliente" name="id_cliente" value="<%= idDesejado %>">
            <button type="submit" class="button-modal">Cadastrar</button>
          </form>
        </div>
      </div>
      <!-- modal alterar animal -->
      <div id="alterar" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModalAlterar()">&times;</span>
          <div class="container">
            <h1>Alterar</h1>
          </div>
          <form action="Alterar_animal.jsp?idDesejado=<%=idDesejado%>" method="post"  class="modal-form">
            <p>Código animal:</p>
            <input type="text" name="id_animal_altera" id="id_animal_altera" disabled="disabled" value="">
            <input type="hidden" name="id_animal_hidden_altera" id="id_animal_hidden_altera" value="">
            <p>Nome:</p>
            <input type="text" name="nome_altera" id="nome_altera"  value="">
            <p>Especie:</p>
            <select  name="especie_animal_altera" id="especie_animal_altera" onchange="carregarRacas()" required>
              <option value="Cachorro">Cachorro</option>
              <option value="Gato">Gato</option>
              <option value="Pássaro">Pássaro</option>
              <option value="Hamster">Hamster</option>
              <option value="Coelho">Coelho</option>
              <option value="Rato">Rato</option>
              <option value="Peixe">Peixe</option>
              <option value="Cavalo">Cavalo</option>
              <option value="Papagaio">Papagaio</option>
              <option value="Tartaruga">Tartaruga</option>
              <option value="Galinha">Galinha</option>
              <option value="Porco">Porco</option>
              <option value="Serpente">Serpente</option>
              <option value="Elefante">Elefante</option>
            </select>
            <p>Raça:</p>
            <select name="raca_animal_altera" id="raca_animal_altera">
            </select>
            <p>Data de nascimento:	</p>
            <input type="date" name="data_nascimento_animal_altera" id="data_nascimento_animal_altera" Value="" >
            <button type="submit" class="button-modal">Alterar</button>
          </form>
        </div>
      </div>
      <!-- modal deletar animal-->
      <div id="deletar" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal_Deletar()">&times;</span>
          <div class="container">
            <h1>Deletar</h1>
          </div>
          <form action="Deletar_animal.jsp?idDesejado=<%=idDesejado%>" method="post"  class="modal-form">
            <p>Código animal:</p>
            <input type="text" name="id_animal" id="id_animal" disabled="disabled" value="">
            <input type="hidden" name="id_animal_hidden" id="id_animal_hidden" value="">
            <p>Nome:</p>
            <input type="text" name="nome" id="nome" disabled="disabled" value="">
            <p>Especie:</p>
            <input type="text" name="especie_animal" id="especie_animal" disabled="disabled" Value="" >
            <p>Raça:</p>
            <input type="text" name="raca_animal" id="raca_animal" disabled="disabled" value="" >
            <p>Data de nascimento:	</p>
            <input type="date" name="data_nascimento_animal" id="data_nascimento_animal" disabled="disabled" Value="" >
            <button type="submit" class="button-modal">Deletar</button>
          </form>
        </div>
      </div>
      <!--modal dados  -->
      <div id="myModal" class="modal-dados">
        <div class="modal-container">
          <div></div>
          <span class="close" onclick="fecharModal()">&times;</span>
          <h1>Dadoso do animal</h1>
          <table border="1">
            <tr>
              <th>Dono</th>
              <th>Nome animal</th>
              <th>Especie</th>
              <th>Raça</th>
              <th>Data de nascimento</th>
              <th>id do animal</th>
              <th>Carteira de vacinas </th>
            </tr>
            <% 
              %>
            <tr>
              <td id="nome_dono"> </td>
              <td id="nome_dados"></td>
              <td id="especie_animal_dados"></td>
              <td id="raca_animal_dados"></td>
              <td id="data_nascimento_animal_dados"></td>
              <td id="id_animal_dados"></td>
              <td ><button class="button_vacina">Vacinas</button></td>
            </tr>
            <% 
              %>
          </table>
        </div>
      </div>
      <%       
        %>
      <!-- form para voltar para Tela_de_Logado --> 
      <form id="return_Form" action="../index/Logado/Tela_de_Logado.jsp" method="post">
        <input type="hidden" name="nome_User" id="nome_User" value="<%=nome_User%>" />
        <input type="hidden" name="email_User" id="email_User" value="<%=email_User%>" />
        <input type="hidden" name="senha_User" id="senha_User" value="<%=senha_User%>" />
        <input type="hidden" name="id_User" id="id_User" value="<%=idDesejado%>" />    
      </form>
    </main>
  </body>
  <script>
    function mostrarModal(id_animal, nome_animal, especie, raca, data_nascimento, nome_User) {
       document.getElementById("nome_dono").textContent = nome_User;
    
       document.getElementById("nome_dados").textContent = nome_animal;
       document.getElementById("especie_animal_dados").textContent = especie;
       document.getElementById("raca_animal_dados").textContent = raca;
    
      
       const dataNascimentoFormatada = new Date(data_nascimento).toLocaleDateString('pt-BR');
    
       document.getElementById("data_nascimento_animal_dados").textContent = dataNascimentoFormatada;
    
       document.getElementById("id_animal_dados").textContent = id_animal;
    
       document.getElementById("myModal").style.display = "block";
    }
    
    
    
    
    
    
    
    
    
    
    
    document.addEventListener("DOMContentLoaded", function () {
     const inputPesquisaAnimal = document.getElementById("pesq-animal-caixa");
     const pesquisarAnimalButton = document.getElementById("pesq-animal-button");
     const tabela = document.querySelector("table");
     const linhas = tabela.getElementsByTagName("tr");
     const animalNaoEncontradoRow = document.getElementById("animal-nao-encontrado");
    
     // Crie uma cópia do estado inicial da tabela
     const estadoInicialTabela = [...linhas].map((linha) => linha.style.display);
    
     pesquisarAnimalButton.addEventListener("click", function () {
       const termoPesquisaAnimal = inputPesquisaAnimal.value.toLowerCase();
       let animalEncontrado = false;
    
       for (let i = 1; i < linhas.length; i++) {
         const animalNomeCelula = linhas[i].getElementsByTagName("td")[1];
         if (animalNomeCelula) {
           const animalNomeTexto = animalNomeCelula.textContent.toLowerCase();
           if (animalNomeTexto.includes(termoPesquisaAnimal)) {
             linhas[i].style.display = "";
             animalEncontrado = true;
           } else {
             linhas[i].style.display = "none";
           }
         }
       }
    
       // Mostra a linha "Animal não encontrado" se nenhum animal for encontrado
       animalNaoEncontradoRow.style.display = animalEncontrado ? "none" : "";
    
     });
    
     // Adicione um evento de desfazer ao botão de desfazer
     const desfazerButton = document.getElementById("desfazer-button");
     desfazerButton.addEventListener("click", function () {
       // Restaure o estado inicial da tabela
       for (let i = 1; i < linhas.length; i++) {
         linhas[i].style.display = estadoInicialTabela[i];
       }
       animalNaoEncontradoRow.style.display = "none";
     });
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // modal cadastrar 
      function openModalCadastrar() {
      	document.getElementById("cadastrar").style.display = "block";
      	}
      function closeModal_cadastrar() {
      	document.getElementById("cadastrar").style.display = "none";
      	}
      
    //modal deletar
      function closeModal_Deletar() {
      	document.getElementById("deletar").style.display = "none";
      	}
      	
    //modal alterar
      function closeModalAlterar() {
      	document.getElementById("alterar").style.display = "none";
      	}
      
    //modal dados
      
      function fecharModal() {
      	document.getElementById("myModal").style.display = "none";
      	}
    //não lembro para que serve, porém serve para voltar para uma determinada página
      function voltar() {
          document.getElementById("return_Form").submit();
          }
      
    //Preencher os campos do formulário de alterção com os valores recebidospara alterar
        function preencherFormularioAlterar(id_animal, nome_animal, especie, raca, data_nascimento) {
         
         document.getElementById("id_animal_altera").value = id_animal;
         document.getElementById("nome_altera").value = nome_animal;
         document.getElementById("especie_animal_altera").value = especie;
         document.getElementById("raca_animal_altera").value = raca;
         document.getElementById("data_nascimento_animal_altera").value = data_nascimento;
         
         document.getElementById("id_animal_hidden_altera").value = id_animal;
      
         document.getElementById("alterar").style.display = "block";
         
         carregarRacas(raca);
      }
      
    //Preencher os campos do formulário de deletar com os valores recebidos para deletar 
        function preencherFormularioDeletar(id_animal, nome_animal, especie, raca, data_nascimento) {
      	    document.getElementById("id_animal").value = id_animal;
      	    document.getElementById("nome").value = nome_animal;
      	    document.getElementById("especie_animal").value = especie;
      	    document.getElementById("raca_animal").value = raca;
      	    document.getElementById("data_nascimento_animal").value = data_nascimento;
      	    
      	    document.getElementById("id_animal_hidden").value = id_animal;
      
      	    document.getElementById("deletar").style.display = "block";
      	}
    
    //valores do select de alteração
        function carregarRacas(valor) {
      	  const especieSelectAltera = document.getElementById("especie_animal_altera");
      	  const racaSelectAltera = document.getElementById("raca_animal_altera");
      	  const exibe = valor;
      	
      	  const racasPossiveisAltera = {
      			  "Cachorro": ["Vira lata ","Pastor Alemão", "Golden Retriever", "Labrador", "Bulldog", "Poodle", "Boxer", "Husky", "Dálmata", "Bulldog Francês", "Chihuahua"],
      		        "Gato": ["Siamese", "Persa", "Bengal", "Maine Coon", "Sphynx", "Ragdoll", "British Shorthair", "Scottish Fold", "Siberian", "Devon Rex"],
      		        "Pássaro": ["Cacatua", "Canário", "Periquito", "Calopsita", "Papagaio", "Agapornis", "Arara", "Tucano", "Pardal", "Ave-do-paraíso"],
      		        "Hamster": ["Sírio", "Russo", "Roborovski", "Chinês", "Campbell", "Angorá", "Manchuriano", "Mongol", "Siberiano", "Djungarian"],
      		        "Coelho": ["Holland Lop", "Mini Rex", "Holandês", "Lebre Belga", "Fuzzy Lop", "Mini Lionhead", "Angorá", "Chinchila", "Mini Satin", "Californiano"],
      		        "Rato": ["Rato de Estimação", "Rato Selvagem", "Rato de Laboratório", "Rato Dumbo", "Rato Siamese", "Rato Hooded", "Rato Albino", "Rato de Cauda Longa", "Rato Fawn", "Rato de Cauda Curta"],
      		        "Peixe": ["Betta", "Guppy", "Tetra Neón", "Platy", "Peixe-espada", "Danio Zebra", "Peixe-palhaço", "Corydora", "Bala Shark", "Molinésia"],
      		        "Cavalo": ["Cavalo Árabe", "Puro-Sangue Inglês", "Quarto de Milha", "Cavalo Appaloosa", "Cavalo Pônei", "Cavalo Shire", "Cavalo Frísio", "Cavalo Tennessee Walker", "Cavalo Andaluz", "Cavalo Haflinger"],
      		        "Papagaio": ["Papagaio-do-congo", "Papagaio-cinzento", "Papagaio-de-cabeça-amarela", "Papagaio-de-cabeça-vermelha", "Papagaio-amazônico", "Papagaio-eclectus", "Papagaio-rosa", "Papagaio-molucano", "Papagaio-de-crista", "Papagaio-araçari"],
      		        "Tartaruga": ["Tartaruga-de-ouro", "Tartaruga-de-ouvido-vermelho", "Tartaruga-pintada", "Tartaruga-sulcata", "Tartaruga-leopardo", "Tartaruga-mordedora-comum", "Tartaruga-aligátor", "Tartaruga-mapa", "Tartaruga-de-caixa", "Tartaruga-africana-de-carapaça-macia"],
      		        "Galinha": ["Galinha-doméstica", "Galinha-seda", "Galinha-sussex", "Galinha-plymouth-rock", "Galinha-americana", "Galinha-araucana", "Galinha-brahma", "Galinha-orpington", "Galinha-wyandotte", "Galinha-leghorn"],
      		        "Porco": ["Porco-doméstico", "Porco-da-índia", "Porco-de-miniporco", "Porco-da-índia", "Porco-da-índia-skinny", "Porco-do-vietnã", "Porco-holandês", "Porco-kunekune", "Porco-mangalica", "Porco-peludo"],
      		        "Serpente": ["Serpente-de-milho", "Serpente-rei-da-califórnia", "Serpente-das-árvores", "Serpente-de-leite", "Serpente-de-milho", "Serpente-de-ratão", "Serpente-das-nuvens", "Serpente-boieira", "Serpente-rato-do-deserto", "Serpente-king-cobra"],
      		        "Elefante": ["Elefante-africano", "Elefante-asiático", "Elefante-da-floresta", "Elefante-da-savana", "Elefante-africano-das-florestas", "Elefante-indiano", "Elefante-africano-de-savanas", "Elefante-da-floresta-africana", "Elefante-pigmeu", "Elefante-do-sri-lanka"]
      	  };
      	  
      	  const especieSelecionadaAltera = especieSelectAltera.value;
      	  const racasAltera = racasPossiveisAltera[especieSelecionadaAltera] || [];
      	  
      	  racaSelectAltera.innerHTML = "";  
      	  
      	  const optionPadrao = document.createElement("option");
      	  optionPadrao.value = valor;
      	  if(valor !=null){
      		  optionPadrao.textContent = valor;
      		  
      	  }
      	  else{
      		  optionPadrao.textContent = "Escolha";
      	  }
      	  
      	  racaSelectAltera.appendChild(optionPadrao);
      	  
      	  racasAltera.forEach((raca) => {
      	    const option = document.createElement("option");
      	    option.value = raca;
      	    option.textContent = raca;
      	    racaSelectAltera.appendChild(option);
      	  });
      	}
      
        
      
    //valores do select de cadastro
        const especieSelect = document.getElementById("especie");
        const racaSelect = document.getElementById("raca");
        
        const racasPossiveis = {
          "Cachorro": ["Escolha","Vira lata ","Pastor Alemão", "Golden Retriever", "Labrador", "Bulldog", "Poodle", "Boxer", "Husky", "Dálmata", "Bulldog Francês", "Chihuahua"],
          "Gato": ["Escolha","Siamese", "Persa", "Bengal", "Maine Coon", "Sphynx", "Ragdoll", "British Shorthair", "Scottish Fold", "Siberian", "Devon Rex"],
          "Pássaro": ["Escolha","Cacatua", "Canário", "Periquito", "Calopsita", "Papagaio", "Agapornis", "Arara", "Tucano", "Pardal", "Ave-do-paraíso"],
          "Hamster": ["Escolha","Sírio", "Russo", "Roborovski", "Chinês", "Campbell", "Angorá", "Manchuriano", "Mongol", "Siberiano", "Djungarian"],
          "Coelho": ["Escolha","Holland Lop", "Mini Rex", "Holandês", "Lebre Belga", "Fuzzy Lop", "Mini Lionhead", "Angorá", "Chinchila", "Mini Satin", "Californiano"],
          "Rato": ["Escolha","Rato de Estimação", "Rato Selvagem", "Rato de Laboratório", "Rato Dumbo", "Rato Siamese", "Rato Hooded", "Rato Albino", "Rato de Cauda Longa", "Rato Fawn", "Rato de Cauda Curta"],
          "Peixe": ["Escolha","Betta", "Guppy", "Tetra Neón", "Platy", "Peixe-espada", "Danio Zebra", "Peixe-palhaço", "Corydora", "Bala Shark", "Molinésia"],
          "Cavalo": ["Escolha","Cavalo Árabe", "Puro-Sangue Inglês", "Quarto de Milha", "Cavalo Appaloosa", "Cavalo Pônei", "Cavalo Shire", "Cavalo Frísio", "Cavalo Tennessee Walker", "Cavalo Andaluz", "Cavalo Haflinger"],
          "Papagaio": ["Escolha","Papagaio-do-congo", "Papagaio-cinzento", "Papagaio-de-cabeça-amarela", "Papagaio-de-cabeça-vermelha", "Papagaio-amazônico", "Papagaio-eclectus", "Papagaio-rosa", "Papagaio-molucano", "Papagaio-de-crista", "Papagaio-araçari"],
          "Tartaruga": ["Escolha","Tartaruga-de-ouro", "Tartaruga-de-ouvido-vermelho", "Tartaruga-pintada", "Tartaruga-sulcata", "Tartaruga-leopardo", "Tartaruga-mordedora-comum", "Tartaruga-aligátor", "Tartaruga-mapa", "Tartaruga-de-caixa", "Tartaruga-africana-de-carapaça-macia"],
          "Galinha": ["Escolha","Galinha-doméstica", "Galinha-seda", "Galinha-sussex", "Galinha-plymouth-rock", "Galinha-americana", "Galinha-araucana", "Galinha-brahma", "Galinha-orpington", "Galinha-wyandotte", "Galinha-leghorn"],
          "Porco": ["Escolha","Porco-doméstico", "Porco-da-índia", "Porco-de-miniporco", "Porco-da-índia", "Porco-da-índia-skinny", "Porco-do-vietnã", "Porco-holandês", "Porco-kunekune", "Porco-mangalica", "Porco-peludo"],
          "Serpente": ["Escolha","Serpente-de-milho", "Serpente-rei-da-califórnia", "Serpente-das-árvores", "Serpente-de-leite", "Serpente-de-milho", "Serpente-de-ratão", "Serpente-das-nuvens", "Serpente-boieira", "Serpente-rato-do-deserto", "Serpente-king-cobra"],
          "Elefante": ["Escolha","Elefante-africano", "Elefante-asiático", "Elefante-da-floresta", "Elefante-da-savana", "Elefante-africano-das-florestas", "Elefante-indiano", "Elefante-africano-de-savanas", "Elefante-da-floresta-africana", "Elefante-pigmeu", "Elefante-do-sri-lanka"]
        };
        
        especieSelect.addEventListener("change", () => {
          const especieSelecionada = especieSelect.value;
          const racas = racasPossiveis[especieSelecionada] || [];
      
          if (racas.length > 0) {
            racaSelect.style.display = "block"; 
          } else {
            racaSelect.style.display = "none"; 
          }
          racaSelect.innerHTML = "";
          racas.forEach((raca) => {
            const option = document.createElement("option");
            option.value = raca;
            option.textContent = raca;
            racaSelect.appendChild(option);
          });
        });
        
    //retorno das págias ligadas a Pagina_animal
      var retorna = new URLSearchParams(window.location.search);
      var elemento = retorna.get('conf');
      
      switch (elemento) {
      case 'deleta':
      setTimeout(function() {
      alert('Animal deletado!');
      }, 100);
      break;
      
      case 'erro_deleta':
      setTimeout(function() {
      alert('O animal não pode ser deletado por algum motivo por parte do servidor!');
      }, 100);
      break;
      
      case 'erro_cadastra_animal':
      setTimeout(function() {
      alert('O animal não pode ser cadastrado por algum motivo por parte do servidor!');
      }, 100);
      break;
      }
  </script>
</html>