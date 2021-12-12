function [B,E13,E14]=MRMG2E1(M,k1,CPLP13,CPLP14,MTTFPV2)
% Modelo de la MG2 parte del modelo MAGF1, el cual se describe abajo.

% con el modelo descrito arriba se creo una funcion, entonces este modelo
% es una funcion que es llamada, desde el modelo de distribucion integrado
% con la carga (modelo principal), pero la llamada solo se realiza cuando 
% en ese alimentador o punto de carga exite una MG, si existe una MG, lo 
% cual se comprueba en el modelo principal, se llama la funcion MRMG2E1,
% en este modelo primero pregunta si el sistema de generacion esta 
% funcionando si es asi, se determina si la generacion soporta la carga, 
% si no la soporta genera una falla. 

% en este modelo la carga esta integrada, mediante a una llamada a la 
% funcion cargaR y la generacion esta integrada, pero mediante una llamada 
% a la funcion MRG1E1. 

% inicializo variables 
k=1;
B=0;
E13=0;
E14=0;
% desde aca comienza el codigo, el while se repite k1 veces, k1 representa 
% las horas que el componente que falla se mantiene en falla.  
   T=M;
while k<=k1 
% antes de determinar la carga y la generacion en cada hora, determino si
% el sistema de generacion fallo en ese tiempo M, si el sistema de 
% generacion falla, falla toda la MG y el sistema se compartaria como
% si no tuviera MG.
    if T>=MTTFPV2&&T<=MTTFPV2+72 
% Si falla, calculo la energia que se deja de suministrar y sumo una falla 
        [zz]=cargaR(T);
        l1=zz*CPLP13;
        l2=zz*CPLP14;
        B=B+1;
        E13=E13+l1;
        E14=E14+l2;
                 
    else 
% llamo al modelo de generacion con M y traigo el valor Ppv1   
        [Ppv1]=MRG2(T);
% ahora se llama la funcion de la carga, y analiso el proceso de 
% carga-descarga
        [zz]=cargaR(T);
        l1=zz*CPLP13;
        l2=zz*CPLP14;
        lT=l1+l2;
        
% pregunto si la carga es mayor que la generacion
             if (lT>Ppv1)
% si la carga es mayor que la generacion calculo una falla y la energia que 
% se deja de suministrar, si no es mayor no hace nada 
                 B=B+1;
                 E13=E13+l1;
                 E14=E14+l2;
             else
             end    
    end
         
        k=k+1;
        T=T+1;
end
     



        
