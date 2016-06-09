function [pot_borda_obj_estudo, quantidade_de_nos] = cria_trilha_ideal(codigo_imagem, numero_eletrodos, val_cond_min, val_cond_max)

%Esta função recebe
%->codigo_imagem = Código com parâmetros do EIDORS relativos a densidade e 
%refinamento da malha; 
%->numero_eletrodos = Número de eletrodos da malha do EIDORS;
%->val_cond_min = valor da condutividade mínima que será utilizada no objeto de estudo
%->val_cond_max = valor da condutividade máxima que será utilizada no objeto de estudo

%Esta função retorna
%->pot_borda_obj_estudo = vetor com os potenciais de borda do objeto de
%estudo. Este vetor será o objeto de comparação para a função objetivo
%->quantidade_de_nos = largura dos vetores candidatos à solução

% Criando imagem modelo (Este objeto só precisa ser criando quando é
% necessário resolver o problema direto)
imdl_2d = mk_common_model(codigo_imagem, numero_eletrodos);  
img_22 = mk_image(imdl_2d.fwd_model,1);

%Pega a largura dos vetores candidatos à solução
quantidade_de_nos = length(img_22.elem_data);

%Coloca a condutividade máxima em todos os elementos da grade
for i = 1:length(img_22.elem_data)
    img_22.elem_data(i) = val_cond_max;
end

%Este bloco de código ativa a escolh manual do elementos na grade
% figure; show_fem(img_22,[1,1,1]); axis off 
% pause(3) 
% n_elem1 = inputdlg('Número de elementos do objeto:','IMPORTANTE!');
% n_elem = str2double(n_elem1); 
% for j = 1:n_elem
%      pause(1)
%      n1 = inputdlg(strcat('Número do Elemento',num2str(j),':'),'IMPORTANTE!');
%      n = str2double(n1);
%      img_22.elem_data(n) = val_cond;
% end

%Este bloco de código posiciona um objeto no centro da malha;
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

%Este bloco de código posiciona um objeto na borda da malha;
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

%Este bloco de código posiciona um objeto entre o centro e a borda da malha;
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

% Resolvendo o problema direto para o objeto de estudo atraves da função
% fwd_solve do EIDORS. Esta função recece uma distribuição de potenciais 
% e retorna um vetor com uma aproximação dos valores dos potenciais externos
% para esta distribuição de condutividade interna.
pot_borda_obj_estudo = fwd_solve(img_22);


% Mostrando objeto de estudo com distribuição de condutividade elétrica
% fixada acima
figure
show_fem(img_22,[1,1]); axis off

% Salvando o objeto de estudo na pasta raiz do código
saveas(gcf,'objeto_de_estudo.bmp');
        
end