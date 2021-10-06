def welcome
    
    puts 'Bem vindo ao Jogo de Advinhação!'
    
    puts 'Qual é o seu nome ?'

    nome = gets.strip
    
    puts "Começaremos o jogo para você, #{nome}"
end

def sorteia_numero_secreto
    puts 'Escolhendo um número secreto entre 0 e 200...'
    
    numero_secreto = 175
    
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
    acertou = first_try == sorteia_numero_secreto


  if acertou 
    puts('Parabéns, você acertou') 
    return true
  end

  maior = sorteia_numero_secreto > first_try
  if maior
    puts('Você errou, o número secreto é maior')
  else
    puts('Que pena, você errou, pra mais!')
  end 
  false
end

welcome
sorteia_numero_secreto

limite_de_tentativas = 5
chutes = []
for tentativa in 1..limite_de_tentativas

    first_try = pede_um_numero(chutes, tentativa, limite_de_tentativas)

    chutes << first_try

    break if verifica_resultado(sorteia_numero_secreto, first_try)

end