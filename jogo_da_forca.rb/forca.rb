def da_boas_vindas
  puts "Bem Vindo ao Jogo da Forca!"
  puts "Qual é o seu nome ?"
  nome = gets.strip
  puts "\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def escolhe_palavra_secreta
  puts "Escolhendo palavra secreta"
  palavra_secreta = "programador"
  puts "Palavra Secreta com #{palavra_secreta.size} letras escolhida, boa sorte!"
  palavra_secreta
end

def nao_quer_jogar
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quer_jogar = quero_jogar.upcase == "N"
end

def pede_um_chute(chutes, erros)
  puts "\n"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip
  puts "Será que acertou ? Você chutou #{chute}"
  chute
end

def joga(nome, palavra_secreta)
  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    chute = pede_um_chute chutes, erros
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
    else
      acertou = chute == palavra_secreta
        if acertou
          puts "Parabéns, você ganhou!"
          pontos_ate_agora += 100
          break
        else
          puts "Que pena, errou"
          pontos_ate_agora -= 30
          erros += 1
        end
      end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos"
end


nome = da_boas_vindas
palavra_secreta = escolhe_palavra_secreta

loop do
  joga nome, palavra_secreta
  break if nao_quer_jogar
end
