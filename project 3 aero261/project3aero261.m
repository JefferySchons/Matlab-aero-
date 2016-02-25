clear, clc
% Jeffery Schons project 3 aero 261
tic

%read in the alpha, Cl
%alpha = x
%Cl = y
table=dlmread('alphavscl.txt',' ');
alphagiven=table(:,1);
Clgiven=table(:,2);
%alpha1=alphagiven(1);
%alpha2=alphagiven(2);
%alpha3=alphagiven(3);
%alpha4=alphagiven(4);
%alpha5=alphagiven(5);
%alpha6=alphagiven(6);
%alpha7=alphagiven(7);
%Cl1=Clgiven(1);
%Cl2=Clgiven(2);
%Cl3=Clgiven(3);
%Cl4=Clgiven(4);
%Cl5=Clgiven(5);
%Cl6=Clgiven(6);
%Cl7=Clgiven(6);
%alpha  CL
%0       0
%8       0.8773
%15      1.1
%25      0.85
%37.5    1
%50      0.75
%90      0

for angle=alphagiven(1)+1:alphagiven(7)+1
    alpha=angle-1;
    alphatable(angle)=alpha;
    if angle<alphagiven(2)+2
        [y] = Linear_region(alpha,alphagiven(1),alphagiven(2),Clgiven(1),Clgiven(2));
        Cl(angle)=y;
    elseif angle<alphagiven(4)+2
        [y] = quadratic_region(alpha,alphagiven(2),alphagiven(3),alphagiven(4),Clgiven(2),Clgiven(3),Clgiven(4));
        Cl(angle)=y;
    elseif angle<alphagiven(6)+1
        [y] = quadratic_region(alpha,alphagiven(4),alphagiven(5),alphagiven(6),Clgiven(4),Clgiven(5),Clgiven(6));
        Cl(angle)=y;
    else
        [y]= Linear_region(alpha,alphagiven(6),alphagiven(7),Clgiven(6),Clgiven(7));
        Cl(angle)=y;
    end
end
%length(alphatable)
%length(Cl)
%disp(alphatable(16))
%disp(Cl(16))
alphaneg=-alphatable;
Clneg=-Cl;
Cltotal=[Clneg,Cl];
alphatotal=[alphaneg,alphatable];
figure(1)
plot(alphatotal, Cltotal)
title('alpha vs Cl')
xlabel('alpha')
ylabel('Cl')

toc