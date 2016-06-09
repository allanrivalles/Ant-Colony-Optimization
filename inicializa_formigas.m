function [formigas] = inicializa_formigas(quantidade_de_nos, quantidade_de_formigas, cond_min, cond_max)

%Esta fun��o recebe
%->quantidade_de_nos: dimens�o de cada vetor trilha;
%->quantidade_de_formigas: quantidade inicial de formigas;
%->cond_min = Condutividade m�nima de cada n�;
%->cond_max = Condutividade m�xima de cada n�;

%Esta fun��o retorna
%->formigas->matriz com todas as formigas contedo um valor aleat�rio de condutividade 
%no seu primeiro n�;

%inicia a matriz das formigas
formigas = zeros(quantidade_de_formigas, quantidade_de_nos);

%Preenche apenas o primeiro n� de cada trilha com uma condutividade alat�ria
for i=1:quantidade_de_nos
    formigas(1,i) = range(cond_min, cond_max);    
end

end