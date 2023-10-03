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
      int id_User = Integer.parseInt(request.getParameter("idDesejado"));
      int id_animal = Integer.parseInt(request.getParameter("id_animal_hidden"));
      
      AnimalClienteDAO animalClienteDAO = new AnimalClienteDAO();
      boolean sucesso = animalClienteDAO.DeletarAnimalCliente(id_animal);
      
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
        response.sendRedirect("Pagina_animal.jsp?conf=erro_deleta");
      }
    %>
    </body>
    
    
 
    
    
  
  
</html>
   