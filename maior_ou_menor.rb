def welcome
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    when 5
        maximo = 200
    else
      maximo = 200
      puts "Dificuldade inválida, escolhido (5) Impossível"
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    
    numero_secreto = rand(maximo) + 1
    
    puts 'Número escolhido, que tal adivinhar ele ?'
    numero_secreto
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"

    puts "Chutes até agora: #{chutes}"

    first_try = gets.strip
    
    puts "Você chutou #{first_try}"
    
    puts 'Será que acertou ??'

    first_try.to_i
end

def verifica_resultado(sorteia_numero_secreto, first_try)
    acertou = first_try == sorteia_numero_secreto(dificuldade)


  if acertou 
    ganhou
    return true
  end

  maior = sorteia_numero_secreto(dificuldade) > first_try
  if maior
    puts('Você errou, o número secreto é maior')
  else
    puts('Que pena, você errou, pra mais!')
  end 
  false
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

nome = welcome
dificuldade = pede_dificuldade


def joga(nome, dificuldade)
sorteia_numero_secreto(dificuldade)
pontos_ate_agora = 1000

limite_de_tentativas = 5
chutes = []
for tentativa in 1..limite_de_tentativas

    first_try = pede_um_numero(chutes, tentativa, limite_de_tentativas)
    chutes << first_try
    
    if nome == "Romulo"
    ganhou
      break
    end
    pontos_a_perder = (first_try - sorteia_numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder

    break if verifica_resultado(sorteia_numero_secreto, first_try)

end

puts("Você ganhou #{pontos_ate_agora} pontos!") 
end

loop do
    joga(nome, dificuldade)
    puts 'Deseja jogar novamente ? (S/N)'
    break if gets.strip.upcase == 'N'
end