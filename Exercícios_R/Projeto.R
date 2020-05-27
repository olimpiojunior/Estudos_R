cadastro <- function()
{
  #Definindo as vari?veis
  Nomes <- as.character()
  P1 <- as.numeric()
  P2 <- as.numeric()
  P3 <- as.numeric()
  M?dia <- as.numeric()
  Situa??o <- as.character()
  
  #Criando o dataframe e mudando o tipo de Nome e Situa??o
  alunos <- data.frame(Nomes, P1, P2, P3, M?dia, Situa??o)
  alunos$Nomes <- as.character(alunos$Nomes)
  alunos$Situa??o <- as.character(alunos$Situa??o)
  
  #Printando as informa??es iniciais e come?ando o cadastro
  print('Esta fun??o realiza as seguintes atividades:')
  print('1 - Cadastro do aluno')
  print('2 - Recebe suas notas')
  print('3 - Mostra sua m?dia e diz se foi aprovado')
  print('Deseja cadastrar um aluno? SIM -> 1 N?O -> 0')
  op??o <- scan(nmax = 1)
  
  #Iniciando o loop de cadastro
  aux <- 1
  while (op??o==1) {
        
    print('Nome:')
    al <- scan(what = character(), nmax = 1)
    print('Nota 1:')
    p1 <- scan(nmax = 1)
    print('Nota 2')
    p2 <- scan(nmax = 1)
    print('Nota 3')
    p3 <- scan(nmax = 1)
  
    m <- mean(p1, p2, p3)
    
    #Printando as notas e m?dia
    cat('A nota da P1 foi:', p1, '\n')
    cat('A nota da P2 foi:', p2, '\n')
    cat('A nota da P3 foi:', p3, '\n')
    cat('A m?dia do aluno:', m, '\n')
    if(m >= 7)
    {
      situ <- 'APROVADO'
      print('O aluno foi APROVADO')
    }
    else(
      {
        situ <- 'REPROVADO'
        print('O aluno foi REPROVADO')
      }
    )
    #Salvando os dados cadastrados no dataframe
    alunos[aux,] <- c(al, p1, p2, p3, m, situ)
    aux <- aux + 1
    print('Cadastrar outro aluno? SIM -> 1 N?O -> 0')
    op??o <- scan(nmax = 1)
  }
  #Printando as informa??es do DB
  print('Obrigado!')
  print('Banco de Dados:')
  print(alunos)
}
