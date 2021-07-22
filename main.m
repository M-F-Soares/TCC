%%
close all
clear all
clc
%-------------ARDUINO-------------
PL1 = 15;
PL2 = 15;
PL3 = 15;
PL4 = 15;
run('NONE.m')
run('L4.m')
run('L3.m')
run('L3L4.m')
run('L2.m')
run('L2L4.m')
run('L2L3.m')
run('L2L3L4.m')
run('L1.m')
run('L1L4.m')
run('L1L3.m')
run('L1L3L4.m')
run('L1L2.m')
run('L1L2L4.m')
run('L1L2L3.m')
run('L1L2L3L4.m')
%-------------ARDUINO-------------
%%
M = [MC01;MC02;MC03;MC04;MC05;MC06;MC07;MC08;MC09;MC10;MC11;MC12;MC13;MC14;MC15;MC16];
for i=1:length(M(1,:))
    M(:,i) = (M(:,i)-min(M(:,i)))./(max(M(:,i))-min(M(:,i)));
    if any(isnan(M(:)))
        M(:,i) = 0;
    end
end

%%
for i=1:150
    C01(i,:) = [0; 0; 0; 0];
    C02(i,:) = [0; 0; 0; 1];
    C03(i,:) = [0; 0; 1; 0];
    C04(i,:) = [0; 0; 1; 1];
    C05(i,:) = [0; 1; 0; 0];
    C06(i,:) = [0; 1; 0; 1];
    C07(i,:) = [0; 1; 1; 0];
    C08(i,:) = [0; 1; 1; 1];
    C09(i,:) = [1; 0; 0; 0];
    C10(i,:) = [1; 0; 0; 1];
    C11(i,:) = [1; 0; 1; 0];
    C12(i,:) = [1; 0; 1; 1];
    C13(i,:) = [1; 1; 0; 0];
    C14(i,:) = [1; 1; 0; 1];
    C15(i,:) = [1; 1; 1; 0];
    C16(i,:) = [1; 1; 1; 1];
end
C = [C01;C02;C03;C04;C05;C06;C07;C08;C09;C10;C11;C12;C13;C14;C15;C16];

%% Cross Validation
Mv = M;
Mt = M;
Cv = C;
Ct = C;
r = randperm(2400,(2400*0.7))';
Ct = Ct(r,:)';
Cv = Cv(setdiff(linspace(1,2400,2400),r),:)';
Mt = Mt(r,:)';
Mv = Mv(setdiff(linspace(1,2400,2400),r),:)';

M = M';
C = C';

% nntool
%% LÂMPADAS DIFERENTES
% load MLP_OUTPUTS.mat

cont = 0;
for i=1:length(MLP2_outputs(1,:))
    for j=1:4
        if (MLP2_outputs(j,i)<0.5)
            MLP2_outputs(j,i) = 0;
        else
            MLP2_outputs(j,i) = 1;
        end
    end
    if (MLP2_outputs(:,i) == Cv(:,i))
        MLP2_outputs(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro2 = 100*(1-(cont/length(MLP2_outputs(1,:))))

cont = 0;
for i=1:length(MLP4_outputs(1,:))
    for j=1:4
        if (MLP4_outputs(j,i)<0.5)
            MLP4_outputs(j,i) = 0;
        else
            MLP4_outputs(j,i) = 1;
        end
    end
    if (MLP4_outputs(:,i) == Cv(:,i))
        MLP4_outputs(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro4 = 100*(1-(cont/length(MLP4_outputs(1,:))))

cont = 0;
for i=1:length(MLP8_outputs(1,:))
    for j=1:4
        if (MLP8_outputs(j,i)<0.5)
            MLP8_outputs(j,i) = 0;
        else
            MLP8_outputs(j,i) = 1;
        end
    end
    if (MLP8_outputs(:,i) == Cv(:,i))
        MLP8_outputs(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro8 = 100*(1-(cont/length(MLP8_outputs(1,:))))

%% LÂMPADAS IGUAIS
cont = 0;
for i=1:length(MLP2_outputs_2(1,:))
    for j=1:4
        if (MLP2_outputs_2(j,i)<0.5)
            MLP2_outputs_2(j,i) = 0;
        else
            MLP2_outputs_2(j,i) = 1;
        end
    end
    if (MLP2_outputs_2(:,i) == Cv(:,i))
        MLP2_outputs_2(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro2_2 = 100*(1-(cont/length(MLP2_outputs_2(1,:))))

cont = 0;
for i=1:length(MLP4_outputs_2(1,:))
    for j=1:4
        if (MLP4_outputs_2(j,i)<0.5)
            MLP4_outputs_2(j,i) = 0;
        else
            MLP4_outputs_2(j,i) = 1;
        end
    end
    if (MLP4_outputs_2(:,i) == Cv(:,i))
        MLP4_outputs_2(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro4_2 = 100*(1-(cont/length(MLP4_outputs_2(1,:))))

cont = 0;
for i=1:length(MLP8_outputs_2(1,:))
    for j=1:4
        if (MLP8_outputs_2(j,i)<0.5)
            MLP8_outputs_2(j,i) = 0;
        else
            MLP8_outputs_2(j,i) = 1;
        end
    end
    if (MLP8_outputs_2(:,i) == Cv(:,i))
        MLP8_outputs_2(:,i);
        Cv(:,i);
        cont = cont+1;
    end
end

txErro8_2 = 100*(1-(cont/length(MLP8_outputs_2(1,:))))