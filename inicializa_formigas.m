function [formigas] = inicializa_formigas(quantidade_de_nos, quantidade_de_formigas, cond_min, cond_max)

%Esta função recebe
%->quantidade_de_nos: dimensão de cada vetor trilha;
%->quantidade_de_formigas: quantidade inicial de formigas;
%->cond_min = Condutividade mínima de cada nó;
%->cond_max = Condutividade máxima de cada nó;

%Esta função retorna
%->formigas->matriz com todas as formigas contedo um valor aleatório de condutividade 
%no seu primeiro nó;

%inicia a matriz das formigas
formigas = zeros(quantidade_de_formigas, quantidade_de_nos);

%Preenche apenas o primeiro nó de cada trilha com uma condutividade alatória
for i=1:quantidade_de_nos
    formigas(1,i) = range(cond_min, cond_max);    
end

end