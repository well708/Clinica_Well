/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2023-09-09 00:32:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import DAO.AnimalClienteDAO;
import DTO.Animal_UserDTO;
import DAO.UserDAO;
import DTO.UserDTO;
import java.util.ArrayList;

public final class testes_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("DTO.UserDTO");
    _jspx_imports_classes.add("DAO.AnimalClienteDAO");
    _jspx_imports_classes.add("DAO.UserDAO");
    _jspx_imports_classes.add("DTO.Animal_UserDTO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link href=\"..\">\r\n");
      out.write("<title>Tela de Listar Cliente</title>\r\n");
      out.write("<style>\r\n");
      out.write("/* Estilo Geral */\r\n");
      out.write("* {\r\n");
      out.write("  margin: 0;\r\n");
      out.write("  padding: 0;\r\n");
      out.write("  box-sizing: border-box;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("  min-height: 100vh;\r\n");
      out.write("  min-width: 100vw;\r\n");
      out.write("  display: flex;\r\n");
      out.write("  align-items: center;\r\n");
      out.write("  justify-content: center;\r\n");
      out.write("  background: linear-gradient(45deg, rgb(0, 0, 255), rgb(20, 20, 210), rgb(30, 30, 146), rgb(32, 32, 100));\r\n");
      out.write("  font-family: Arial, Helvetica, sans-serif;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("main.container {\r\n");
      out.write("  background: white;\r\n");
      out.write("  padding: 2rem;\r\n");
      out.write("  box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);\r\n");
      out.write("  border-radius: 8px;\r\n");
      out.write("  width: 90%;\r\n");
      out.write("  max-width: 1200px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("h1 {\r\n");
      out.write("  font-weight: 600;\r\n");
      out.write("  margin-bottom: 2rem;\r\n");
      out.write("  position: relative;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("h2::before {\r\n");
      out.write("  content: '';\r\n");
      out.write("  position: absolute;\r\n");
      out.write("  height: 4px;\r\n");
      out.write("  width: 25px;\r\n");
      out.write("  bottom: 3px;\r\n");
      out.write("  left: 2px;\r\n");
      out.write("  top: 24px;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  background: linear-gradient(45deg, rgb(0, 0, 255), rgb(20, 20, 210), rgb(30, 30, 146), rgb(32, 32, 100));\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("table {\r\n");
      out.write("  border-collapse: collapse;\r\n");
      out.write("  width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("th, td {\r\n");
      out.write("  padding: 1rem;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  border-bottom: 1px solid #ccc;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("th {\r\n");
      out.write("  background-color: lightgray;\r\n");
      out.write("  font-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".cadastrar-link {\r\n");
      out.write("  display: block;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  margin-top: 2rem;\r\n");
      out.write("}\r\n");
      out.write("#desfazer-button{\r\n");
      out.write("background: linear-gradient(45deg, rgb(255, 0, 0), rgb(210, 20, 20), rgb(146, 30, 30), rgb(100, 32, 32));\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  color: white;\r\n");
      out.write("  padding: 10px 20px;\r\n");
      out.write("  border: none;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("  font-size: 16px\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("#pesq-button{\r\n");
      out.write("	 background: linear-gradient(45deg, rgb(0, 0, 255), rgb(20, 20, 210), rgb(30, 30, 146), rgb(32, 32, 100));\r\n");
      out.write("  color: white;\r\n");
      out.write("  padding: 10px 20px;\r\n");
      out.write("  border: none;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("  font-size: 16px\r\n");
      out.write("}\r\n");
      out.write("#pesq-caixa{\r\n");
      out.write("	padding: 10px;\r\n");
      out.write("	border: 1px solid #ccc;\r\n");
      out.write("	border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("#pesq-div{\r\n");
      out.write("	margin-bottom: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#delet-button{\r\n");
      out.write("  display: inline-block;\r\n");
      out.write("  margin-top: 1rem;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  background-color: rgb(255, 0, 0);\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  padding: 0.5rem 1rem;\r\n");
      out.write("  border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("#alt-button{\r\n");
      out.write("  display: inline-block;\r\n");
      out.write("  margin-top: 1rem;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  background-color: rgb(153, 255, 0);\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  padding: 0.5rem 1rem;\r\n");
      out.write("  border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("#cadastrar-button {\r\n");
      out.write("  margin-left: 65%;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  background-color: #333;\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  padding: 0.5rem 1rem;\r\n");
      out.write("  border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<main class=\"container\">\r\n");
      out.write("  <h1>Lista de dono e animais</h1>\r\n");
      out.write("  \r\n");
      out.write("  <div id=\"pesq-div\">\r\n");
      out.write("    <input type=\"text\" id=\"pesq-caixa\" placeholder=\"Digite o nome do dono\">\r\n");
      out.write("    <button id=\"pesq-button\">Pesquisar</button>\r\n");
      out.write("    <button id=\"desfazer-button\">Desfazer</button> <!-- Botão de Desfazer -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <div id=\"filtro-div\">\r\n");
      out.write("    <input type=\"radio\" id=\"filtro-dono\" name=\"filtro\" value=\"dono\" checked>\r\n");
      out.write("    <label for=\"filtro-dono\">Pesquisar por Dono</label>\r\n");
      out.write("    <input type=\"radio\" id=\"filtro-animal\" name=\"filtro\" value=\"animal\">\r\n");
      out.write("    <label for=\"filtro-animal\">Pesquisar por Animal</label>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write(" ");

UserDAO userDAO = new UserDAO();
ArrayList<UserDTO> users = userDAO.ArrayListarUser();

AnimalClienteDAO animal = new AnimalClienteDAO();
ArrayList<Animal_UserDTO> dono = animal.ListarAnimaisClientes();
      out.write("\r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("      <table>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>Dono</th>\r\n");
      out.write("        <th>Nome animal</th> \r\n");
      out.write("        <th>Especie</th> \r\n");
      out.write("        <th>Raça</th>\r\n");
      out.write("        <th>Dt nascimento</th> \r\n");
      out.write("        <th>id do animal</th> \r\n");
      out.write("      </tr>\r\n");
      out.write("      ");
 
     String data = "";
      for (UserDTO user_dono : users) {
    	 int idDesejado = user_dono.getId_user();
      
      for (Animal_UserDTO user : dono) {
    	   if (user.getCliente().getId_user() == idDesejado) { 
    		   
      
      out.write("\r\n");
      out.write("      \r\n");
      out.write("      <tr>\r\n");
      out.write("        <td>");
      out.print( user_dono.getNome());
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( user.getNome_animal() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( user.getEspecie() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( user.getRaca());
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( user.getData_nascimento());
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( user.getId_animal());
      out.write("</td>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("      </tr>\r\n");
      out.write("      ");
 
    	  }
       }
      }
      
      out.write("\r\n");
      out.write("     \r\n");
      out.write("    </table>\r\n");
      out.write("    <table>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <tr>\r\n");
      out.write("    <td><div id=\"resultado-nao-encontrado\" style=\"display: none;\"><h1>Não encontrado</h1></div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    </table>\r\n");
      out.write("</main>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("document.addEventListener(\"DOMContentLoaded\", function () {\r\n");
      out.write("	  const inputPesquisa = document.getElementById(\"pesq-caixa\");\r\n");
      out.write("	  const pesquisarButton = document.getElementById(\"pesq-button\");\r\n");
      out.write("	  const desfazerButton = document.getElementById(\"desfazer-button\");\r\n");
      out.write("	  const tabela = document.querySelector(\"table\");\r\n");
      out.write("	  const linhas = tabela.getElementsByTagName(\"tr\");\r\n");
      out.write("	  const filtroDono = document.getElementById(\"filtro-dono\");\r\n");
      out.write("	  const filtroAnimal = document.getElementById(\"filtro-animal\");\r\n");
      out.write("	  const resultadoNaoEncontrado = document.getElementById(\"resultado-nao-encontrado\");\r\n");
      out.write("\r\n");
      out.write("	  // Função para reverter a pesquisa\r\n");
      out.write("	  function desfazerPesquisa() {\r\n");
      out.write("	    inputPesquisa.value = \"\";\r\n");
      out.write("	    for (let i = 1; i < linhas.length; i++) {\r\n");
      out.write("	      linhas[i].style.display = \"\";\r\n");
      out.write("	    }\r\n");
      out.write("	    resultadoNaoEncontrado.style.display = \"none\";\r\n");
      out.write("	  }\r\n");
      out.write("\r\n");
      out.write("	  pesquisarButton.addEventListener(\"click\", function () {\r\n");
      out.write("	    const termoPesquisa = inputPesquisa.value.toLowerCase(); // Converter o termo de pesquisa em minúsculas\r\n");
      out.write("	    const filtroSelecionado = filtroDono.checked ? \"dono\" : \"animal\";\r\n");
      out.write("	    let resultadosEncontrados = 0;\r\n");
      out.write("\r\n");
      out.write("	    for (let i = 1; i < linhas.length; i++) {\r\n");
      out.write("	      const donoCelula = linhas[i].getElementsByTagName(\"td\")[0];\r\n");
      out.write("	      const animalNomeCelula = linhas[i].getElementsByTagName(\"td\")[1];\r\n");
      out.write("\r\n");
      out.write("	      if (filtroSelecionado === \"dono\" && donoCelula) {\r\n");
      out.write("	        const donoTexto = donoCelula.textContent.toLowerCase(); // Converter o texto da célula em minúsculas\r\n");
      out.write("	        if (donoTexto.includes(termoPesquisa)) {\r\n");
      out.write("	          linhas[i].style.display = \"\";\r\n");
      out.write("	          resultadosEncontrados++;\r\n");
      out.write("	        } else {\r\n");
      out.write("	          linhas[i].style.display = \"none\";\r\n");
      out.write("	        }\r\n");
      out.write("	      } else if (filtroSelecionado === \"animal\" && animalNomeCelula) {\r\n");
      out.write("	        const animalNomeTexto = animalNomeCelula.textContent.toLowerCase(); // Converter o texto da célula em minúsculas\r\n");
      out.write("	        if (animalNomeTexto.includes(termoPesquisa)) {\r\n");
      out.write("	          linhas[i].style.display = \"\";\r\n");
      out.write("	          resultadosEncontrados++;\r\n");
      out.write("	        } else {\r\n");
      out.write("	          linhas[i].style.display = \"none\";\r\n");
      out.write("	        }\r\n");
      out.write("	      }\r\n");
      out.write("	    }\r\n");
      out.write("\r\n");
      out.write("	    if (resultadosEncontrados === 0) {\r\n");
      out.write("	      resultadoNaoEncontrado.style.display = \"block\";\r\n");
      out.write("	    } else {\r\n");
      out.write("	      resultadoNaoEncontrado.style.display = \"none\";\r\n");
      out.write("	    }\r\n");
      out.write("	  });\r\n");
      out.write("\r\n");
      out.write("	  desfazerButton.addEventListener(\"click\", function () {\r\n");
      out.write("	    desfazerPesquisa();\r\n");
      out.write("	  });\r\n");
      out.write("\r\n");
      out.write("	  filtroDono.addEventListener(\"change\", function () {\r\n");
      out.write("	    pesquisarButton.click();\r\n");
      out.write("	  });\r\n");
      out.write("\r\n");
      out.write("	  filtroAnimal.addEventListener(\"change\", function () {\r\n");
      out.write("	    pesquisarButton.click();\r\n");
      out.write("	  });\r\n");
      out.write("	});\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
