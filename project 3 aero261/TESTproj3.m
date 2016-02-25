clear, clc
% Jeffery Schons project 3 aero 261 TEST
tic

%read in the alpha, Cl
%alpha = x
%Cl = y
table=dlmread('alphavscl.txt',' ');
alphagiven=table(:,1);
Clgiven=table(:,2);


for angle=alphagiven(1)+1:alphagiven(7)+1
    alpha=angle-1;
    alphatable(angle)=alpha;
    if angle<alphagiven(2)+2
        [y] = Linear_region(alpha,alphagiven(1),alphagiven(2),Clgiven(1),Clgiven(2));
        Cl(angle)=y;
    elseif angle<alphagiven(4)+2
        [y,A,B,C] = quadratic_region(alpha,alphagiven(2),alphagiven(3),alphagiven(4),Clgiven(2),Clgiven(3),Clgiven(4));
        Cl(angle)=y;
        Atab(angle)=A;
        Btab(angle)=B;
        Ctab(angle)=C;
    elseif angle<alphagiven(6)+1
        [y,A,B,C] = quadratic_region(alpha,alphagiven(4),alphagiven(5),alphagiven(6),Clgiven(4),Clgiven(5),Clgiven(6));
        Cl(angle)=y;
        Atab(angle)=A;
        Btab(angle)=B;
        Ctab(angle)=C;
    else
        [y]= Linear_region(alpha,alphagiven(6),alphagiven(7),Clgiven(6),Clgiven(7));
        Cl(angle)=y;
    end
end

disp(Atab)
disp(Btab)
disp(Ctab)
%disp(alphagiven)
%disp(Clgiven)

figure(1)
plot(alphatable, Cl)
title('alpha vs Cl')
xlabel('alpha')
ylabel('Cl')
toc