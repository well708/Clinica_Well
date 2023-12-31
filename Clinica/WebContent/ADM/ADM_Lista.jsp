<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DAO.AnimalClienteDAO"%>
<%@page import="DTO.Animal_UserDTO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DTO.UserDTO"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

 <link rel="stylesheet" href="wasds.css">
<title>Tela de Listar Cliente</title>
<style>

</style>
</head>
<body>


<main class="container">
  <h1>Lista de <b>animais</b></h1>
  
  <div id="pesq-div">
    <input type="text" id="pesq-caixa" placeholder="Digite o nome do dono">
    <button id="pesq-button">Pesquisar</button>
    <button id="desfazer-button">Desfazer</button> <!-- Botão de Desfazer -->
  </div>
  <div id="filtro-div">
    <input type="radio" id="filtro-dono" name="filtro" value="dono" checked>
    <label for="filtro-dono">Pesquisar por Dono</label>
    <input type="radio" id="filtro-animal" name="filtro" value="animal">
    <label for="filtro-animal">Pesquisar por Animal</label>
  </div>

 
    

 <%
UserDAO userDAO = new UserDAO();
ArrayList<UserDTO> users = userDAO.ArrayListarUser();

AnimalClienteDAO animal = new AnimalClienteDAO();
ArrayList<Animal_UserDTO> dono = animal.ListarAnimaisClientes();%>
      
      
      <table>
      <tr>
        <th>ID dono</th>
        <th>Dono</th>
        <th>Nome animal</th> 
        <th>Especie</th> 
        <th>Raça</th>
        <th>Dt nascimento</th> 
        <th>ID animal</th> 
        <th>Alterar</th>
        <th>Deletar</th>
        
      </tr>
      <% 
    
      for (UserDTO user_dono : users) {
    	 int idDesejado = user_dono.getId_user();
      
      for (Animal_UserDTO user : dono) {
    	   if (user.getCliente().getId_user() == idDesejado) { 
    		   
    		   
      %>
      
      <tr>
        <td><%=user_dono.getId_user() %></td>
        <td><%= user_dono.getNome()%></td>  
        <td><%= user.getNome_animal() %></td>
        <td><%= user.getEspecie() %></td>
        <td><%= user.getRaca()%></td>
        <td><%= user.getData_nascimento()%></td>
        <td><%= user.getId_animal()%></td> 
        <td> <button class="button-deleta" onclick="preencherFormularioAlterar('<%= user.getId_animal() %>', '<%= user.getNome_animal() %>', '<%= user.getEspecie() %>', '<%= user.getRaca() %>', '<%= user.getData_nascimento()%>','<%=user_dono.getId_user() %>','<%= user_dono.getNome() %>')"><span class="material-symbols-outlined">edit</span></button></td>
        <td> <button class="button-deleta" onclick="preencherFormularioDeletar('<%= user.getId_animal() %>', '<%= user.getNome_animal() %>', '<%= user.getEspecie() %>', '<%= user.getRaca() %>', '<%= user.getData_nascimento()%>','<%= user_dono.getNome() %>')"><span class="material-symbols-outlined">Delete</span></button></td>
        
      </tr>
      <% 
    	  }
       }
      }
      %>
     
    </table>
    <table>    
    <tr>
    <td><div id="resultado-nao-encontrado" style="display: none;"><h1 class="titulo-container">Não encontrado</h1></div></td>
    </tr>    
    </table>
<!-- modal alterar animal -->
    <div id="alterar" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModalAlterar()">&times;</span>
          <div class="container-modal">
            <h1>Alterar</h1>
          </div>
          <form action="Alterar_animal.jsp" method="post"  class="modal-form">
          <span>Dono:</span>
          <input type="text" name="nome_dono_alt" id="nome_dono_alt" disabled="disabled">
          <input type="hidden" name="idDesejado" id="idDesejado"  value="">
            <span>Código animal:</span>	
            <input type="text" name="id_animal_altera" id="id_animal_altera" disabled="disabled" value="">
            <input type="hidden" name="id_animal_hidden_altera" id="id_animal_hidden_altera" value="">
            <span>Nome:</span>
            <input type="text" name="nome_altera" id="nome_altera"  value="">
            <span>Especie:</span>
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
            <span>Raça:</span>
            <select name="raca_animal_altera" id="raca_animal_altera" required>
              
            </select>
            <span>Data de nascimento:	</span>
            <input type="date" name="data_nascimento_animal_altera" id="data_nascimento_animal_altera" Value="" >
            <button type="submit" class="button-modal">Alterar</button>
          </form>
        </div>
      </div>
      
<!-- modal deletar animal-->
     <!-- modal exclusão de animal -->
<div id="excluir" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal_Deletar()">&times;</span>
    <div class="container">
      <h1>Excluir Animal</h1>
    </div>
    <form action="Deletar_animal.jsp" method="post" class="modal-form">
    
    
    <span>Dono:</span>
      <input type="text" name="dono_deleta" id="dono_deleta" disabled="disabled" value="">
    
    
      <span>Código animal:</span>
      <input type="text" name="id_animal_excluir" id="id_animal_excluir" disabled="disabled" value="">
      <input type="hidden" name="id_animal_hidden_excluir" id="id_animal_hidden_excluir" value="">
      <span>Nome:</span>
      <input type="text" name="nome_excluir" id="nome_excluir" disabled="disabled" value="">
      <span>Espécie:</span>
      <input type="text" name="especie_excluir" id="especie_excluir" disabled="disabled" value="">
      <span>Raça:</span>
      <input type="text" name="raca_excluir" id="raca_excluir" disabled="disabled" value="">
      <span>Data de Nascimento:</span>
      <input type="text" name="data_nascimento_excluir" id="data_nascimento_excluir" disabled="disabled" value="">
      <button type="submit" class="button-modal">Excluir</button>
    </form>
  </div>
</div>
     
</main>	
<script>



//modal deletar
function closeModal_Deletar() {
	document.getElementById("excluir").style.display = "none";
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
  function preencherFormularioAlterar(id_animal, nome_animal, especie, raca, data_nascimento, id_user, dono) {
   
   document.getElementById("id_animal_altera").value = id_animal;
   document.getElementById("nome_altera").value = nome_animal;
   document.getElementById("especie_animal_altera").value = especie;
   document.getElementById("raca_animal_altera").value = raca;
   document.getElementById("data_nascimento_animal_altera").value = data_nascimento;
   document.getElementById("idDesejado").value = id_user;
   
   document.getElementById("nome_dono_alt").value = dono;
   
   document.getElementById("id_animal_hidden_altera").value = id_animal;

   document.getElementById("alterar").style.display = "block";
   
   carregarRacas(raca);
}

//Preencher os campos do formulário de deletar com os valores recebidos para deletar 
  function preencherFormularioDeletar(id_animal, nome_animal, especie, raca, data_nascimento,nome_dono) {
  document.getElementById("dono_deleta").value = nome_dono;
  document.getElementById("id_animal_excluir").value = id_animal;
  document.getElementById("nome_excluir").value = nome_animal;
  document.getElementById("especie_excluir").value = especie;
  document.getElementById("raca_excluir").value = raca;
  document.getElementById("data_nascimento_excluir").value = data_nascimento;
  document.getElementById("id_animal_hidden_excluir").value = id_animal;

  // Exibir o modal de exclusão
  document.getElementById("excluir").style.display = "block";
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






























document.addEventListener("DOMContentLoaded", function () {
	  const inputPesquisa = document.getElementById("pesq-caixa");
	  const pesquisarButton = document.getElementById("pesq-button");
	  const desfazerButton = document.getElementById("desfazer-button");
	  const tabela = document.querySelector("table");
	  const linhas = tabela.getElementsByTagName("tr");
	  const filtroDono = document.getElementById("filtro-dono");
	  const filtroAnimal = document.getElementById("filtro-animal");
	  const resultadoNaoEncontrado = document.getElementById("resultado-nao-encontrado");

	  // Função para reverter a pesquisa
	  function desfazerPesquisa() {
	    inputPesquisa.value = "";
	    for (let i = 1; i < linhas.length; i++) {
	      linhas[i].style.display = "";
	    }
	    resultadoNaoEncontrado.style.display = "none";
	  }

	  pesquisarButton.addEventListener("click", function () {
	    const termoPesquisa = inputPesquisa.value.toLowerCase(); // Converter o termo de pesquisa em minúsculas
	    const filtroSelecionado = filtroDono.checked ? "dono" : "animal";
	    let resultadosEncontrados = 0;

	    for (let i = 1; i < linhas.length; i++) {
	      const donoCelula = linhas[i].getElementsByTagName("td")[1];
	      const animalNomeCelula = linhas[i].getElementsByTagName("td")[2];

	      if (filtroSelecionado === "dono" && donoCelula) {
	        const donoTexto = donoCelula.textContent.toLowerCase(); // Converter o texto da célula em minúsculas
	        if (donoTexto.includes(termoPesquisa)) {
	          linhas[i].style.display = "";
	          resultadosEncontrados++;
	        } else {
	          linhas[i].style.display = "none";
	        }
	      } else if (filtroSelecionado === "animal" && animalNomeCelula) {
	        const animalNomeTexto = animalNomeCelula.textContent.toLowerCase(); // Converter o texto da célula em minúsculas
	        if (animalNomeTexto.includes(termoPesquisa)) {
	          linhas[i].style.display = "";
	          resultadosEncontrados++;
	        } else {
	          linhas[i].style.display = "none";
	        }
	      }
	    }

	    if (resultadosEncontrados === 0) {
	      resultadoNaoEncontrado.style.display = "block";
	    } else {
	      resultadoNaoEncontrado.style.display = "none";
	    }
	  });

	  desfazerButton.addEventListener("click", function () {
	    desfazerPesquisa();
	  });

	  filtroDono.addEventListener("change", function () {
	    pesquisarButton.click();
	  });

	  filtroAnimal.addEventListener("change", function () {
	    pesquisarButton.click();
	  });
	});


























var retorna = new URLSearchParams(window.location.search);
var elemento = retorna.get('conf');

switch (elemento) {
case 'deletado':
setTimeout(function() {
alert('Animal deletado!');
}, 100);
break;

case 'alterado':
setTimeout(function() {
alert('Animal alterado!');
}, 100);
break;

case 'erro_cadastra_animal':
setTimeout(function() {
alert('O animal não pode ser cadastrado por algum motivo por parte do servidor!');
}, 100);
break;
}













</script>


</body>
</html>
