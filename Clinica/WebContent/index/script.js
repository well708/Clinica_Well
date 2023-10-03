// abrir menu Hambúrguer

function toggleMenu() {
  const menuList = document.querySelector('.menu-list');
  menuList.classList.toggle('show'); 
}

// open modal de logar
    function openModalEntrar() {
      document.getElementById("entrar").style.display = "block";
    }
    
    // open modal de register 
    function openModalCadastrar() {
      document.getElementById("cadastrar").style.display = "block";
    }
    
    // close modal
    function closeModal_entrar() {
      document.getElementById("entrar").style.display = "none";
     
    }
    function closeModal_cadastrar() {

      document.getElementById("cadastrar").style.display = "none";
    }
    
    // Mostrar ou ocultar a password
    function exibirSenhaEntrar() {
      var exibir = document.getElementById("mostrar_senha_entrar");
      var passwordInput = document.getElementById("senha_entrar");
    
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        exibir.textContent = '🔓';
      } else {
        passwordInput.type = 'password';
        exibir.textContent = '🔒';
      }
    }
    
    function exibirSenhaCadastro() {
      var exibir = document.getElementById("mostrar_senha_cadastrar");
      var passwordInput = document.getElementById("senha_cadastrar");
    
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        exibir.textContent = '🔓';
      } else {
        passwordInput.type = 'password';
        exibir.textContent = '🔒';
      }
    }    
    
    //repostas das páginas jsp
     var retorna = new URLSearchParams(window.location.search);
var elemento = retorna.get('conf');

switch (elemento) {
  case 'existe':
    setTimeout(function() {
      alert('Usuária já existente!');
    }, 100);
    break;

  case 'cadastra':
    setTimeout(function() {
      alert('Usuário cadastrado!');
    }, 100);
    break;

  case 'error':
    setTimeout(function() {
      alert('Usuário ou senha incorreto!');
    }, 100);
    break;
    
  case 'deleta':
    setTimeout(function() {
        alert('Usuário deletado!');
      }, 100);
      break;
  }
  
  
  
  
  
   