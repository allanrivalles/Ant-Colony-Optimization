%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Algoritmo de Ant colony Optimization para Gerar imagens de%
%Tomografia por imped�ncia El�trica                        %         
%Aluno:                                                    %
%Orientador:                                               %
%Data de cria��o:                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicializa��o do EIDORS (Ferramenta espec�fica com fun��es da TIE)
run C://MATLAB/R2009a/bin/eidors-v3.7.1/eidors/startup.m;

%Simulando um objeto de estudo para se obter seus potenciais de borda e
%utilizar-los como potencial de borda procurado nas trilhas das formigas
[pot_borda_obj_estudo, quantidade_de_nos] = cria_trilha_ideal(parametros.codigo_imagem,...
    parametros.numero_eletrodos, parametros.val_cond_min, parametros.val_cond_max);

%Inicializa a matriz formigas bem como coloca um valor aleat�rio de
%condutividade no primeiro n� de cada uma delas;
[formigas] = inicializa_formigas(quantidade_de_nos, parametros.quantidade_de_formigas,...
    cond_min, cond_max);

%Loop das itera��es
for iteracao=1:parametros.numero_de_iteracoes
    
    %Loop de constru��o das trilhas das formigas
    for k=1:parametros.quantidade_de_formigas
        
        %Loop de repenchimento dos n�s
        for n=1:quantidade_de_nos
            
        end
        %Calcular o erro relativo para esta formiga
        %
    end
    
end