<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.AnimalClienteDAO" %>
<%@ page import="DTO.Animal_UserDTO" %>
<%@ page import="DTO.UserDTO" %>

<%
String nome_animal = request.getParameter("nome_animal");
String especie = request.getParameter("especie");
String raca = request.getParameter("raca");
String data_nascimento = request.getParameter("data_nascimento");
String id_cliente = request.getParameter("id_cliente"); // Você deve passar o ID do cliente associado ao animal

boolean result = false;

AnimalClienteDAO animalClienteDAO = new AnimalClienteDAO();

Animal_UserDTO novoAnimalCliente = new Animal_UserDTO();
novoAnimalCliente.setNome_animal(nome_animal);
novoAnimalCliente.setEspecie(especie);
novoAnimalCliente.setRaca(raca);
novoAnimalCliente.setData_nascimento(data_nascimento);

// Crie um objeto UserDTO com o ID do cliente
UserDTO cliente = new UserDTO();
cliente.setId_user(Integer.parseInt(id_cliente));
novoAnimalCliente.setCliente(cliente);

result = animalClienteDAO.InserirAnimalCliente(novoAnimalCliente);

if (result) {
   %>
   <form id="return_Form" action="Pagina_animal.jsp?" method="post">
      <input type="hidden" name="id_User" id="id_User" value="<%=id_cliente%>" />    
      <input type="submit" value="Enviar" />
    </form>
    
     <script>
     document.getElementById("return_Form").submit();
     </script>
     <%   
} else {
    // Ocorreu um erro durante o cadastro do animal do cliente
    response.sendRedirect("../alguma_pagina.jsp?conf=erro_cadastra_animal");
}
%>







     
