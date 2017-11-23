________________________________________________________________________________________________________________________________________
## Latest downloads

- [MATLAB Toolbox installer (recommended)](https://github.com/abarletta/rndfittool/releases/download/v17.10/RND.Fitting.Tool.v17.10.mlappinstall)
- [Zip archive containing all codes](https://github.com/abarletta/rndfittool/releases/download/v17.10/RND.Fitting.Tool.v17.10.zip)

________________________________________________________________________________________________________________________________________

<b>Current version</b> <br>
November 2017<br>
<b>Author</b> <br>
[Andrea Barletta](http://pure.au.dk/portal/en/persons/id(e161f76b-35b6-4903-b768-e8b172cbede5).html)<br>

________________________________________________________________________________________________________________________________________
## Getting Started

This toolbox computes approximate values of the Black & Scholes implied volatility of VIX options using the perturbative technique described in <a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2942262">this paper</a>. The modelling setup requires that the VIX index dynamics is explicitly computable as a smooth transformation of a purely diffusive, one-dimensional Markov process Y. Specifically:


Please note that this tool is <b>not a standalone software</b>, but it fully relies on the MATLAB suite.

### Prerequisites

This code has been tested on MATLAB R2017a but it should work on any version of MATLAB that supports symbolic calculus. The following MATLAB Toolboxes are required to ensure full compatibility of the code: 

- Symbolic Math Toolbox 

### Installing rndfittool

There are two options to install the VIX Implied Volatility Toolbox on your machine.

#### Installing rndfittool as MATLAB App (recommended)
- Download the [MATLAB Toolbox installer](https://github.com/abarletta/rndfittool/releases/download/v17.04/RND.Fitting.Tool.mlappinstall).
- Double-click on the file to start the installation process.
- If the double-click does not work you may alternatively open the file by dragging it into the MATLAB command window.
- After the installation you can run the main function _viximpv_.
- If the installation does not work switch to the next method.

#### Installing rdnfittool through zip archive
- Download the [zip archive](https://github.com/abarletta/rndfittool/releases/download/v17.04/RND.Fitting.Tool.zip) containing all the necessary resources.
- Extract the archive contents into a local folder.
- Set the folder containing the extracted file as MATLAB current folder or, alternatively, add it to the MATLAB path list. 
- Type <code>rndfittool</code> to run the tool.


________________________________________________________________________________________________________________________________________
## Usage

### Input

### Output

________________________________________________________________________________________________________________________________________
## Examples

- Heston model

```
Kappa=3;
Theta=0.04;
Epsilon=0.5;
Y0=0.035;
T=1/48;
Mu=@(y) Kappa*(Theta-y);
Eta=@(y) Epsilon*sqrt(y);
Tau=30/365;
a=(1-exp(-Kappa*Tau))/(Kappa*Tau);
b=Theta*(1-a);
Phi=@(y) sqrt(a*y+b);
K=.13:.01:.25;
Sigma2=viximpv(Mu,Eta,Phi,Y0,K,T,2);
Sigma3=viximpv(Mu,Eta,Phi,Y0,K,T,3);
Sigma4=viximpv(Mu,Eta,Phi,Y0,K,T,4);
plot(K,[Sigma2; Sigma3; Sigma4]);
```

