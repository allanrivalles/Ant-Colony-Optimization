function [result] = range(a, b)

%Esta fun��o recebe
%a & b-> doi par�metros num�ricos;

%Esta fun��o retorna
%result-> n�mero aleat�rio dentro do intervalo [a,b];

    result = a+(b-a)*rand(1);

end