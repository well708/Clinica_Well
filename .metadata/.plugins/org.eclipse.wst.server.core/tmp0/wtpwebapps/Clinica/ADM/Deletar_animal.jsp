<%@ page import="DAO.AnimalClienteDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Deletar Animal de Cliente</title>
  </head>
  <body>
    <%
      
      int id_animal = Integer.parseInt(request.getParameter("id_animal_hidden_excluir"));
      
      AnimalClienteDAO animalClienteDAO = new AnimalClienteDAO();
      boolean sucesso = animalClienteDAO.DeletarAnimalCliente(id_animal);
      
      if (sucesso) {
    	  response.sendRedirect("ADM_Lista.jsp?conf=deletado");

      } else {
        response.sendRedirect("Pagina_animal.jsp?conf=erro_deleta");
      }
    %>
    </body>
</html>
   