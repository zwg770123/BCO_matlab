function [BestPos,BestFit,HisBestFit]=BCO(FunInd,MaxIt,PopSize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%     Bezier Curve-based Optimization (BCO)       %%
% FunInd: Index of function                         %
% MaxIt: Maximum number of iterations               %
% PopSize: Size of population                       %
% PopPos: Position of individual population         %
% PopFit: Fitness of individual population          %
% Dim: Dimensionality of problem                    %
% BestPos: Best solution found so far               %
% BestFit: Best fitness corresponding to BestX      %
% HisBestFit: History best fitness over iterations  %
% Low: Low bound of search space                    %
% Up: Up bound of search space                      %
% A: Exploration-exploitation balance operator      %
% Alpha:The weight                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Low,Up,Dim]=FunRange(FunInd);
if length(Low)==1
    Low=Low*ones(1,Dim);
    Up=Up*ones(1,Dim);
end
PopPos=zeros(PopSize,Dim);
PopFit=zeros(PopSize,1);
for i=1:PopSize
    PopPos(i,:)=rand(1,Dim).*(Up-Low)+Low;
    PopFit(i)=BenFunctions(PopPos(i,:),FunInd,Dim);
end
HisBestFit=zeros(MaxIt,1);
[BestFit, idx]=min(PopFit);
BestPos=PopPos(idx,:);

for It=1:MaxIt
    Alpha0=1+80*It/MaxIt+0.02*(10*It/MaxIt)^3;
    A0=sin(pi/2*(1-It/MaxIt));
    for i=1:PopSize
        Alpha=1+(2*rand-1)/Alpha0;  %Eq.(10)
        A=(0.4+2*log(1/rand))*A0;  %Eq.(19)
        if A>1
            if rand>0.5
                j=i;
                k=i;
                while j==i
                    j=randi(PopSize);
                end
                r1=rand;
                if r1<0.8 % Eq. (17)
                    while k==i || k==j
                        k=randi(PopSize);
                    end
                    P3=mean(PopPos)+2*randn (1,Dim).*(PopPos(k,:)-PopPos(j,:));
                else
                    if r1>0.9
                        while k==i || k==j
                            k=randi(PopSize);
                        end
                        P3=PopPos(j,:)+2*randn*(PopPos(k,randi(Dim))-PopPos(j,:));
                    else
                        P3=PopPos(j,:)+2*randn*(Low+rand*(Up-Low));
                    end
                end
                P0=PopPos(i,:);
                P1=PopPos(j,:);
                P2=PopPos(k,:);
                NewPos=(1-Alpha)^3*P0 + 3*(1-Alpha)^2*Alpha*P1 +...
                    3*(1-Alpha)*Alpha^2*P2 + Alpha^3*P3; % Eq.(18)
            else
                j=i;
                while i==j
                    j=randi(PopSize);
                end
                P0=PopPos(i,:);
                P1=PopPos(j,:);
                if rand>0.5 % Eq.(15)
                    P2=PopPos(i,:)+randn*(BestPos-PopPos(j,:));
                else
                    P2=PopPos(i,:)+randn*(mean(PopPos)-PopPos(j,:));
                end
                NewPos=(1-Alpha)^2*P0 + 2*(1-Alpha)*Alpha*P1 + Alpha^2*P2; % Eq.(16)
            end
        else
            if  rand>0.5
                j=i;
                while i==j
                    j=randi(PopSize);
                end
                P0=PopPos(i,:);
                if rand<0.5  %Eq.(8)
                    P1=BestPos+(PopPos(j,:)-PopPos(i,:))/2;
                else
                    P1=BestPos-(PopPos(j,:)+PopPos(i,:))/2;
                end
                NewPos=(1-Alpha)*P0+Alpha*P1; %Eq.(9)
            else
                if rand>0.5
                    P0=PopPos(i,:);
                    if rand>0.5%Eq.(11)
                        P1=mean(PopPos)+randn*(PopPos(i,:)-mean(PopPos));
                    else
                        P1=mean(PopPos)+randn*mean(PopPos);
                    end
                    NewPos=(1-Alpha).*P0+Alpha.*P1; %Eq.(12)
                else
                    P0=PopPos(i,:);
                    for j=1:Dim
                        if rand>0.5 %Eq.(13)
                            k=i;
                            while i==k
                                k=randi(PopSize);
                            end
                            P1(j)=(1-Alpha)*PopPos(i,j)+Alpha*PopPos(k,j);
                        else
                            P1(j)=PopPos(i,j);
                        end
                    end
                    NewPos=(1-Alpha)*P0+Alpha*P1; %Eq.(14)
                end
            end
        end
        NewPos=SpaceBound(NewPos,Up,Low);
        NewFit=BenFunctions(NewPos,FunInd,Dim);
        if NewFit < PopFit(i)
            PopFit(i)=NewFit;
            PopPos(i,:)=NewPos;
            if PopFit(i)<BestFit
                BestPos=PopPos(i,:);
                BestFit=PopFit(i);
            end
        end
    end
    HisBestFit(It)=BestFit;
end
























































