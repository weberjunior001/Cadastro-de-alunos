      $set sourceformat"free"

      *>Divisão de identificação do programa
       identification division.
       program-id. "exercicio3".
       author. "Anderson Weber Junior".
       installation. "PC".
       date-written. 28/07/2020.
       date-compiled. 28/07/2020.



      *>Divisão para configuração do ambiente
       environment division.
       configuration section.
           special-names. decimal-point is comma.

      *>-----Declaração dos recursos externos
       input-output section.
       file-control.

      *>Escolher um nome legal ai pro exercicio
           select arqAlunos assign to "arqAlunos.dat"
           organization is indexed
           access mode is dynamic
           lock mode is automatic
           record key is fd-codigo
           file status is ws-fs-arqAlunos.

       i-o-control.

      *>Declaração de variáveis
       data division.

      *>----Variaveis de arquivos
       file section.
       fd arqAlunos.
       01 fd-aluno.
          05 fd-codigo                             pic 9(03).
          05 fd-nome                               pic A(25).
          05 fd-endereco                           pic X(35).
          05 fd-mae                                pic A(25).
          05 fd-pai                                pic A(25).
          05 fd-tel                                pic X(15).
          05 fd-nota1                              pic 9(02)V99.
          05 fd-nota2                              pic 9(02)V99.
          05 fd-nota3                              pic 9(02)V99.
          05 fd-nota4                              pic 9(02)V99.


      *>----Variaveis de trabalho
       working-storage section.
       01 ws-aluno.
          05 ws-codigo                             pic 9(03).
          05 ws-nome                               pic A(25).
          05 ws-endereco                           pic X(35).
          05 ws-mae                                pic A(25).
          05 ws-pai                                pic A(25).
          05 ws-tel                                pic X(15).
          05 ws-nota1                              pic 9(02)V99.
          05 ws-nota2                              pic 9(02)V99.
          05 ws-nota3                              pic 9(02)V99.
          05 ws-nota4                              pic 9(02)V99.

       77  ws-fs-arqAlunos                         pic  9(02).
       77  ws-aux                                  pic  X(01).


       01 ws-tela-menu.
          05  ws-cadastro-aluno                    pic  x(01).
          05  ws-cadastro-nota                     pic  x(01).
          05  ws-consulta-indexada                 pic  x(01).
          05  ws-consulta-sequencial               pic  x(01).
          05  ws-alterar                           pic  x(01).
          05  ws-deletar                           pic  x(01).
          05  ws-sair                              pic  x(01).

       01 ws-msn.
          05 ws-msn-erro-ofsset                    pic 9(04).
          05 filler                                pic x(01) value "-".
          05 ws-msn-erro-cod                       pic 9(02).
          05 filler                                pic x(01) value space.
          05 ws-msn-erro-text                      pic x(42).

      *>----Variaveis para comunicação entre programas
       linkage section.


      *>----Declaração de tela
       screen section.
       01  tela-menu.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 02 col 01 value "                                Tela Principal                                   ".
           05 line 03 col 01 value "      MENU                                                                       ".
           05 line 04 col 01 value "        [ ]Cadastro de Alunos                                                    ".
           05 line 05 col 01 value "        [ ]Cadastro de Notas                                                     ".
           05 line 06 col 01 value "        [ ]Consulta Cadastro indexado                                            ".
           05 line 07 col 01 value "        [ ]Consulta Cadastro sequecial                                           ".
           05 line 08 col 01 value "        [ ]Alterar Cadastro                                                      ".
           05 line 09 col 01 value "        [ ]Deletar Cadastro                                                      ".


           05 sc-sair-menu               line 01  col 71 pic x(01)
           using ws-sair                 foreground-color 12.

           05 sc-cadastro-aluno          line 04  col 10 pic x(01)
           using ws-cadastro-aluno       foreground-color 15.

           05 sc-cadastro-nota           line 05  col 10 pic x(01)
           using ws-cadastro-nota        foreground-color 15.

           05 sc-consulta-indexada       line 06  col 10 pic x(01)
           using ws-consulta-indexada    foreground-color 15.

           05 sc-consulta-sequencial     line 07  col 10 pic x(01)
           using ws-consulta-sequencial  foreground-color 15.

           05 sc-alterar                 line 08  col 10 pic x(01)
           using ws-alterar              foreground-color 15.

           05 sc-deletar                 line 09  col 10 pic x(01)
           using ws-deletar              foreground-color 15.


       01  tela-cad-aluno.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair    ".
           05 line 02 col 01 value "                                Cadastro de Alunos                              ".
           05 line 03 col 01 value "      Codigo   :                                                                ".
           05 line 04 col 01 value "      Aluno    :                                                                ".
           05 line 05 col 01 value "      Endereco :                                                                ".
           05 line 06 col 01 value "      Mae      :                                                                ".
           05 line 07 col 01 value "      Pai      :                                                                ".
           05 line 08 col 01 value "      Telefone :                                                                ".


           05 sc-sair-cad-alu            line 01  col 71 pic X(01)
           using ws-sair                 foreground-color 12.

           05 sc-codigo-aluno            line 03  col 17 pic 9(03)
           using ws-codigo               foreground-color 15.

           05 sc-aluno-cad-alu           line 04  col 17 pic X(25)
           using ws-nome                 foreground-color 15.

           05 sc-endereco-cad-alu        line 05  col 17 pic X(35)
           using ws-endereco             foreground-color 15.

           05 sc-mae-cad-alu             line 06  col 17 pic X(25)
           using ws-mae                  foreground-color 15.

           05 sc-pai-cad-alu             line 07  col 17 pic X(25)
           using ws-pai                  foreground-color 15.

           05 sc-tel-cad-alu             line 08  col 17 pic X(15)
           using ws-tel                  foreground-color 15.


       01  tela-cad-notas.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair    ".
           05 line 02 col 01 value "                                Cadastro de Alunos                              ".
           05 line 03 col 01 value "      Codigo   :                                                                ".
           05 line 04 col 01 value "      Aluno    :                                                                ".
           05 line 05 col 01 value "      Endereco :                                                                ".
           05 line 06 col 01 value "      Mae      :                                                                ".
           05 line 07 col 01 value "      Pai      :                                                                ".
           05 line 08 col 01 value "      Telefone :                                                                ".
           05 line 09 col 01 value "      Nota 1   :                                                                ".
           05 line 10 col 01 value "      Nota 2   :                                                                ".
           05 line 11 col 01 value "      Nota 3   :                                                                ".
           05 line 12 col 01 value "      Nota 4   :                                                                ".


           05 sc-sair-cad-alu            line 01  col 71 pic X(01)
           using ws-sair                 foreground-color 12.

           05 sc-codigo-aluno            line 03  col 17 pic 9(03)
           using  ws-codigo               foreground-color 15.

           05 sc-aluno-cad-alu           line 04  col 17 pic X(25)
           from  ws-nome                 foreground-color 15.

           05 sc-endereco-cad-alu        line 05  col 17 pic X(35)
           from  ws-endereco             foreground-color 15.

           05 sc-mae-cad-alu             line 06  col 17 pic X(25)
           from  ws-mae                  foreground-color 15.

           05 sc-pai-cad-alu             line 07  col 17 pic X(25)
           from  ws-pai                  foreground-color 15.

           05 sc-tel-cad-alu             line 08  col 17 pic X(15)
           from  ws-tel                  foreground-color 15.

           05 sc-nota1                   line 09  col 17 pic 9(02)V99
           using ws-nota1                foreground-color 15.

           05 sc-nota2                   line 10  col 17 pic 9(02)V99
           using ws-nota2                foreground-color 15.

           05 sc-nota3                   line 11  col 17 pic 9(02)V99
           using ws-nota3                foreground-color 15.

           05 sc-nota4                   line 12  col 17 pic 9(02)V99
           using ws-nota4                foreground-color 15.

       01  tela-consulta-indexada.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 02 col 01 value "                                Consulta Cadastro                                ".
           05 line 03 col 01 value "      Cod       [                                           ]                    ".
           05 line 04 col 01 value "      Aluno     [                                           ]                    ".
           05 line 05 col 01 value "      Endereço  [                                           ]                    ".
           05 line 06 col 01 value "      Pai       [                                           ]                    ".
           05 line 07 col 01 value "      Mae       [                                           ]                    ".
           05 line 08 col 01 value "      Telefone  [                                           ]                    ".
           05 line 09 col 01 value "      Nota 1    [                                           ]                    ".
           05 line 10 col 01 value "      Nota 2    [                                           ]                    ".
           05 line 11 col 01 value "      Nota 3    [                                           ]                    ".
           05 line 12 col 01 value "      Nota 4    [                                           ]                    ".

           05 sc-sair-cad-alu            line 01  col 71 pic X(01)
           using ws-sair foreground-color 12.

           05 sc-codigo-aluno            line 03  col 20 pic X(03)
           using ws-codigo               foreground-color 15.

           05 sc-aluno-cad-alu           line 04  col 20 pic X(25)
           from ws-nome                 foreground-color 15.

           05 sc-endereco-cad-alu        line 05  col 20 pic X(35)
           from ws-endereco             foreground-color 15.

           05 sc-mae-cad-alu             line 06  col 20 pic X(25)
           from ws-mae                  foreground-color 15.

           05 sc-pai-cad-alu             line 07  col 20 pic X(25)
           from ws-pai                  foreground-color 15.

           05 sc-tel-cad-alu             line 08  col 20 pic X(15)
           from ws-tel                  foreground-color 15.

           05 sc-nota1                   line 09  col 20 pic X(04)
           from ws-nota1                foreground-color 15.

           05 sc-nota2                   line 10  col 20 pic X(04)
           from ws-nota2                foreground-color 15.

           05 sc-nota3                   line 11  col 20 pic X(04)
           from ws-nota3                foreground-color 15.

           05 sc-nota4                   line 12  col 20 pic X(04)
           from ws-nota4                foreground-color 15.


       01  tela-erro.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "                           Houve um erro com o programa                          ".
           05 line 12 col 01 value "              [__________________________________________________]               ".


           05 sc-msn-cad-alu             line 12  col 16 pic x(50)
           using ws-msn foreground-color 15.

       01  tela-realizado-sucesso.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 02 col 01 value "                                Realizado com sucesso                            ".
           05 line 12 col 01 value "              [__________________________________________________]               ".

           05 sc-sair-cad-alu            line 01  col 71 pic X(01)
           using ws-sair foreground-color 12.

           05 sc-msn-cad-alu             line 12  col 16 pic x(50)
           using ws-msn foreground-color 15.


       01  tela-alterar-cad.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair    ".
           05 line 02 col 01 value "                           Alterar cadastro de alunos                           ".
           05 line 03 col 01 value "      Codigo   :                                                                ".
           05 line 04 col 01 value "      Aluno    :                                                                ".
           05 line 05 col 01 value "      Endereco :                                                                ".
           05 line 06 col 01 value "      Mae      :                                                                ".
           05 line 07 col 01 value "      Pai      :                                                                ".
           05 line 08 col 01 value "      Telefone :                                                                ".
           05 line 09 col 01 value "      Nota 1   :                                                                ".
           05 line 10 col 01 value "      Nota 2   :                                                                ".
           05 line 11 col 01 value "      Nota 3   :                                                                ".
           05 line 12 col 01 value "      Nota 4   :                                                                ".


           05 sc-sair-cad-alu            line 01  col 71 pic X(01)
           using ws-sair                 foreground-color 12.

           05 sc-codigo-aluno            line 03  col 17 pic 9(03)
           using  ws-codigo              foreground-color 15.

           05 sc-aluno-cad-alu           line 04  col 17 pic X(25)
           using  ws-nome                foreground-color 15.

           05 sc-endereco-cad-alu        line 05  col 17 pic X(35)
           using  ws-endereco            foreground-color 15.

           05 sc-mae-cad-alu             line 06  col 17 pic X(25)
           using  ws-mae                 foreground-color 15.

           05 sc-pai-cad-alu             line 07  col 17 pic X(25)
           using  ws-pai                 foreground-color 15.

           05 sc-tel-cad-alu             line 08  col 17 pic X(15)
           using  ws-tel                 foreground-color 15.

           05 sc-nota1                   line 09  col 17 pic 9(02)V99
           using ws-nota1                foreground-color 15.

           05 sc-nota2                   line 10  col 17 pic 9(02)V99
           using ws-nota2                foreground-color 15.

           05 sc-nota3                   line 11  col 17 pic 9(02)V99
           using ws-nota3                foreground-color 15.

           05 sc-nota4                   line 12  col 17 pic 9(02)V99
           using ws-nota4                foreground-color 15.

      *>Declaração do corpo do programa
       procedure division.

           perform inicializa.
           perform processamento.
           perform finaliza.


      *>------------------------------------------------------------------------
      *>  Procedimentos de inicialização
      *>------------------------------------------------------------------------
       inicializa section.

           open i-o arqAlunos
           if ws-fs-arqAlunos  <> 00
           and ws-fs-arqAlunos <> 05 then

               move 1                                to ws-msn-erro-ofsset
               move ws-fs-arqAlunos                  to ws-msn-erro-cod
               move "Erro ao abrir arq. arqAlunos "  to ws-msn-erro-text
               perform finaliza-anormal
           end-if
           .
       inicializa-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Processamento principal
      *>------------------------------------------------------------------------
       processamento section.

           perform until ws-sair = "X"
                      or ws-sair = "x"

      *>        inicialização das variaveis  da tela
                move   space  to  ws-cadastro-aluno
                move   space  to  ws-cadastro-nota
                move   space  to  ws-consulta-indexada
                move   space  to  ws-consulta-sequencial
                move   space  to  ws-alterar
                move   space  to  ws-deletar
                move   space  to  ws-sair

                display tela-menu
                accept tela-menu

                if ws-cadastro-aluno = "X"
                or ws-cadastro-aluno = "x" then
                       perform cadastrar-aluno
                end-if

                if ws-cadastro-nota = "X"
                or ws-cadastro-nota = "x" then
                       perform cadastrar-notas
                end-if

                if ws-consulta-indexada = "X"
                or ws-consulta-indexada = "x" then
                       perform consultar-indexada
                end-if

                if ws-consulta-sequencial = "X"
                or ws-consulta-sequencial = "x" then
                       perform consultar-sequencial
                end-if

                if ws-alterar = "X"
                or ws-alterar = "x" then
                       perform alterar
                end-if

                if ws-deletar = "X"
                or ws-deletar = "x" then
                       perform deletar
                end-if

           end-perform
           .
       processamento-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  cadastro de aluno
      *>------------------------------------------------------------------------
       cadastrar-aluno section.

            perform until ws-sair = "V"
                       or ws-sair = "v"
      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               display tela-cad-aluno
               accept tela-cad-aluno

               move ws-aluno to fd-aluno
               write fd-aluno

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 2                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao cadastrar aluno "       to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

               move "Cadastro de aluno realizado com sucesso" to ws-msn

               display tela-realizado-sucesso
               accept tela-realizado-sucesso

            end-perform

           .
       cadastrar-aluno-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  consulta indexada
      *>------------------------------------------------------------------------
       consultar-indexada section.

            perform until ws-sair = "V"
                       or ws-sair = "v"
      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               display tela-consulta-indexada
               accept tela-consulta-indexada

               move ws-codigo to fd-codigo
               read arqAlunos

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 3                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao consultar indexado "    to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

               move fd-aluno to ws-aluno

               display tela-consulta-indexada
               accept tela-consulta-indexada

           end-perform
           .
       consultar-indexada-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Rotina de consulta de alunos sequecial
      *>------------------------------------------------------------------------
       consultar-sequencial section.

      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               display tela-consulta-indexada
               accept tela-consulta-indexada

               move ws-codigo to fd-codigo
               read arqAlunos

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 4                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao consultar sequencial"   to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

               move fd-aluno to ws-aluno

               display tela-consulta-indexada
               accept tela-consulta-indexada

            perform until ws-sair = "V" or ws-sair = "v"

               read arqAlunos next
               if  ws-fs-arqAlunos <> 0  then
                  if ws-fs-arqAlunos = 10 then
                      perform consultar-sequencial-prev
                  else
                      move 4                                   to ws-msn-erro-ofsset
                      move ws-fs-arqAlunos                     to ws-msn-erro-cod
                      move "Erro ao consultar sequencial"      to ws-msn-erro-text
                      perform finaliza-anormal
                  end-if
               end-if

               move  fd-aluno       to  ws-aluno

               display tela-consulta-indexada
               accept tela-consulta-indexada

           end-perform


           .
       consultar-sequencial-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Rotina de consulta de alunos sequencial ao contrario
      *>------------------------------------------------------------------------
       consultar-sequencial-prev section.

            perform until ws-sair = "V"
                       or ws-sair = "v"
      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               read arqAlunos previous
               if  ws-fs-arqAlunos <> 0  then
                  if ws-fs-arqAlunos = 10 then
                      perform consultar-sequencial
                  else
                      move 5                                   to ws-msn-erro-ofsset
                      move ws-fs-arqAlunos                     to ws-msn-erro-cod
                      move "Erro ao ler arq. arqAlunos "       to ws-msn-erro-text
                      perform finaliza-anormal
                  end-if
               end-if

               move  fd-aluno       to  ws-aluno

               display tela-consulta-indexada
               accept tela-consulta-indexada

           end-perform

           .
       consultar-temp-seq-prev-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Rotina de cadastrar notas
      *>------------------------------------------------------------------------
       cadastrar-notas section.

            perform until ws-sair = "V"
                       or ws-sair = "v"
      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               display tela-cad-notas
               accept tela-cad-notas

               move ws-codigo to fd-codigo
               read arqAlunos

               if  ws-fs-arqAlunos <> 0  then
                  if ws-fs-arqAlunos = 10 then
                      perform consultar-sequencial
                  else
                      move 6                                   to ws-msn-erro-ofsset
                      move ws-fs-arqAlunos                     to ws-msn-erro-cod
                      move "Erro ao cadastrar notas "          to ws-msn-erro-text
                      perform finaliza-anormal
                  end-if
               end-if

               move fd-aluno to ws-aluno

               display tela-cad-notas
               accept tela-cad-notas

               move ws-aluno to fd-aluno
               rewrite fd-aluno

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 6                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao cadastrar notas "       to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

               move "Cadastro de notas realizado com sucesso" to ws-msn

               display tela-realizado-sucesso
               accept tela-realizado-sucesso

            end-perform

           .
       cadastrar-notas-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  recadastro de aluno
      *>------------------------------------------------------------------------
       alterar section.

            perform until ws-sair = "V"
                       or ws-sair = "v"

      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

               display tela-alterar-cad
               accept tela-alterar-cad

               move ws-codigo to fd-codigo
               read arqAlunos

               if  ws-fs-arqAlunos <> 0  then
                  if ws-fs-arqAlunos = 10 then
                      perform consultar-sequencial
                  else
                      move 7                                   to ws-msn-erro-ofsset
                      move ws-fs-arqAlunos                     to ws-msn-erro-cod
                      move "Erro ao alterar cadastro"          to ws-msn-erro-text
                      perform finaliza-anormal
                  end-if
               end-if

               move fd-aluno to ws-aluno

               display tela-alterar-cad
               accept tela-alterar-cad

               move ws-aluno to fd-aluno
               rewrite fd-aluno

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 7                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao alterar cadastro"       to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

            end-perform
           .
       alterar-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Rotina de apagamento / Delete
      *>------------------------------------------------------------------------
       deletar section.

      *>        inicialização das variaveis  da tela
                move   space  to  ws-nome
                move   space  to  ws-endereco
                move   space  to  ws-mae
                move   space  to  ws-pai
                move   space  to  ws-tel
                move   space  to  ws-sair
                move   0      to  ws-codigo
                move   0      to  ws-nota1
                move   0      to  ws-nota2
                move   0      to  ws-nota3
                move   0      to  ws-nota4

      *> -------------  Apagar dados do registro do arquivo
               display tela-consulta-indexada
               accept tela-consulta-indexada

               move ws-codigo to fd-codigo
               read arqAlunos

               if ws-fs-arqAlunos  <> 00
               and ws-fs-arqAlunos <> 05 then

                   move 8                                to ws-msn-erro-ofsset
                   move ws-fs-arqAlunos                  to ws-msn-erro-cod
                   move "Erro ao consultar indexado "    to ws-msn-erro-text
                   perform finaliza-anormal
               end-if

               move fd-aluno to ws-aluno

               display tela-consulta-indexada
               accept tela-consulta-indexada

               delete arqAlunos
               if  ws-fs-arqAlunos = 0 then
                   move "Cadastro de aluno deletado com sucesso" to ws-msn

                   display tela-realizado-sucesso
                   accept tela-realizado-sucesso

               else
                   if ws-fs-arqAlunos = 23 then
                       display erase
                       display "Codigo informado invalido!"
                       accept ws-aux
                   else
                       move 8                                   to ws-msn-erro-ofsset
                       move ws-fs-arqAlunos                     to ws-msn-erro-cod
                       move "Erro ao apagar arq. arqAlunos "    to ws-msn-erro-text
                       perform finaliza-anormal
                   end-if
               end-if
           .
       deletar-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Finalização  Anormal
      *>------------------------------------------------------------------------
       finaliza-anormal section.
           display tela-erro
           accept tela-erro
           Stop run
           .
       finaliza-anormal-exit.
           exit.


      *>------------------------------------------------------------------------
      *>  Finalização
      *>------------------------------------------------------------------------
       finaliza section.

           close arqAlunos
           if ws-fs-arqAlunos <> 0 then
               move 9                                to ws-msn-erro-ofsset
               move ws-fs-arqAlunos                  to ws-msn-erro-cod
               move "Erro ao fechar arq. arqTemp "   to ws-msn-erro-text
               perform finaliza-anormal
           end-if
           Stop run
           .
       finaliza-exit.
           exit.
