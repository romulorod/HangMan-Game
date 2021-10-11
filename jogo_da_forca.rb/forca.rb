require_relative "forca_ui"

def palavra_mascarada chutes, palavra_secreta
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara << letra
    else
      mascara << "_"
    end
  end
  mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho chutes, erros, mascara
  
  loop do
    chute = pede_um_chute
    if chutes.include? chute
      avisa_chute_efetuado chute
    else
      return chute
    end
  end
end

def joga(nome, palavra_secreta)
  erros = 0
  chutes = []
  pontos_ate_agora = 0
#   mascara = palavra_mascarada chutes, palavra_secreta
  while erros < 5
    mascara = palavra_mascarada chutes, palavra_secreta
    chute = pede_um_chute_valido chutes, erros, mascara
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      letra_procurada = chute[0]
      total_encontrado = palavra_secreta.count letra_procurada
      if total_encontrado == 0
        avisa_letra_nao_encontrada
        erros += 1
      elsif total_encontrado == 1
        letra_encontrada_uma_vez(total_encontrado)
      else
        letra_encontrada_varias_vezes(total_encontrado)
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        avisar_acertou_a_palavra
        pontos_ate_agora += 100
        break
      else
        avisa_errou_palavra
        pontos_ate_agora -= 30
        erros += 1
      end
    end
  end
  avisa_pontos pontos_ate_agora
end

def jogo_da_forca
  nome = da_boas_vindas
  palavra_secreta = escolhe_palavra_secreta
  loop do
    joga nome, palavra_secreta
    break if nao_quer_jogar
  end
end
