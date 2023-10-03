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

  case 'altera':
	setTimeout(function() {
		  alert('Usuário alterado!');
		  }, 100);
		  break;

  case 'cadastra':
    setTimeout(function() {
      alert('Usuário cadastrado!');
    }, 100);
    break;
      
  }
  


  //calendário

  let dataAtual = new Date();

      function exibirCalendario() {
          const mesAtual = dataAtual.getMonth();
          const anoAtual = dataAtual.getFullYear();

          const mesExibido = document.getElementById("mesExibido");
          mesExibido.textContent = new Date(anoAtual, mesAtual, 1).toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' });

          const calendario = document.getElementById("calendario");
          calendario.innerHTML = "";

          const primeiroDiaDoMes = new Date(anoAtual, mesAtual, 1).getDay();
          const ultimoDiaDoMes = new Date(anoAtual, mesAtual + 1, 0).getDate();

          const diasSemana = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

          // Cabeçalho do calendário (dias da semana)
          const headerRow = document.createElement("tr");
          for (let i = 0; i < 7; i++) {
              const th = document.createElement("th");
              th.textContent = diasSemana[i];
              headerRow.appendChild(th);
          }
          calendario.appendChild(headerRow);

          // Preenchendo os dias do mês
          let dia = 1;
          for (let i = 0; i < 6; i++) {
              const row = document.createElement("tr");
              for (let j = 0; j < 7; j++) {
                  const cell = document.createElement("td");
                  if (i === 0 && j < primeiroDiaDoMes) {
                      cell.textContent = "";
                  } else if (dia > ultimoDiaDoMes) {
                      cell.textContent = "";
                  } else {
                      cell.textContent = dia;
                      if (dia === dataAtual.getDate() && mesAtual === dataAtual.getMonth() && anoAtual === dataAtual.getFullYear()) {
                          cell.classList.add("hoje");
                      }
                      dia++;
                  }
                  row.appendChild(cell);
              }
              calendario.appendChild(row);
          }
      }

      function mesAnterior() {
          dataAtual.setMonth(dataAtual.getMonth() - 1);
          exibirCalendario();
      }

      function proximoMes() {
          dataAtual.setMonth(dataAtual.getMonth() + 1);
          exibirCalendario();
      }
    