%% EXAMPLES
modelName='expou';

switch lower(modelName)
    %% Heston model
    case 'heston'
        % Setting model parameters
        Lambda=3;
        Theta=0.04;
        Epsilon=0.5;
        Y0=0.035;
        % Drift
        Mu=@(y) Lambda*(Theta-y);
        % Diffusion
        Eta=@(y) Epsilon*sqrt(y);
        % Function Phi
        Tau=30/365;
        a=(1-exp(-Lambda*Tau))/(Lambda*Tau);
        b=Theta*(1-a);
        Phi=@(y) sqrt(a*y+b);
        % Setting maturity and strikes
        T=1/48;
        K=.13:.01:.25;
        % Computing approximate implied volatilities
        Sigma2=viximpv(Mu,Eta,Phi,Y0,K,T,2);
        Sigma3=viximpv(Mu,Eta,Phi,Y0,K,T,3);
        Sigma4=viximpv(Mu,Eta,Phi,Y0,K,T,4);
        % Plotting
        plot(K,[Sigma2; Sigma3; Sigma4],'LineWidth',2);
        axis tight;
        grid on;
    %% Mean-reverting CEV model
    case 'mrcev'
        % Setting model parameters
        Lambda=3;
        Theta=0.04;
        Epsilon=1.5;
        Delta=1;
        Y0=0.035;
        % Drift
        Mu=@(y) Lambda*(Theta-y);
        % Diffusion
        Eta=@(y) Epsilon*(y.^Delta);
        % Phi
        Tau=30/365;
        a=(1-exp(-Lambda*Tau))/(Lambda*Tau);
        b=Theta*(1-a);
        Phi=@(y) sqrt(a*y+b);
        % Setting maturity and strikes
        T=1/48;
        K=.13:.01:.25;
        % Computing approximate implied volatilities
        Sigma2=viximpv(Mu,Eta,Phi,Y0,K,T,2);
        Sigma3=viximpv(Mu,Eta,Phi,Y0,K,T,3);
        Sigma4=viximpv(Mu,Eta,Phi,Y0,K,T,4);
        % Plotting
        plot(K,[Sigma2; Sigma3; Sigma4],'LineWidth',2);
        axis tight;
        grid on;
    %% Exp-OU model    
    case 'expou'
        % Setting model parameters
        Lambda=10;
        Theta=0.02;
        Epsilon=3.5;
        Y0=-3.3;
        % Drift
        Mu=@(y) Lambda*(log(Theta)-y);
        % Diffusion
        Eta=@(y) Epsilon;
        % Phi
        syms x y;
        Tau=30/365;
        g=exp(exp(-Lambda*x).*y+log(Theta)*(1-exp(-Lambda*x))+Epsilon^2/(4*Lambda)*(1-exp(-2*Lambda*x)));
        Phi=(1/sqrt(Tau))*sqrt(int(g,x,0,Tau));
        % Setting maturity and strikes
        T=1/48;
        K=.13:.01:.25;
        % Computing approximate implied volatilities
        Sigma2=viximpv(Mu,Eta,Phi,Y0,K,T,2);
        Sigma3=viximpv(Mu,Eta,Phi,Y0,K,T,3);
        Sigma4=viximpv(Mu,Eta,Phi,Y0,K,T,4);
        % Plotting
        plot(K,[Sigma2; Sigma3; Sigma4],'LineWidth',2);
        axis tight;
        grid on;
    otherwise
        error('Model not recognized.');
end

