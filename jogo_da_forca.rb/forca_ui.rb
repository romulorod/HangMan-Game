def da_boas_vindas
  puts "Bem Vindo ao Jogo da Forca!"
  puts "Qual é o seu nome ?"
  nome = gets.strip
  puts "\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def avisa_escolhendo_palavra_secreta palavra_secreta
    puts "Escolhendo palavra secreta"
    palavra_secreta.upcase
end

def avisa_palavra_escolhida
    puts "Palavra Secreta com #{palavra_secreta.size} letras escolhida, boa sorte!"
end
def nao_quer_jogar
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quer_jogar = quero_jogar.upcase == "N"
end

def cabecalho(chutes, erros, mascara)
  puts "\n"
  puts "Palavra Secreta: #{mascara.upcase}"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute()
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip
  puts "Será que acertou ? Você chutou #{chute}"
  chute.upcase
end

def avisa_chute_efetuado(chute)
  puts "Você já chutou essa letra/palavra."
end

def avisa_letra_nao_encontrada
  puts "Letra não encontrada"
end

def letra_encontrada_uma_vez(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vez"
end

def letra_encontrada_uma_vez(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vez"
end

def letra_encontrada_varias_vezes(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vezes"
end

def avisar_acertou_a_palavra
  puts "Parabéns, você ganhou!"
end

def avisa_errou_palavra
  puts "Que pena, errou"
end

def avisa_pontos(pontos_ate_agora)
  puts "Você ganhou #{pontos_ate_agora} pontos"
end
