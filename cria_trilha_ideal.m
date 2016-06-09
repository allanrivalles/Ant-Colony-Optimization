function [pot_borda_obj_estudo, quantidade_de_nos] = cria_trilha_ideal(codigo_imagem, numero_eletrodos, val_cond_min, val_cond_max)

%Esta fun��o recebe
%->codigo_imagem = C�digo com par�metros do EIDORS relativos a densidade e 
%refinamento da malha; 
%->numero_eletrodos = N�mero de eletrodos da malha do EIDORS;
%->val_cond_min = valor da condutividade m�nima que ser� utilizada no objeto de estudo
%->val_cond_max = valor da condutividade m�xima que ser� utilizada no objeto de estudo

%Esta fun��o retorna
%->pot_borda_obj_estudo = vetor com os potenciais de borda do objeto de
%estudo. Este vetor ser� o objeto de compara��o para a fun��o objetivo
%->quantidade_de_nos = largura dos vetores candidatos � solu��o

% Criando imagem modelo (Este objeto s� precisa ser criando quando �
% necess�rio resolver o problema direto)
imdl_2d = mk_common_model(codigo_imagem, numero_eletrodos);  
img_22 = mk_image(imdl_2d.fwd_model,1);

%Pega a largura dos vetores candidatos � solu��o
quantidade_de_nos = length(img_22.elem_data);

%Coloca a condutividade m�xima em todos os elementos da grade
for i = 1:length(img_22.elem_data)
    img_22.elem_data(i) = val_cond_max;
end

%Este bloco de c�digo ativa a escolh manual do elementos na grade
% figure; show_fem(img_22,[1,1,1]); axis off 
% pause(3) 
% n_elem1 = inputdlg('N�mero de elementos do objeto:','IMPORTANTE!');
% n_elem = str2double(n_elem1); 
% for j = 1:n_elem
%      pause(1)
%      n1 = inputdlg(strcat('N�mero do Elemento',num2str(j),':'),'IMPORTANTE!');
%      n = str2double(n1);
%      img_22.elem_data(n) = val_cond;
% end

%Este bloco de c�digo posiciona um objeto no centro da malha;
img_22.elem_data(92) = val_cond_min;
img_22.elem_data(91) = val_cond_min;
img_22.elem_data(90) = val_cond_min;
img_22.elem_data(263) = val_cond_min;
img_22.elem_data(265) = val_cond_min;
img_22.elem_data(264) = val_cond_min;
img_22.elem_data(89) = val_cond_min;
img_22.elem_data(24) = val_cond_min;
img_22.elem_data(264) = val_cond_min;
img_22.elem_data(100) = val_cond_min;
img_22.elem_data(248) = val_cond_min;
img_22.elem_data(99) = val_cond_min;
img_22.elem_data(364) = val_cond_min;

%Este bloco de c�digo posiciona um objeto na borda da malha;
% img_22.elem_data(219) = val_cond_min;
% img_22.elem_data(218) = val_cond_min;
% img_22.elem_data(322) = val_cond_min;
% img_22.elem_data(323) = val_cond_min;
% img_22.elem_data(324) = val_cond_min;
% img_22.elem_data(326) = val_cond_min;
% img_22.elem_data(327) = val_cond_min;
% img_22.elem_data(400) = val_cond_min;
% img_22.elem_data(399) = val_cond_min;
% img_22.elem_data(401) = val_cond_min;
% img_22.elem_data(325) = val_cond_min;
% img_22.elem_data(328) = val_cond_min;
% img_22.elem_data(329) = val_cond_min;
% img_22.elem_data(330) = val_cond_min;
% img_22.elem_data(404) = val_cond_min;
% img_22.elem_data(403) = val_cond_min;
% img_22.elem_data(402) = val_cond_min;
% img_22.elem_data(145) = val_cond_min;
% img_22.elem_data(35) = val_cond_min;
% img_22.elem_data(17) = val_cond_min;
% img_22.elem_data(213) = val_cond_min;

%Este bloco de c�digo posiciona um objeto entre o centro e a borda da malha;
% img_22.elem_data(23) = val_cond_min;
% img_22.elem_data(132) = val_cond_min;
% img_22.elem_data(24) = val_cond_min;
% img_22.elem_data(248) = val_cond_min;
% img_22.elem_data(249) = val_cond_min;
% img_22.elem_data(105) = val_cond_min;
% img_22.elem_data(103) = val_cond_min;
% img_22.elem_data(104) = val_cond_min;
% img_22.elem_data(349) = val_cond_min;
% img_22.elem_data(104) = val_cond_min;
% img_22.elem_data(106) = val_cond_min;
% img_22.elem_data(251) = val_cond_min;
% img_22.elem_data(252) = val_cond_min;
% img_22.elem_data(253) = val_cond_min;
% img_22.elem_data(250) = val_cond_min;
% img_22.elem_data(99) = val_cond_min;
% img_22.elem_data(342) = val_cond_min;
% img_22.elem_data(253) = val_cond_min;
% img_22.elem_data(252) = val_cond_min;
% img_22.elem_data(101) = val_cond_min;
% img_22.elem_data(102) = val_cond_min;
% img_22.elem_data(229) = val_cond_min;
% img_22.elem_data(334) = val_cond_min;
% img_22.elem_data(230) = val_cond_min;
% img_22.elem_data(231) = val_cond_min;

% Resolvendo o problema direto para o objeto de estudo atraves da fun��o
% fwd_solve do EIDORS. Esta fun��o recece uma distribui��o de potenciais 
% e retorna um vetor com uma aproxima��o dos valores dos potenciais externos
% para esta distribui��o de condutividade interna.
pot_borda_obj_estudo = fwd_solve(img_22);


% Mostrando objeto de estudo com distribui��o de condutividade el�trica
% fixada acima
figure
show_fem(img_22,[1,1]); axis off

% Salvando o objeto de estudo na pasta raiz do c�digo
saveas(gcf,'objeto_de_estudo.bmp');
        
end