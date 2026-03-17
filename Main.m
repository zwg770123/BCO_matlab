
%%        Bezier Curve-based Optimization (BCO) for 23 functions          %%
%--------------------------------------------------------------------------%
% Bezier Curve-based Optimization (BCO)                                    %
% Source codes demo version 1.0                                            %
%--------------------------------------------------------------------------%
%--------------------------------------------------------------------------%                       
% The code is based on the following paper:                                %
% Zhao, W., Xie Y., Wang, L., Zhang. Z., Khodadadi, N., Mirjalili, S.      %
% (2026). An effective Bezier curve-based optimization (BCO) for           %
% large-scale numerical problems and 3D unmanned aerial vehicle path       % 
% planning with efficient multiple threats evasion, Advanced Engineering   %
% Informatics, 73, 104524. https://doi.org/10.1016/j.aei.2026.104524.      %
%--------------------------------------------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BestX:The best solution                   %
% BestFit:The best fitness                  %
% HisBestFit:History of the best fitness    %
% FunIndex:Index of functions               %
% MaxIteration: Maximum number of iterations%
% PopSize: Size of population               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        clc;
        clear;
        
        MaxIteration=500;
        PopSize=50;
        
        FunIndex=1;
        [BestX,BestFit,HisBestFit]=BCO(FunIndex,MaxIteration,PopSize);
        
        display(['The best fitness of F',num2str(FunIndex),' is: ', num2str(BestFit)]);
        
        
        if BestFit>0
            semilogy(HisBestFit,'r','LineWidth',2);
        else
            plot(HisBestFit,'r','LineWidth',2);
        end
        
        xlabel('Iterations');
        ylabel('Fitness');
        title(['F', num2str(FunIndex)]);





    
    

