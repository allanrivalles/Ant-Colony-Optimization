function [result] = range(a, b)

%Esta função recebe
%a & b-> doi parâmetros numéricos;

%Esta função retorna
%result-> número aleatório dentro do intervalo [a,b];

    result = a+(b-a)*rand(1);

end