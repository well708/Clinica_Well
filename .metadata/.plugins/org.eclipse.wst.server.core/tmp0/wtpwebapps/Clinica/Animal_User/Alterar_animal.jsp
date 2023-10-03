<%@page import="DTO.UserDTO"%>
<%@page import="DAO.AnimalClienteDAO"%>
<%@page import="DTO.Animal_UserDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Atualizar Animal</title>
</head>
<body>

<%
int id_User = Integer.parseInt(request.getParameter("idDesejado"));
int id_animal = Integer.parseInt(request.getParameter("id_animal_hidden_altera"));
String nome_alterar = request.getParameter("nome_altera");
String especie_alterar = request.getParameter("especie_animal_altera");
String raca_alterar = request.getParameter("raca_animal_altera");
String data_alterar = request.getParameter("data_nascimento_animal_altera");

// Crie um objeto Animal_UserDTO com os novos valores
Animal_UserDTO animalAtualizado = new Animal_UserDTO();
animalAtualizado.setId_animal(id_animal);
animalAtualizado.setNome_animal(nome_alterar);
animalAtualizado.setEspecie(especie_alterar);
animalAtualizado.setRaca(raca_alterar);
animalAtualizado.setData_nascimento(data_alterar);




//criar um objeto par armazenar o valro do id do usuario como cliente 
UserDTO cliente = new UserDTO();
cliente.setId_user(id_User);
animalAtualizado.setCliente(cliente);





// Atualize as informações do animal no banco de dados
AnimalClienteDAO animalClienteDAO = new AnimalClienteDAO();
boolean sucesso = animalClienteDAO.AtualizarAnimalCliente(animalAtualizado);

if (sucesso) {
	%>
	  <form id="return_Form" action="Pagina_animal.jsp?conf=deleta" method="post">
<input type="hidden" name="id_User" id="id_User" value="<%=id_User%>" />    
<input type="submit" value="Enviar" />
</form>

<script>
document.getElementById("return_Form").submit();
</script>
	  <%
} else {
	%>
	  <form id="return_Form" action="Pagina_animal.jsp?conf=erro" method="post">
<input type="hidden" name="id_User" id="id_User" value="<%=id_User%>" />    
<input type="submit" value="Enviar" />
</form>

<script>
document.getElementById("return_Form").submit();
</script>
	  <%
}
%>

</body>
</html>
