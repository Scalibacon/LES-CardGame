<%
	String dialog = (String) session.getAttribute("dialog");
	if(dialog != null){
		if(dialog.equals("nao_logou")){
%>
	<script>
		chamaErroAutenticacao("Usu�rio ou Senha incorreto", "N�o encontramos esses dados em nosso sistema :(", "Verifique se digitou tudo certinho e tente novamente");
	</script>
<%					
		} else if(dialog.equals("nao_registrou")){
%>
	<script>
		chamaErroAutenticacao("Erro ao Cadastrar", "N�o foi poss�vel te cadastrar com esses dados :(", "Verifique se digitou tudo certinho e tente novamente");
	</script>
<%			
		} else if(dialog.equals("sessao_expirou")){			
%>
	<script>
		chamaErroAutenticacao("Sua sess�o expirou", "Voc� ficou muito tempo ocioso e tivemos que te p�r pra fora :P", "Fa�a login novamente e volte pra a��o");
	</script>
<%	
		}
		session.removeAttribute("dialog");
	}
%>