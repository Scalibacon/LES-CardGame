<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="favicon.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/criador-cartas-style.css">
<script type='text/javascript' src='js/jquery-3.4.1.min.js'></script>
<title>Criador de Cartas - Neverland Heroes</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div id="big-container">
		<div class="bem-na-dividida" id="card-container">
			<div id="card-base">
				<div id="card-name"></div>
				<div id="card-image">
					<div id="image-background"></div>
					<img src="" id="true-image">
				</div>
				<div id="card-text"></div>
				<div class="card-gem" id="card-hp"></div>
				<div class="card-gem" id="card-mana"></div>
				<div class="card-gem" id="card-attack"></div>
				<div class="card-gem" id="card-power"></div>
				<div class="card-gem" id="card-def"></div>
				<div class="card-gem" id="card-res"></div>				
				<div id="card-rank-container">
					<img src="img/creation/rank.png" class="card-rank">				
				</div>
				<div class="card-gem" id="card-cd"></div>
				<div id="card-afinidade"></div>
				<div id="card-pericia"><span id="card-pericia-number"></span></div>								
			</div>
		</div>
		
		
		<div class="bem-na-dividida" id="big-settings-container">
			<form action="addCardServlet" method="POST" id="form-cria-carta">
				<div class="container-settings">
					<span class="txt-auxiliar">ID:</span><input type="number" class="settings-input" id="id" name="id" readonly="readonly">
					<br>
					<span class="txt-auxiliar">Raridade:</span> <select name="raridade" class="combobox" id="raridade" onchange="atualizaBordaRaridade()">
						<option value="0" selected>Comum</option>
						<option value="1">Rara</option>
						<option value="2">Épica</option>
						<option value="3">Lendária</option>
					</select>
					<br>
					<span class="txt-auxiliar">Tipo:</span> <select name="tipo" class="combobox" id="tipo" onchange="atualizaSettingsValidos()">
						<option value="0">Consumível</option>
						<option value="1">Arma</option>
						<option value="2">Postura</option>
						<option value="3">Magia</option>
						<option value="4" selected>Herói</option>				
					</select>
					<br>
					<span class="txt-auxiliar">Nome:</span><input type="text" class="settings-input" name="nome" id="form-nome" onkeyup='atualizaTexto("form-nome", "card-name")'>
					<br>
					<span class="txt-auxiliar">Preço (V):</span><input type="number" class="settings-input" name="venda">
					<br>
					<span class="txt-auxiliar">Descrição:</span><textarea class="settings-area" name="descricao" id="form-descricao" onkeyup='atualizaTexto("form-descricao", "card-text")'></textarea>				
					<br>
					<input type="file" id="upload-imagem" name="imagem"/>
				</div>
				<div class="container-settings" id="container-inputs2">
					<span class="txt-auxiliar">Afinidade:</span> <select name="afinidade" class="combobox" id="afinidade" onchange="atualizaAfinidade()">
						<option value="0" selected>Neutro</option>
						<option value="1">Luz</option>
						<option value="2">Trevas</option>
						<option value="3">Fogo</option>
						<option value="4">Água</option>
						<option value="5">Terra</option>
						<option value="6">Vento</option>				
					</select>
					<br>
					<span class="txt-auxiliar">Rank:</span> <select name="rank" class="combobox" id="rank" onchange="atualizaRank()">
						<option value="1" selected>1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>				
					</select>
					<br>
					<span class="txt-auxiliar">HP:</span><input type="number" class="settings-input" name="hp" id="hp" onkeyup='atualizaTexto("hp", "card-hp")'>
					<br>
					<span class="txt-auxiliar" id="txt-mana">Mana:</span><input type="number" class="settings-input" name="mana" id="mana" onkeyup='atualizaTexto("mana", "card-mana")'>
					<br>
					<span class="txt-auxiliar">Força:</span><input type="number" class="settings-input" name="forca" id="ataque" onkeyup='atualizaTexto("ataque", "card-attack")'>
					<br>
					<span class="txt-auxiliar">Poder:</span><input type="number" class="settings-input" name="poder" id="poder" onkeyup='atualizaTexto("poder", "card-power")'>
					<br>
					<span class="txt-auxiliar">Defesa:</span><input type="number" class="settings-input" name="defesa" id="defesa" onkeyup='atualizaTexto("defesa", "card-def")'>
					<br>
					<span class="txt-auxiliar">Resist.:</span><input type="number" class="settings-input" name="resistencia" id="resistencia" onkeyup='atualizaTexto("resistencia", "card-res")'>
					<br>
					<span class="txt-auxiliar" id="txt-tipo-arma">Perícia:</span> <select name="pericia" class="combobox" id="pericia" onchange="atualizaArma()">
						<option value="0" selected>Espada</option>
						<option value="1">Lança</option>
						<option value="2">Machado</option>
						<option value="3">Adaga</option>
						<option value="4">Arco</option>	
						<option value="5">Escudo</option>	
						<option value="6">Livro</option>
						<option value="7">Cajado</option>					
					</select>
					<br>
					<span class="txt-auxiliar">Ganho P.:</span><input type="number" class="settings-input" name="ganho_pericia" id="ganho" onkeyup='atualizaTexto("ganho", "card-pericia-number")'>
					<br>
					<span class="txt-auxiliar">Recarga:</span><input type="number" class="settings-input" name="recarga" id="recarga" disabled onkeyup='atualizaTexto("recarga", "card-cd")'>
					<br>					
				</div>
				
				<div id="container-button"><input type="button" id="button-gravar" value="Gravar" onclick="adicionaCarta()"></div>			
			</form>
		</div>
	</div>
		
		<br>             	
		<output id="list"></output>        
         
	<script type="text/javascript" src="js/criador-cartas-scripts.js"></script>		
</body>
</html>