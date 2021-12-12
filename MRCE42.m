% Este es el escenario IV de la tesis, parto del modelo MRC1 este modela el 
% sistema real colombiano, pero sin MG y teniendo en cuenta la carga 
% (desde el se llama al modelo cargaR), ahora voy a ingresar la MG, para 
% este escenario se tienen que ingresar los modelos de almacenamiento y 
% generacion PV. 

%////////////////////////////////////////////////////////////////////////
%///////////////////////////////////////////////////////////////////////
% Aca comienza el modelo 
 close all
 clear 
 clc
% Ingreso los datos del sistema

% Ingreso los Datos del Sistema de Distribucion real 
% Defino las lambda para las lineas, en este primer modelo voy a tomar el
% lambda para las lineas de 6 por km,  

 lambL=6;   % lamdas para las lineas por KM
 
% con el lambda por kilometro calculo el lambda para cada tramo de linea
 lambL1=lambL*12;
 lambL2=lambL*7;
 lambL3=lambL*1.5;
 lambL4=lambL*5;
 lambL5=lambL;
 lambL6=lambL;
 lambL7=lambL;
 lambL8=lambL*0.3;
 lambL9=lambL*0.6;
 lambL10=lambL;
 lambL11=lambL*0.5;
 lambL12=lambL*0.2;
 lambL13=lambL*0.7;
 lambL14=lambL*0.9;
 lambL15=lambL*1.3;
 lambL16=lambL*0.8;
 lambL17=lambL*0.5;
 lambL18=lambL*0.3;
 lambL19=lambL*0.2;
 lambL20=lambL*0.7;
 lambL21=lambL*9;
 lambL22=lambL*1.5;
 lambL23=lambL*0.4;
 lambL24=lambL*3.7;
 lambL25=lambL*0.5;
 lambL26=lambL*2;
 lambL27=lambL*3.7;
 lambL28=lambL;
 lambL29=lambL*1.1;
 lambL30=lambL;
 lambL31=lambL*0.7;
 lambL32=lambL*0.7;
 
% Defino los MTTR, el MTTR es el mismo para todas las lineas, lo pongo en 
% cero y luego lo calculo 
 MTTRL=0;

% para los tranformadores todas las lamdda son iguales 
 lambT=0.047;

% el MTTR es el mismo para todas los tranformadores, lo pongo en cero y 
% luego lo calculo   
 MTTRT=0;
 
% para el modelo de generacion
% Ingreso los Datos para el modelo de Generacion PV de XXMW
% lamdda para cada PV, es la misma
 lamPV=0.12;
% Defino los MTTR para cada PV, 
 MTTRPV=30;
 
%Ingreso los datos para el Modelo de Almacenamiento
% lamdda para cada sistema de almacenamineto, es la misma
 lamA=0.05;
% Defino los MTTR para cada sistema de almacenamiento  
 MTTRA=50;

% numero de clientes por punto de carga, por aliementador y total
CLP1=1;
CLP2=3;
CLP3=5;
CLP4=7;
CLP5=2;
CLP6=41;
CLP7=9;
CLP8=15;
CLP9=5;
CLP10=1;
CLP11=35;
CLP12=60;
CLP13=22;
CLP14=34;
CF1=240;
CLP15=19;
CLP16=1;
CLP17=2;
CLP18=1;
CLP19=1;
CLP20=1;
CLP21=1;
CLP22=1;
CF2=27;
CTS=267;

% Ingreso los Datos para el modelo de Carga carga pico en cada punto de 
% carga, en cada alimentador y total
CPLP1=5440;
CPLP2=3520;
CPLP3=4488;
CPLP4=5464;
CPLP5=3048;
CPLP6=22512;
CPLP7=6448;
CPLP8=9440;
CPLP9=4488;
CPLP10=2576;
CPLP11=19520;
CPLP12=32080;
CPLP13=13024;
CPLP14=18992;
CPF1=151040;
%F2
CPLP15=11448;
CPLP16=640;
CPLP17=2576;
CPLP18=5440;
CPLP19=640;
CPLP20=2576;
CPLP21=640;
CPLP22=640;
CPF2=24600;
CPTS=175610;

% inicializo el contador de años de simulacion 
 n=1;
 years=5000;
% inicializo variables
% landa en los puntos de carga para F1
LambLP1=zeros(years,1);
LambLP2=zeros(years,1);
LambLP3=zeros(years,1);
LambLP4=zeros(years,1);
LambLP5=zeros(years,1);
LambLP6=zeros(years,1);
LambLP7=zeros(years,1);
LambLP8=zeros(years,1);
LambLP9=zeros(years,1);
LambLP10=zeros(years,1);
LambLP11=zeros(years,1);
LambLP12=zeros(years,1);
LambLP13=zeros(years,1);
LambLP14=zeros(years,1);
% U en los puntos de carga para F1
ULP1=zeros(years,1);
ULP2=zeros(years,1);
ULP3=zeros(years,1);
ULP4=zeros(years,1);
ULP5=zeros(years,1);
ULP6=zeros(years,1);
ULP7=zeros(years,1);
ULP8=zeros(years,1);
ULP9=zeros(years,1);
ULP10=zeros(years,1);
ULP11=zeros(years,1);
ULP12=zeros(years,1);
ULP13=zeros(years,1);
ULP14=zeros(years,1);
% Energia no suministrada a cada punto de carga en el total de años para F1
ENSLP1=zeros(years,1);
ENSLP2=zeros(years,1);
ENSLP3=zeros(years,1);
ENSLP4=zeros(years,1);
ENSLP5=zeros(years,1);
ENSLP6=zeros(years,1);
ENSLP7=zeros(years,1);
ENSLP8=zeros(years,1);
ENSLP9=zeros(years,1);
ENSLP10=zeros(years,1);
ENSLP11=zeros(years,1);
ENSLP12=zeros(years,1);
ENSLP13=zeros(years,1);
ENSLP14=zeros(years,1);
% landa en los puntos de cargas para analizar la convergencia 
LambPSLP14=zeros(years,1);
% U en los puntos de carga para analizar la convergencia
PULP14=zeros(years,1);

% landa en los puntos de carga para F2
LambLP15=zeros(years,1);
LambLP16=zeros(years,1);
LambLP17=zeros(years,1);
LambLP18=zeros(years,1);
LambLP19=zeros(years,1);
LambLP20=zeros(years,1);
LambLP21=zeros(years,1);
LambLP22=zeros(years,1);
% U en los puntos de carga para F2
ULP15=zeros(years,1);
ULP16=zeros(years,1);
ULP17=zeros(years,1);
ULP18=zeros(years,1);
ULP19=zeros(years,1);
ULP20=zeros(years,1);
ULP21=zeros(years,1);
ULP22=zeros(years,1);
% Energia no suministrada a cada punto de carga en el total de años n para F2
ENSLP15=zeros(years,1);
ENSLP16=zeros(years,1);
ENSLP17=zeros(years,1);
ENSLP18=zeros(years,1);
ENSLP19=zeros(years,1);
ENSLP20=zeros(years,1);
ENSLP21=zeros(years,1);
ENSLP22=zeros(years,1);
% landa en los puntos de cargas para analizar la convergencia 
LambPSLP15=zeros(years,1);
% U en los puntos de carga para analizar la convergencia
PULP15=zeros(years,1);
% Matriz SAIFI para calcular la distribucion 
SAIFIF1D=zeros(years,1);
SAIFIF1DP=zeros(years,1);
EENSF1D=zeros(years,1);
EENSF1DP=zeros(years,1);

while n<=years 
% inicializo variables dentro del while
% lambdas para las lineas
    LambS=0;
    lambS1=0;
    lambS1MG1=0;  %lambda para analizar la MG1 cuando falla la linea 1
    lambS1MG2=0;  %lambda para analizar la MG2 cuando falla la linea 1
    lambS2=0;
    lambS2MG1=0;  %lambda para analizar la MG1 cuando falla la linea 2
    lambS2MG2=0;  %lambda para analizar la MG2 cuando falla la linea 2
    lambS3=0;
    lambS3MG1=0;  %lambda para analizar la MG1 cuando falla la linea 3
    lambS3MG2=0;  %lambda para analizar la MG2 cuando falla la linea 3
    lambS4=0;
    lambS4MG1=0;  %lambda para analizar la MG1 cuando falla la linea 4
    lambS4MG2=0;  %lambda para analizar la MG2 cuando falla la linea 4
    lambS5=0;
    lambS5MG1=0;  %lambda para analizar la MG1 cuando falla la linea 5
    lambS5MG2=0;  %lambda para analizar la MG2 cuando falla la linea 5
    lambS6=0;
    lambS6MG1=0;  %lambda para analizar la MG1 cuando falla la linea 6
    lambS6MG2=0;  %lambda para analizar la MG2 cuando falla la linea 6
    lambS7=0;
    lambS7MG1=0;  %lambda para analizar la MG1 cuando falla la linea 7
    lambS7MG2=0;  %lambda para analizar la MG2 cuando falla la linea 7
    lambS8=0;
    lambS8MG1=0;  %lambda para analizar la MG1 cuando falla la linea 8
    lambS8MG2=0;  %lambda para analizar la MG2 cuando falla la linea 8
    lambS9=0;
    lambS9MG1=0;  %lambda para analizar la MG1 cuando falla la linea 9
    lambS9MG2=0;  %lambda para analizar la MG2 cuando falla la linea 9
    lambS10=0;
    lambS10MG1=0;  %lambda para analizar la MG1 cuando falla la linea 10
    lambS10MG2=0;  %lambda para analizar la MG2 cuando falla la linea 10
    lambS11=0;
    lambS11MG1=0;  %lambda para analizar la MG1 cuando falla la linea 11
    lambS11MG2=0;  %lambda para analizar la MG2 cuando falla la linea 11
    lambS12=0;
    lambS12MG1=0;  %lambda para analizar la MG1 cuando falla la linea 12
    lambS12MG2=0;  %lambda para analizar la MG2 cuando falla la linea 12
    lambS13=0;
    lambS13MG1=0;  %lambda para analizar la MG1 cuando falla la linea 13
    lambS13MG2=0;  %lambda para analizar la MG2 cuando falla la linea 13
    lambS14=0;
    lambS14MG1=0;  %lambda para analizar la MG1 cuando falla la linea 14
    lambS14MG2=0;  %lambda para analizar la MG2 cuando falla la linea 14
    lambS15=0;
    lambS15MG1=0;  %lambda para analizar la MG1 cuando falla la linea 15
    lambS15MG2=0;  %lambda para analizar la MG2 cuando falla la linea 15
    lambS16=0;
    lambS16MG1=0;  %lambda para analizar la MG1 cuando falla la linea 16
    lambS16MG2=0;  %lambda para analizar la MG2 cuando falla la linea 16
    lambS17=0;
    lambS17F=0;    %lambda para analizar los LP que estan fuera de la MG1 cuando falla la linea 17
    lambS17MG2=0;  %lambda para analizar la MG2 cuando falla la linea 17
    lambS18=0;
    lambS18F=0;    %lambda para analizar los LP que estan fuera de la MG1 cuando falla la linea 18
    lambS18MG2=0;  %lambda para analizar la MG2 cuando falla la linea 18
    lambS19=0;
    lambS19F=0;    %lambda para analizar los LP que estan fuera de la MG2 cuando falla la linea 19
    lambS19MG1=0;  %lambda para analizar la MG1 cuando falla la linea 19
    lambS20=0;
    lambS20F=0;    %lambda para analizar los LP que estan fuera de la MG2 cuando falla la linea 20
    lambS20MG1=0;  %lambda para analizar la MG1 cuando falla la linea 20
    lambS21=0;
    lambS22=0;
    lambS23=0;
    lambS24=0;
    lambS25=0;
    lambS26=0;
    lambS27=0;
    lambS28=0;
    lambS29=0;
    lambS30=0;
    lambS31=0;
    lambS32=0;
% lambdas para el tranformador
    lambT1=0;
    lambT2=0;
    lambT3=0;
    lambT4=0;
    lambT5=0;
    lambT6=0;
    lambT7=0;
    lambT8=0;
    lambT9=0;
    lambT10=0;
    lambT11=0;
    lambT12=0;
    lambT13=0;
    lambT14=0;
    lambT15=0;
    lambT16=0;
    lambT17=0;
    lambT18=0;
    lambT19=0;
    lambT20=0;
    lambT21=0;
    lambT22=0;
% lambdas para los PV
    lambPV1=0;
    lambPV2=0;
% lambdas para los sistemas de almacenamiento
    lambA1=0;
    lambA2=0;
% Energia no sumistrada a cada punto de carga en cada año
    ENS1=0;
    ENS2=0;
    ENS3=0;
    ENS4=0;
    ENS5=0;
    ENS6=0;
    ENS7=0;
    ENS8=0;
    ENS9=0;
    ENS10=0;
    ENS11=0;
    E11=0;
    ENS12=0;
    E12=0;
    ENS13=0;
    E13=0;
    ENS14=0;
    E14=0;
    ENS15=0;
    ENS16=0;
    ENS17=0;
    ENS18=0;
    ENS19=0;
    ENS20=0;
    ENS21=0;
    ENS22=0;
% Creo los numeros aleatorios entre [0 1], para cada seccion de linea 
    U1=rand;
    U2=rand;
    U3=rand;
    U4=rand;
    U5=rand;
    U6=rand;
    U7=rand;
    U8=rand;
    U9=rand;
    U10=rand;
    U11=rand;
    U12=rand;
    U13=rand;
    U14=rand;
    U15=rand;
    U16=rand;
    U17=rand;
    U18=rand;
    U19=rand;
    U20=rand;
    U21=rand;
    U22=rand;
    U23=rand;
    U24=rand;
    U25=rand;
    U26=rand;
    U27=rand;
    U28=rand;
    U29=rand;
    U30=rand;
    U31=rand;
    U32=rand;

% Creo los numeros aleatorios entre [0 1], para cada transformador  
    UT1=rand;
    UT2=rand;
    UT3=rand;
    UT4=rand;
    UT5=rand;
    UT6=rand;
    UT7=rand;
    UT8=rand;
    UT9=rand;
    UT10=rand;
    UT11=rand;
    UT12=rand;
    UT13=rand;
    UT14=rand;
    UT15=rand;
    UT16=rand;
    UT17=rand;
    UT18=rand;
    UT19=rand;
    UT20=rand;
    UT21=rand;
    UT22=rand;
  
% Creo los numeros aleatorios entre [0 1], para la probabilidad de cambio 
% exitoso, entre conectado a la red o MG, para cada MG
    UMG1=rand;
    UMG2=rand;
% Creo los numeros aleatorios entre [0 1], para cada sistema PV
    UPV1=rand;
    UPV2=rand;
% Creo los numeros aleatorios entre [0 1], para cada sistema de almacenamiento
    UA1=rand;
    UA2=rand;

% Calculo MTTF para cada seccion de linea 
    MTTF1=-(log(U1)/lambL1)*8760;
    MTTF2=-(log(U2)/lambL2)*8760;
    MTTF3=-(log(U3)/lambL3)*8760;
    MTTF4=-(log(U4)/lambL4)*8760;
    MTTF5=-(log(U5)/lambL5)*8760;
    MTTF6=-(log(U6)/lambL6)*8760;
    MTTF7=-(log(U7)/lambL7)*8760;
    MTTF8=-(log(U8)/lambL8)*8760;
    MTTF9=-(log(U9)/lambL9)*8760;
    MTTF10=-(log(U10)/lambL10)*8760;
    MTTF11=-(log(U11)/lambL11)*8760;
    MTTF12=-(log(U12)/lambL12)*8760;
    MTTF13=-(log(U13)/lambL13)*8760;
    MTTF14=-(log(U14)/lambL14)*8760;
    MTTF15=-(log(U15)/lambL15)*8760;
    MTTF16=-(log(U16)/lambL16)*8760;
    MTTF17=-(log(U17)/lambL17)*8760;
    MTTF18=-(log(U18)/lambL18)*8760;
    MTTF19=-(log(U19)/lambL19)*8760;
    MTTF20=-(log(U20)/lambL20)*8760;
    MTTF21=-(log(U21)/lambL21)*8760;
    MTTF22=-(log(U22)/lambL22)*8760;
    MTTF23=-(log(U23)/lambL23)*8760;
    MTTF24=-(log(U24)/lambL24)*8760;
    MTTF25=-(log(U25)/lambL25)*8760;
    MTTF26=-(log(U26)/lambL26)*8760;
    MTTF27=-(log(U27)/lambL27)*8760;
    MTTF28=-(log(U28)/lambL28)*8760;
    MTTF29=-(log(U29)/lambL29)*8760;
    MTTF30=-(log(U30)/lambL30)*8760;
    MTTF31=-(log(U31)/lambL31)*8760;
    MTTF32=-(log(U32)/lambL32)*8760;

% Calculo MTTF para cada tranformador
% para F1
    MTTFT1=-(log(UT1)/lambT)*8760;
    MTTFT2=-(log(UT2)/lambT)*8760;
    MTTFT3=-(log(UT3)/lambT)*8760;
    MTTFT4=-(log(UT4)/lambT)*8760;
    MTTFT5=-(log(UT5)/lambT)*8760;
    MTTFT6=-(log(UT6)/lambT)*8760;
    MTTFT7=-(log(UT7)/lambT)*8760;
    MTTFT8=-(log(UT8)/lambT)*8760;
    MTTFT9=-(log(UT9)/lambT)*8760;
    MTTFT10=-(log(UT10)/lambT)*8760;
    MTTFT11=-(log(UT11)/lambT)*8760;
    MTTFT12=-(log(UT12)/lambT)*8760;
    MTTFT13=-(log(UT13)/lambT)*8760;
    MTTFT14=-(log(UT14)/lambT)*8760;
    
% para F2
    MTTFT15=-(log(UT15)/lambT)*8760;
    MTTFT16=-(log(UT16)/lambT)*8760;
    MTTFT17=-(log(UT17)/lambT)*8760;
    MTTFT18=-(log(UT18)/lambT)*8760;
    MTTFT19=-(log(UT19)/lambT)*8760;
    MTTFT20=-(log(UT20)/lambT)*8760;
    MTTFT21=-(log(UT21)/lambT)*8760;
    MTTFT22=-(log(UT22)/lambT)*8760;
    
% Calculo MTTF para cada sistema PV
    MTTFPV1=-(log(UPV1)/lamPV)*8760;
    MTTFPV2=-(log(UPV2)/lamPV)*8760;
    
% Calculo MTTF para cada sistema de almacenamiento 
    MTTFA1=-(log(UA1)/lamA)*8760;
    MTTFA2=-(log(UA2)/lamA)*8760;

% calculo el MTTRL para las lineas con una distribucion normal 
    r = normrnd(0.5,0.6);
    x=abs(r);
    MTTRL=round(x);
    if MTTRL<=0
    MTTRL=1;
    end
% calculo el MTTRT para el transformador con una distribucion normal
    r = normrnd(11.7,2.5);
    x=abs(r);
    MTTRT=round(x);
    if MTTRT<=0
    MTTRT=1;
    end
    
% creo una matriz o vector con los MTTF, sin incluir los de los sistemas PV 
    MTTFM=[MTTF1 MTTF2 MTTF3 MTTF4 MTTF5 MTTF6 MTTF7 MTTF8 MTTF9 MTTF10 MTTF11 MTTF12 MTTF13 MTTF14 MTTF15 MTTF16 MTTF17 MTTF18 MTTF19 MTTF20 MTTF21 MTTF22 MTTF23 MTTF24 MTTF25 MTTF26 MTTF27 MTTF28 MTTF29 MTTF30 MTTF31 MTTF32 MTTFT1 MTTFT2 MTTFT3 MTTFT4 MTTFT5 MTTFT6 MTTFT7 MTTFT8 MTTFT9 MTTFT10 MTTFT11 MTTFT12 MTTFT13 MTTFT14 MTTFT15 MTTFT16 MTTFT17 MTTFT18 MTTFT19 MTTFT20 MTTFT21 MTTFT22];
    
% Selecciono el MTTF minimo y su Ubicacion
    [M,I] = min(MTTFM(:));
    
% creo un while para un año
    while M<=8760
        LambS=LambS+1;
% para F1
        if I==1
           lambS1=lambS1+1;

% obtengo la enegia no suministrada en los puntos de cargas, en el caso 
% anterior eran todos por que al fallar la linea 1 salian todos los puntos 
% de carga, pero en este caso como hay MG los puntos de carga donde hay MG 
% se tienen que analizar por separado.
% Los puntos de carga que estan fuera de las MGs salen por MTTRL hora, 
% para esto necesito un while

% llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
            k=1;
            T=M;
            while k<=MTTRL
                  ENS1=ENS1+zz*CPLP1;
                  ENS2=ENS2+zz*CPLP2;
                  ENS3=ENS3+zz*CPLP3;
                  ENS4=ENS4+zz*CPLP4;
                  ENS5=ENS5+zz*CPLP5;
                  ENS6=ENS6+zz*CPLP6;
                  ENS7=ENS7+zz*CPLP7;
                  ENS8=ENS8+zz*CPLP8;
                  ENS9=ENS9+zz*CPLP9;
                  ENS10=ENS10+zz*CPLP10;
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end

% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
% como UGM1 es menor o igual que 0.95 eso quiere decir que el interrutor que 
% pasa de conectado a la red a MG1 funciono, y se crea la MG1.
        
% primero llamo la funcion del modelo de la MG1 para MTTRL horas. 
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);
% dentro de la funcion que llame, determino si el sistema de generacion 
% esta funcionando, con los datos que traigo determino si hubo falla y la 
% energia dejada de suministrar
                     if B>=1
                       lambS1MG1=lambS1MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
% como UMG1 es mayor que 0.95 eso quiere decir que el interrutor para pasar 
% de conectado a la red a MG1 fallo y el analisis es como si no hubiera MG.
         
% primero sumo una falla al acomulador de falla de la linea 1, que impacta
% a los puntos de carga en la MG1 osea LP11 y LP12 llamada lambS1MG1
                     lambS1MG1=lambS1MG1+1;
         
% obtengo la enegia no suministrado en los puntos de cargas que
% salen mas de una hora (MTTRL), para esto necesito un while 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG2 funciona             
                if UMG2<=0.95
% como UGM2 es menor o igual que 0.95 eso quiere decir que el interrutor que 
% pasa de conectado a la red a MG2 funciono, y se crea la MG2.
        
% primero llamo la funcion del modelo de generacion para MTTRL horas.
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

% dentro de la funcion que llame, determino si el sistema de generacion 
% esta funcionando, con los datos que traigo determino si hubo falla y la 
% energia dejada de suministrar
                     if B>=1
                       lambS1MG2=lambS1MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
% como UMG1 es mayor que 0.95 eso quiere decir que el interrutor para pasar 
% de conectado a la red a MG2 fallo y el analisis es como si no hubiera MG.
         
% primero sumo una falla al acomulador de falla de la linea 1, que impacta
% a los puntos de carga en la MG2 osea LP13 y LP14 llamada lambS1MG2
                     lambS1MG2=lambS1MG2+1;
         
% obtengo la enegia no suministrado en los puntos de cargas que
% salen mas de una hora (MTTRL), para esto necesito un while 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
            Uf=rand;
            MTTFN=-(log(Uf)/lambL1)*8760;
            MTTF1=MTTF1+MTTRL+MTTFN;
            MTTFM(1)=MTTF1;
           
        elseif I==2
               lambS2=lambS2+1;
% Igual a I==1   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
% Igual a I==1  
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);
% Igual a I==1 
                     if B>=1
                       lambS2MG1=lambS2MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
% Igual a I==1 
                     lambS2MG1=lambS2MG1+1;
% Igual a I==1 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG2 funciona             
                if UMG2<=0.95
% Igual a I==1 
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);
% Igual a I==1 
                     if B>=1
                       lambS2MG2=lambS2MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
% Igual a I==1 
                     lambS2MG2=lambS2MG2+1;
% Igual a I==1  
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL2)*8760;
                MTTF2=MTTF2+MTTRL+MTTFN;
                MTTFM(2)=MTTF2;
                 
        elseif I==3
               lambS3=lambS3+1;
% Igual a I==1   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
% Igual a I==1 
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);
% Igual a I==1 
                     if B>=1
                       lambS3MG1=lambS3MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
% Igual a I==1 
                     lambS3MG1=lambS3MG1+1;
% Igual a I==1 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
% Igual a I==1  
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);
% Igual a I==1 
                     if B>=1
                       lambS3MG2=lambS3MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
% Igual a I==1 
                     lambS3MG2=lambS3MG2+1;
% Igual a I==1 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL3)*8760;
                MTTF3=MTTF3+MTTRL+MTTFN;
                MTTFM(3)=MTTF3;
                    
        elseif I==4
                lambS4=lambS4+1;
% Igual a I==1   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
% Igual a I==1 
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);
% Igual a I==1 
                     if B>=1
                       lambS4MG1=lambS4MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
% Igual a I==1 
                     lambS4MG1=lambS4MG1+1;
% Igual a I==1 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
% Igual a I==1 
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);
% Igual a I==1 
                     if B>=1
                       lambS4MG2=lambS4MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
% Igual a I==1 
                     lambS4MG2=lambS4MG2+1;
% Igual a I==1 
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL4)*8760;
                MTTF4=MTTF4+MTTRL+MTTFN;
                MTTFM(4)=MTTF4;          
        
        elseif I==5
                lambS5=lambS5+1;
% Igual a I==1   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
% Igual a I==1
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);
% Igual a I==1
                     if B>=1
                       lambS5MG1=lambS5MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS5MG1=lambS5MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
% Igual a I==1
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);
                     if B>=1
                       lambS5MG2=lambS5MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS5MG2=lambS5MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL5)*8760;
                MTTF5=MTTF5+MTTRL+MTTFN;
                MTTFM(5)=MTTF5;
                 
        elseif I==6
                lambS6=lambS6+1; 
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS6MG1=lambS6MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS6MG1=lambS6MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95 
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS6MG2=lambS6MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS6MG2=lambS6MG2+1;

                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL6)*8760;
                MTTF6=MTTF6+MTTRL+MTTFN;
                MTTFM(6)=MTTF6;

        elseif I==7
                lambS7=lambS7+1;
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                    
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS7MG1=lambS7MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS7MG1=lambS7MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
         
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS7MG2=lambS7MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS7MG2=lambS7MG2+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL7)*8760;
                MTTF7=MTTF7+MTTRL+MTTFN;
                MTTFM(7)=MTTF7;
                 
        elseif I==8
                lambS8=lambS8+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS8MG1=lambS8MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS8MG1=lambS8MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                     
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS8MG2=lambS8MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS8MG2=lambS8MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL8)*8760;
                MTTF8=MTTF8+MTTRL+MTTFN;
                MTTFM(8)=MTTF8;
                
        elseif I==9
                lambS9=lambS9+1;  
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS9MG1=lambS9MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS9MG1=lambS9MG1+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS9MG2=lambS9MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS9MG2=lambS9MG2+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL9)*8760;
                MTTF9=MTTF9+MTTRL+MTTFN;
                MTTFM(9)=MTTF9;
                 
        elseif I==10
               lambS10=lambS10+1; 
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS10MG1=lambS10MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS10MG1=lambS10MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS10MG2=lambS10MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS10MG2=lambS10MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL10)*8760;
                MTTF10=MTTF10+MTTRL+MTTFN;
                MTTFM(10)=MTTF10;
                
        elseif I==11
                lambS11=lambS11+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS11MG1=lambS11MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS11MG1=lambS11MG1+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95
                    
                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS11MG2=lambS11MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS11MG2=lambS11MG2+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end

                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL11)*8760;
                MTTF11=MTTF11+MTTRL+MTTFN;
                MTTFM(11)=MTTF11;
                
         elseif I==12
                lambS12=lambS12+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                    
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS12MG1=lambS12MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS12MG1=lambS12MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS12MG2=lambS12MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS12MG2=lambS12MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL12)*8760;
                MTTF12=MTTF12+MTTRL+MTTFN;
                MTTFM(12)=MTTF12;
                
        elseif I==13
                lambS13=lambS13+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS13MG1=lambS13MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS13MG1=lambS13MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS13MG2=lambS13MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS13MG2=lambS13MG2+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL13)*8760;
                MTTF13=MTTF13+MTTRL+MTTFN;
                MTTFM(13)=MTTF13;
                
        elseif I==14
                lambS14=lambS14+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS14MG1=lambS14MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS14MG1=lambS14MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS14MG2=lambS14MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS14MG2=lambS14MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL14)*8760;
                MTTF14=MTTF14+MTTRL+MTTFN;
                MTTFM(14)=MTTF14;
                
        elseif I==15
                lambS15=lambS15+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS15MG1=lambS15MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS15MG1=lambS15MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS15MG2=lambS15MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS15MG2=lambS15MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL15)*8760;
                MTTF15=MTTF15+MTTRL+MTTFN;
                MTTFM(15)=MTTF15;
                
        elseif I==16
               lambS16=lambS16+1;   
               [zz]=cargaR(M);
               k=1;
               T=M;
               while k<=MTTRL
                     ENS1=ENS1+zz*CPLP1;
                     ENS2=ENS2+zz*CPLP2;
                     ENS3=ENS3+zz*CPLP3;
                     ENS4=ENS4+zz*CPLP4;
                     ENS5=ENS5+zz*CPLP5;
                     ENS6=ENS6+zz*CPLP6;
                     ENS7=ENS7+zz*CPLP7;
                     ENS8=ENS8+zz*CPLP8;
                     ENS9=ENS9+zz*CPLP9;
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end    
% MGs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
            k=1;
            T=M;
            
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS16MG1=lambS16MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS16MG1=lambS16MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS16MG2=lambS16MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS16MG2=lambS16MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL16)*8760;
                MTTF16=MTTF16+MTTRL+MTTFN;
                MTTFM(16)=MTTF16;
                
        elseif I==17
               lambS17=lambS17+1;
% La linea 17 se encuentra dentro de la MG1, por lo tanto si falla la linea 
% 17 y el reconectador de la MG1 funciona solo fallan los puntos de carga 
% dentro de MG1.
               if UMG1<=0.95
 % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
 % los puntos de carga dentro de la MG1 falla MTTRL horas, 
               k=1;
               T=M;
               while k<=MTTRL
                     ENS11=ENS11+zz*CPLP11;
                     ENS12=ENS12+zz*CPLP12;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end 
% si el reconectador no aisla la falla entonces fallan los puntos de carga 
% dentro de MG1 mas los puntos de carga fuera las MGs, ademas se crea la MG2
               else
                   lambS17F=lambS17F+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS1=ENS1+zz*CPLP1;
                            ENS2=ENS2+zz*CPLP2;
                            ENS3=ENS3+zz*CPLP3;
                            ENS4=ENS4+zz*CPLP4;
                            ENS5=ENS5+zz*CPLP5;
                            ENS6=ENS6+zz*CPLP6;
                            ENS7=ENS7+zz*CPLP7;
                            ENS8=ENS8+zz*CPLP8;
                            ENS9=ENS9+zz*CPLP9;
                            ENS10=ENS10+zz*CPLP10;
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
% si el reconectador no aisla la falla se crea la MG2 
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG2 funciona             
                 if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS17MG2=lambS17MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                 else
                     lambS17MG2=lambS17MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
               end  
                Uf=rand;
                MTTFN=-(log(Uf)/lambL17)*8760;
                MTTF17=MTTF17+MTTRL+MTTFN;
                MTTFM(17)=MTTF17;
                
        elseif I==18
                lambS18=lambS18+1;
% La linea 18 se encuentra dentro de la MG1, por lo tanto si falla la linea 
% 18 y el reconectador de la MG1 funciona solo fallan los puntos de carga 
% dentro de MG1.
               if UMG1<=0.95
 % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
 % los puntos de carga dentro de la MG1 fallan MTTRL horas, 
               k=1;
               T=M;
               while k<=MTTRL
                     ENS11=ENS11+zz*CPLP11;
                     ENS12=ENS12+zz*CPLP12;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end 
% si el reconectador no aisla la falla entonces fallan los puntos de carga 
% dentro de MG1 mas los puntos de carga fuera las MGs, ademas se crea la MG2
               else
                   lambS18F=lambS18F+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS1=ENS1+zz*CPLP1;
                            ENS2=ENS2+zz*CPLP2;
                            ENS3=ENS3+zz*CPLP3;
                            ENS4=ENS4+zz*CPLP4;
                            ENS5=ENS5+zz*CPLP5;
                            ENS6=ENS6+zz*CPLP6;
                            ENS7=ENS7+zz*CPLP7;
                            ENS8=ENS8+zz*CPLP8;
                            ENS9=ENS9+zz*CPLP9;
                            ENS10=ENS10+zz*CPLP10;
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
% ademas, si el reconectador no aisla la falla se crea la MG2 
% para la MG2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG2 funciona             
                if UMG2<=0.95

                   k1=MTTRL;
                   [B,E13,E14]=MRMG2E4(M,k1,CPLP13,CPLP14,MTTFA2,MTTFPV2);

                     if B>=1
                       lambS18MG2=lambS18MG2+1;
                       ENS13= ENS13+E13;
                       ENS14= ENS14+E14;
                     else
                     end
                else
                     lambS18MG2=lambS18MG2+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
               end  
                Uf=rand;
                MTTFN=-(log(Uf)/lambL18)*8760;
                MTTF18=MTTF18+MTTRL+MTTFN;
                MTTFM(18)=MTTF18;
                
        elseif I==19
                lambS19=lambS19+1;
% La linea 19 se encuentra dentro de la MG2, por lo tanto si falla la linea 
% 19 y el reconectador de la MG2 funciona solo fallan los puntos de carga 
% dentro de MG2.
               if UMG2<=0.95
 % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
 % los puntos de carga dentro de la MG2 fallan MTTRL horas, 
               k=1;
               T=M;
               while k<=MTTRL
                     ENS13=ENS13+zz*CPLP13;
                     ENS14=ENS14+zz*CPLP14;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end 
% si el reconectador no aisla la falla entonces fallan los puntos de carga 
% dentro de MG2 mas los puntos de carga fuera las MGs, ademas se crea la MG1
               else
                   lambS19F=lambS19F+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS1=ENS1+zz*CPLP1;
                            ENS2=ENS2+zz*CPLP2;
                            ENS3=ENS3+zz*CPLP3;
                            ENS4=ENS4+zz*CPLP4;
                            ENS5=ENS5+zz*CPLP5;
                            ENS6=ENS6+zz*CPLP6;
                            ENS7=ENS7+zz*CPLP7;
                            ENS8=ENS8+zz*CPLP8;
                            ENS9=ENS9+zz*CPLP9;
                            ENS10=ENS10+zz*CPLP10;
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
% ademas, si el reconectador no aisla la falla se crea la MG1 
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95

                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS19MG1=lambS19MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS19MG1=lambS19MG1+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
               end  
                Uf=rand;
                MTTFN=-(log(Uf)/lambL19)*8760;
                MTTF19=MTTF19+MTTRL+MTTFN;
                MTTFM(19)=MTTF19;
                
        elseif I==20
                lambS20=lambS20+1;
% La linea 20 se encuentra dentro de la MG2, por lo tanto si falla la linea 
% 20 y el reconectador de la MG2 funciona solo fallan los puntos de carga 
% dentro de MG2.
               if UMG2<=0.95
 % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
 % los puntos de carga dentro de la MG2 fallan MTTRL horas, 
               k=1;
               T=M;
               while k<=MTTRL
                     ENS13=ENS13+zz*CPLP13;
                     ENS14=ENS14+zz*CPLP14;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end 
% si el reconectador no aisla la falla entonces fallan los puntos de carga 
% dentro de MG2 mas los puntos de carga fuera las MGs, ademas se crea la MG1
               else
                   lambS20F=lambS20F+1;
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS1=ENS1+zz*CPLP1;
                            ENS2=ENS2+zz*CPLP2;
                            ENS3=ENS3+zz*CPLP3;
                            ENS4=ENS4+zz*CPLP4;
                            ENS5=ENS5+zz*CPLP5;
                            ENS6=ENS6+zz*CPLP6;
                            ENS7=ENS7+zz*CPLP7;
                            ENS8=ENS8+zz*CPLP8;
                            ENS9=ENS9+zz*CPLP9;
                            ENS10=ENS10+zz*CPLP10;
                            ENS13=ENS13+zz*CPLP13;
                            ENS14=ENS14+zz*CPLP14;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
% ademas, si el reconectador no aisla la falla se crea la MG1 
% para la MG1 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% determino si el interuptor para pasar de conectado a la red a MG1 funciona             
                if UMG1<=0.95
                    
                   k1=MTTRL;
                   [B,E11,E12]=MRMG1E4(M,k1,CPLP11,CPLP12,MTTFA1,MTTFPV1);

                     if B>=1
                       lambS20MG1=lambS20MG1+1;
                       ENS11= ENS11+E11;
                       ENS12= ENS12+E12;
                     else
                     end
                else
                     lambS20MG1=lambS20MG1+1;
         
                     k=1;
                     T=M;
                     [zz]=cargaR(M);
                      while k<=MTTRL
                            ENS11=ENS11+zz*CPLP11;
                            ENS12=ENS12+zz*CPLP12;
                            T=T+1;
                            [zz]=carga(T);
                            k=k+1;
                      end
                end
               end  
                Uf=rand;
                MTTFN=-(log(Uf)/lambL20)*8760;
                MTTF20=MTTF20+MTTRL+MTTFN;
                MTTFM(20)=MTTF20;
                
        % para F2
        elseif I==21
                lambS21=lambS21+1;
        % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
% obtengo la enegia no suministrado en los puntos de cargas, multiplicanco 
% el valor de carga ponderado por la carga pico del punto de carga en este 
% caso son todos los del alimentador F2 por que al fallar la linea 22 sale 
% todo F2, y como no hay suministro alternativo salen todos 8 hora, para 
% esto necesito un while, para todas lineas del alimentador F2 es igual 
% cualquier linea que falle, saca a todo F2, por lo tanto de aca hasta la 
% linea 32 es igual.
            k=1;
            T=M;
            while k<=MTTRL
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL21)*8760;
                MTTF21=MTTF21+MTTRL+MTTFN;
                MTTFM(21)=MTTF21;               
        elseif I==22
                lambS22=lambS22+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL22)*8760;
                MTTF22=MTTF22+MTTRL+MTTFN;
                MTTFM(22)=MTTF22;
        elseif I==23
                lambS23=lambS3+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL23)*8760;
                MTTF23=MTTF23+MTTRL+MTTFN;
                MTTFM(23)=MTTF23;
        elseif I==24
                lambS24=lambS24+1;
         % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
        % Igual que I==21, para todo F2
            k=1;
            T=M;
            while k<=MTTRL
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL24)*8760;
                MTTF24=MTTF24+MTTRL+MTTFN;
                MTTFM(24)=MTTF24;
        elseif I==25
                lambS25=lambS25+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL25)*8760;
                MTTF25=MTTF25+MTTRL+MTTFN;
                MTTFM(25)=MTTF25;
        elseif I==26
                lambS26=lambS26+1;
        % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
        % Igual que I==21, para todo F2
            k=1;
            T=M;
            while k<=MTTRL
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL26)*8760;
                MTTF26=MTTF26+MTTRL+MTTFN;
                MTTFM(26)=MTTF26;
        elseif I==27
                lambS27=lambS27+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL27)*8760;
                MTTF27=MTTF27+MTTRL+MTTFN;
                MTTFM(27)=MTTF27;
        elseif I==28
                lambS28=lambS28+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL28)*8760;
                MTTF28=MTTF28+MTTRL+MTTFN;
                MTTFM(28)=MTTF28;
        elseif I==29
               lambS29=lambS29+1;
         % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
         % Igual que I==21, para todo F2
            k=1;
            T=M;
            while k<=MTTRL
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                MTTFN=-(log(Uf)/lambL29)*8760;
                MTTF29=MTTF29+MTTRL+MTTFN;
                MTTFM(29)=MTTF29;
        elseif I==30
                lambS30=lambS30+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL30)*8760;
                MTTF30=MTTF30+MTTRL+MTTFN;
                MTTFM(30)=MTTF30;
        elseif I==31
                lambS31=lambS31+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==21, para todo F2
               k=1;
               T=M;
               while k<=MTTRL
                     ENS15=ENS15+zz*CPLP15;
                     ENS16=ENS16+zz*CPLP16;
                     ENS17=ENS17+zz*CPLP17;
                     ENS18=ENS18+zz*CPLP18;
                     ENS19=ENS19+zz*CPLP19;
                     ENS20=ENS20+zz*CPLP20;
                     ENS21=ENS21+zz*CPLP21;
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambL31)*8760;
                MTTF31=MTTF31+MTTRL+MTTFN;
                MTTFM(31)=MTTF31;  
        elseif I==32
                lambS32=lambS32+1;
        % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
        % Igual que I==21, para todo F2
            k=1;
            T=M;
            while k<=MTTRL
                  ENS15=ENS15+zz*CPLP15;
                  ENS16=ENS16+zz*CPLP16;
                  ENS17=ENS17+zz*CPLP17;
                  ENS18=ENS18+zz*CPLP18;
                  ENS19=ENS19+zz*CPLP19;
                  ENS20=ENS20+zz*CPLP20;
                  ENS21=ENS21+zz*CPLP21;
                  ENS22=ENS22+zz*CPLP22;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                Uf=rand;
                MTTFN=-(log(Uf)/lambL32)*8760;
                MTTF32=MTTF32+MTTRL+MTTFN;
                MTTFM(32)=MTTF32;
        % para F1 transformadores        
        elseif I==33
               lambT1=lambT1+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
% obtengo la enegia no suministrada en el punto de cargas LP1, una falla en
% el transformados solo afecta al punto de carga donde esta conectado
               k=1;
               T=M;
               while k<=MTTRT
                     ENS1=ENS1+zz*CPLP1;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT1=MTTFT1+MTTRT+MTTFN;
                MTTFM(33)=MTTFT1; 
        elseif I==34
               lambT2=lambT2+1;
        % llamo el valor ponderado de la carga de la funcion carga    
           [zz]=cargaR(M);
        % Igual que I==33, para todo F1
            k=1;
            T=M;
            while k<=MTTRT
                  ENS2=ENS2+zz*CPLP2;
                  T=T+1;
                  [zz]=cargaR(T);
                  k=k+1;
            end
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT2=MTTFT2+MTTRT+MTTFN;
                MTTFM(34)=MTTFT2;
        elseif I==35
               lambT3=lambT3+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS3=ENS3+zz*CPLP3;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT3=MTTFT3+MTTRT+MTTFN;
                MTTFM(35)=MTTFT3; 
        elseif I==36
               lambT4=lambT4+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS4=ENS4+zz*CPLP4;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT4=MTTFT4+MTTRT+MTTFN;
                MTTFM(36)=MTTFT4;
        elseif I==37
                lambT5=lambT5+1;
         % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
         % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS5=ENS5+zz*CPLP5;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT5=MTTFT5+MTTRT+MTTFN;
                MTTFM(37)=MTTFT5;
        elseif I==38
                lambT6=lambT6+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS6=ENS6+zz*CPLP6;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT6=MTTFT6+MTTRT+MTTFN;
                MTTFM(38)=MTTFT6;
        elseif I==39
                lambT7=lambT7+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS7=ENS7+zz*CPLP7;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT7=MTTFT7+MTTRT+MTTFN;
                MTTFM(39)=MTTFT7;
        elseif I==40
                lambT8=lambT8+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS8=ENS8+zz*CPLP8;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT8=MTTFT8+MTTRT+MTTFN;
                MTTFM(40)=MTTFT8;
        elseif I==41
                lambT9=lambT9+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS9=ENS9+zz*CPLP9;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT9=MTTFT9+MTTRT+MTTFN;
                MTTFM(41)=MTTFT9;
        elseif I==42
                lambT10=lambT10+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS10=ENS10+zz*CPLP10;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT10=MTTFT10+MTTRT+MTTFN;
                MTTFM(42)=MTTFT10;
        elseif I==43
                lambT11=lambT11+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS11=ENS11+zz*CPLP11;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT11=MTTFT11+MTTRT+MTTFN;
                MTTFM(43)=MTTFT11;
        elseif I==44
                lambT12=lambT12+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS12=ENS12+zz*CPLP12;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT12=MTTFT12+MTTRT+MTTFN;
                MTTFM(44)=MTTFT12;
        elseif I==45
                lambT13=lambT13+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS13=ENS13+zz*CPLP13;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT13=MTTFT13+MTTRT+MTTFN;
                MTTFM(45)=MTTFT13;
        elseif I==46
                lambT14=lambT14+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F1
               k=1;
               T=M;
               while k<=MTTRT
                     ENS14=ENS14+zz*CPLP14;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT14=MTTFT14+MTTRT+MTTFN;
                MTTFM(46)=MTTFT14;
        % para F2 transformadores
        elseif I==47
                lambT15=lambT15+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS15=ENS15+zz*CPLP15;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT15=MTTFT15+MTTRT+MTTFN;
                MTTFM(47)=MTTFT15;
        elseif I==48
                lambT16=lambT16+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS16=ENS16+zz*CPLP16;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT16=MTTFT16+MTTRT+MTTFN;
                MTTFM(48)=MTTFT16;
        elseif I==49
                lambT17=lambT17+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS17=ENS17+zz*CPLP17;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT17=MTTFT17+MTTRT+MTTFN;
                MTTFM(49)=MTTFT17;
        elseif I==50
                lambT18=lambT18+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS18=ENS18+zz*CPLP18;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT18=MTTFT18+MTTRT+MTTFN;
                MTTFM(50)=MTTFT18;
        elseif I==51
                lambT19=lambT19+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS19=ENS19+zz*CPLP19;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT19=MTTFT19+MTTRT+MTTFN;
                MTTFM(51)=MTTFT19;
        elseif I==52
                lambT20=lambT20+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS20=ENS20+zz*CPLP20;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT20=MTTFT20+MTTRT+MTTFN;
                MTTFM(52)=MTTFT20;
        elseif I==53
                lambT21=lambT21+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS21=ENS21+zz*CPLP21;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT21=MTTFT21+MTTRT+MTTFN;
                MTTFM(53)=MTTFT21;
        else 
                lambT22=lambT22+1;
        % llamo el valor ponderado de la carga de la funcion carga    
               [zz]=cargaR(M);
        % Igual que I==33, para todo F2
               k=1;
               T=M;
               while k<=MTTRT
                     ENS22=ENS22+zz*CPLP22;
                     T=T+1;
                     [zz]=cargaR(T);
                     k=k+1;
               end          
                Uf=rand;
                MTTFN=-(log(Uf)/lambT)*8760;
                MTTFT22=MTTFT22+MTTRT+MTTFN;
                MTTFM(54)=MTTFT22;
        end 
        [M,I] = min(MTTFM(:));
    end
     
     % para F1
     LambLP1(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT1;
     LambLP2(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT2;
     LambLP3(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT3;
     LambLP4(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT4;
     LambLP5(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT5;
     LambLP6(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT6;
     LambLP7(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT7;
     LambLP8(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT8;
     LambLP9(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT9;
     LambLP10(n,1)=lambS1+lambS2+lambS3+lambS4+lambS5+lambS6+lambS7+lambS8+lambS9+lambS10+lambS11+lambS12+lambS13+lambS14+lambS15+lambS16+lambS17F+lambS18F+lambS19F+lambS20F+lambT10;
     LambLP11(n,1)=lambS1MG1+lambS2MG1+lambS3MG1+lambS4MG1+lambS5MG1+lambS6MG1+lambS7MG1+lambS8MG1+lambS9MG1+lambS10MG1+lambS11MG1+lambS12MG1+lambS13MG1+lambS14MG1+lambS15MG1+lambS16MG1+lambS17+lambS18+lambS19MG1+lambS20MG1+lambT11;  
     LambLP12(n,1)=lambS1MG1+lambS2MG1+lambS3MG1+lambS4MG1+lambS5MG1+lambS6MG1+lambS7MG1+lambS8MG1+lambS9MG1+lambS10MG1+lambS11MG1+lambS12MG1+lambS13MG1+lambS14MG1+lambS15MG1+lambS16MG1+lambS17+lambS18+lambS19MG1+lambS20MG1+lambT12;
     LambLP13(n,1)=lambS1MG2+lambS2MG2+lambS3MG2+lambS4MG2+lambS5MG2+lambS6MG2+lambS7MG2+lambS8MG2+lambS9MG2+lambS10MG2+lambS11MG2+lambS12MG2+lambS13MG2+lambS14MG2+lambS15MG2+lambS16MG2+lambS17MG2+lambS18MG2+lambS19+lambS20+lambT13;
     LambLP14(n,1)=lambS1MG2+lambS2MG2+lambS3MG2+lambS4MG2+lambS5MG2+lambS6MG2+lambS7MG2+lambS8MG2+lambS9MG2+lambS10MG2+lambS11MG2+lambS12MG2+lambS13MG2+lambS14MG2+lambS15MG2+lambS16MG2+lambS17MG2+lambS18MG2+lambS19+lambS20+lambT14;
     
     SAIFIF1D(n,1)=((LambLP1(n,1)*CLP1)+(LambLP2(n,1)*CLP2)+(LambLP3(n,1)*CLP3)+(LambLP4(n,1)*CLP4)+(LambLP5(n,1)*CLP5)+(LambLP6(n,1)*CLP6)+(LambLP7(n,1)*CLP7)+(LambLP8(n,1)*CLP8)+(LambLP9(n,1)*CLP9)+(LambLP10(n,1)*CLP10)+(LambLP11(n,1)*CLP11)+(LambLP12(n,1)*CLP12)+(LambLP13(n,1)*CLP13)+(LambLP14(n,1)*CLP14))/CF1;
     SAIFIF1DP(n,1)=(sum(sum(SAIFIF1D)))/n;
     LambPSLP14(n,1)=(sum(sum(LambLP14)))/n;

     ULP1(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT1*MTTRT);
     ULP2(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT2*MTTRT);
     ULP3(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT3*MTTRT);
     ULP4(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT4*MTTRT);
     ULP5(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT5*MTTRT); 
     ULP6(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT6*MTTRT);
     ULP7(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT7*MTTRT);
     ULP8(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT8*MTTRT);
     ULP9(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT9*MTTRT);
     ULP10(n,1)=(lambS1*MTTRL)+(lambS2*MTTRL)+(lambS3*MTTRL)+(lambS4*MTTRL)+(lambS5*MTTRL)+(lambS6*MTTRL)+(lambS7*MTTRL)+(lambS8*MTTRL)+(lambS9*MTTRL)+(lambS10*MTTRL)+(lambS11*MTTRL)+(lambS12*MTTRL)+(lambS13*MTTRL)+(lambS14*MTTRL)+(lambS15*MTTRL)+(lambS16*MTTRL)+(lambS17F*MTTRL)+(lambS18F*MTTRL)+(lambS19F*MTTRL)+(lambS20F*MTTRL)+(lambT10*MTTRT);
     ULP11(n,1)=(lambS1MG1*MTTRL)+(lambS2MG1*MTTRL)+(lambS3MG1*MTTRL)+(lambS4MG1*MTTRL)+(lambS5MG1*MTTRL)+(lambS6MG1*MTTRL)+(lambS7MG1*MTTRL)+(lambS8MG1*MTTRL)+(lambS9MG1*MTTRL)+(lambS10MG1*MTTRL)+(lambS11MG1*MTTRL)+(lambS12MG1*MTTRL)+(lambS13MG1*MTTRL)+(lambS14MG1*MTTRL)+(lambS15MG1*MTTRL)+(lambS16MG1*MTTRL)+(lambS17*MTTRL)+(lambS18*MTTRL)+(lambS19MG1*MTTRL)+(lambS20MG1*MTTRL)+(lambT11*MTTRT);
     ULP12(n,1)=(lambS1MG1*MTTRL)+(lambS2MG1*MTTRL)+(lambS3MG1*MTTRL)+(lambS4MG1*MTTRL)+(lambS5MG1*MTTRL)+(lambS6MG1*MTTRL)+(lambS7MG1*MTTRL)+(lambS8MG1*MTTRL)+(lambS9MG1*MTTRL)+(lambS10MG1*MTTRL)+(lambS11MG1*MTTRL)+(lambS12MG1*MTTRL)+(lambS13MG1*MTTRL)+(lambS14MG1*MTTRL)+(lambS15MG1*MTTRL)+(lambS16MG1*MTTRL)+(lambS17*MTTRL)+(lambS18*MTTRL)+(lambS19MG1*MTTRL)+(lambS20MG1*MTTRL)+(lambT12*MTTRT);
     ULP13(n,1)=(lambS1MG2*MTTRL)+(lambS2MG2*MTTRL)+(lambS3MG2*MTTRL)+(lambS4MG2*MTTRL)+(lambS5MG2*MTTRL)+(lambS6MG2*MTTRL)+(lambS7MG2*MTTRL)+(lambS8MG2*MTTRL)+(lambS9MG2*MTTRL)+(lambS10MG2*MTTRL)+(lambS11MG2*MTTRL)+(lambS12MG2*MTTRL)+(lambS13MG2*MTTRL)+(lambS14MG2*MTTRL)+(lambS15MG2*MTTRL)+(lambS16MG2*MTTRL)+(lambS17MG2*MTTRL)+(lambS18MG2*MTTRL)+(lambS19*MTTRL)+(lambS20*MTTRL)+(lambT13*MTTRT);
     ULP14(n,1)=(lambS1MG2*MTTRL)+(lambS2MG2*MTTRL)+(lambS3MG2*MTTRL)+(lambS4MG2*MTTRL)+(lambS5MG2*MTTRL)+(lambS6MG2*MTTRL)+(lambS7MG2*MTTRL)+(lambS8MG2*MTTRL)+(lambS9MG2*MTTRL)+(lambS10MG2*MTTRL)+(lambS11MG2*MTTRL)+(lambS12MG2*MTTRL)+(lambS13MG2*MTTRL)+(lambS14MG2*MTTRL)+(lambS15MG2*MTTRL)+(lambS16MG2*MTTRL)+(lambS17MG2*MTTRL)+(lambS18MG2*MTTRL)+(lambS19*MTTRL)+(lambS20*MTTRL)+(lambT14*MTTRT); 
     PULP14(n,1)=(sum(sum(ULP14)))/n;

     ENSLP1(n,1)=ENS1;
     ENSLP2(n,1)=ENS2;
     ENSLP3(n,1)=ENS3;
     ENSLP4(n,1)=ENS4;
     ENSLP5(n,1)=ENS5;
     ENSLP6(n,1)=ENS6;
     ENSLP7(n,1)=ENS7;
     ENSLP8(n,1)=ENS8;
     ENSLP9(n,1)=ENS9;
     ENSLP10(n,1)=ENS10;
     ENSLP11(n,1)=ENS11;
     ENSLP12(n,1)=ENS12;
     ENSLP13(n,1)=ENS13;
     ENSLP14(n,1)=ENS14;
     EENSF1D(n,1)=ENS1+ENS2+ENS3+ENS4+ENS5+ENS6+ENS7+ENS8+ENS9+ENS10+ENS11+ENS12+ENS13+ENS14;
     format shortEng
     EENSF1DP(n,1)=(sum(sum(EENSF1D)))/n;
     
     % para F2
     LambLP15(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT15;
     LambLP16(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT16;
     LambLP17(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT17;
     LambLP18(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT18;
     LambLP19(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT19;
     LambLP20(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT20;
     LambLP21(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT21;
     LambLP22(n,1)=lambS1+lambS21+lambS22+lambS23+lambS24+lambS25+lambS26+lambS27+lambS28+lambS29+lambS30+lambS31+lambS32+lambT22;
     LambPSLP15(n,1)=(sum(sum(LambLP15)))/n;
     
     ULP15(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT15*MTTRT);
     ULP16(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT16*MTTRT);
     ULP17(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT17*MTTRT);
     ULP18(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT18*MTTRT);
     ULP19(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT19*MTTRT);
     ULP20(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT20*MTTRT);
     ULP21(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT21*MTTRT);
     ULP22(n,1)=(lambS1*MTTRL)+(lambS21*MTTRL)+(lambS22*MTTRL)+(lambS23*MTTRL)+(lambS24*MTTRL)+(lambS25*MTTRL)+(lambS26*MTTRL)+(lambS27*MTTRL)+(lambS28*MTTRL)+(lambS29*MTTRL)+(lambS30*MTTRL)+(lambS31*MTTRL)+(lambS32*MTTRL)+(lambT22*MTTRT);
     PULP15(n,1)=(sum(sum(ULP15)))/n;
     
     ENSLP15(n,1)=ENS15;
     ENSLP16(n,1)=ENS16;
     ENSLP17(n,1)=ENS17;
     ENSLP18(n,1)=ENS18;
     ENSLP19(n,1)=ENS19;
     ENSLP20(n,1)=ENS20;
     ENSLP21(n,1)=ENS21;
     ENSLP22(n,1)=ENS22;
     
% contador de años
     n=n+1;
     
end
     
    % para F1
   LambSLP1=(sum(sum(LambLP1)))/years;
   LambSLP2=(sum(sum(LambLP2)))/years;
   LambSLP3=(sum(sum(LambLP3)))/years;
   LambSLP4=(sum(sum(LambLP4)))/years;
   LambSLP5=(sum(sum(LambLP5)))/years;
   LambSLP6=(sum(sum(LambLP6)))/years;
   LambSLP7=(sum(sum(LambLP7)))/years;
   LambSLP8=(sum(sum(LambLP8)))/years;
   LambSLP9=(sum(sum(LambLP9)))/years;
   LambSLP10=(sum(sum(LambLP10)))/years;
   LambSLP11=(sum(sum(LambLP11)))/years;
   LambSLP12=(sum(sum(LambLP12)))/years;
   LambSLP13=(sum(sum(LambLP13)))/years;
   LambSLP14=(sum(sum(LambLP14)))/years;
   LambSF1=(LambSLP1+LambSLP2+LambSLP3+LambSLP4+LambSLP5+LambSLP6+LambSLP7+LambSLP8+LambSLP9+LambSLP10+LambSLP11+LambSLP12+LambSLP13+LambSLP14)/14;
   USLP1=(sum(sum(ULP1)))/years;
   USLP2=(sum(sum(ULP2)))/years;
   USLP3=(sum(sum(ULP3)))/years;
   USLP4=(sum(sum(ULP4)))/years;
   USLP5=(sum(sum(ULP5)))/years;
   USLP6=(sum(sum(ULP6)))/years;
   USLP7=(sum(sum(ULP7)))/years;
   USLP8=(sum(sum(ULP8)))/years;
   USLP9=(sum(sum(ULP9)))/years;
   USLP10=(sum(sum(ULP10)))/years;
   USLP11=(sum(sum(ULP11)))/years;
   USLP12=(sum(sum(ULP12)))/years;
   USLP13=(sum(sum(ULP13)))/years;
   USLP14=(sum(sum(ULP14)))/years;
   USF1=(USLP1+USLP2+USLP3+USLP4+USLP5+USLP6+USLP7+USLP8+USLP9+USLP10+USLP11+USLP12+USLP13+USLP14)/14;
   rS1=USF1/LambSF1;
   
   SAIFIF1=((LambSLP1*CLP1)+(LambSLP2*CLP2)+(LambSLP3*CLP3)+(LambSLP4*CLP4)+(LambSLP5*CLP5)+(LambSLP6*CLP6)+(LambSLP7*CLP7)+(LambSLP8*CLP8)+(LambSLP9*CLP9)+(LambSLP10*CLP10)+(LambSLP11*CLP11)+(LambSLP12*CLP12)+(LambSLP13*CLP13)+(LambSLP14*CLP14))/CF1;
   SAIFIF1D1=(sum(sum(SAIFIF1D)))/years;
   SAIDIF1=((USLP1*CLP1)+(USLP2*CLP2)+(USLP3*CLP3)+(USLP4*CLP4)+(USLP5*CLP5)+(USLP6*CLP6)+(USLP7*CLP7)+(USLP8*CLP8)+(USLP9*CLP9)+(USLP10*CLP10)+(USLP11*CLP11)+(USLP12*CLP12)+(USLP13*CLP13)+(USLP14*CLP14))/CF1;
   CAIDIF1=SAIDIF1/SAIFIF1;
   ASAIF1=((CF1*8760)-((USLP1*CLP1)+(USLP2*CLP2)+(USLP3*CLP3)+(USLP4*CLP4)+(USLP5*CLP5)+(USLP6*CLP6)+(USLP7*CLP7)+(USLP8*CLP8)+(USLP9*CLP9)+(USLP10*CLP10)+(USLP11*CLP11)+(USLP12*CLP12)+(USLP13*CLP13)+(USLP14*CLP14)))/(CF1*8760);
   ASUIF1=1-ASAIF1;

   
   EENSLP1=(sum(sum(ENSLP1)))/years;
   EENSLP2=(sum(sum(ENSLP2)))/years;
   EENSLP3=(sum(sum(ENSLP3)))/years;
   EENSLP4=(sum(sum(ENSLP4)))/years;
   EENSLP5=(sum(sum(ENSLP5)))/years;
   EENSLP6=(sum(sum(ENSLP6)))/years;
   EENSLP7=(sum(sum(ENSLP7)))/years;
   EENSLP8=(sum(sum(ENSLP8)))/years;
   EENSLP9=(sum(sum(ENSLP9)))/years;
   EENSLP10=(sum(sum(ENSLP10)))/years;
   EENSLP11=(sum(sum(ENSLP11)))/years;
   EENSLP12=(sum(sum(ENSLP12)))/years;
   EENSLP13=(sum(sum(ENSLP13)))/years;
   EENSLP14=(sum(sum(ENSLP14)))/years;
   EENSF1=((sum(sum(ENSLP1)))+(sum(sum(ENSLP2)))+(sum(sum(ENSLP3)))+(sum(sum(ENSLP4)))+(sum(sum(ENSLP5)))+(sum(sum(ENSLP6)))+(sum(sum(ENSLP7)))+(sum(sum(ENSLP8)))+(sum(sum(ENSLP9)))+(sum(sum(ENSLP10)))+(sum(sum(ENSLP11)))+(sum(sum(ENSLP12)))+(sum(sum(ENSLP13)))+(sum(sum(ENSLP14))))/years;
   
   % para F2
   LambSLP15=(sum(sum(LambLP15)))/years;
   LambSLP16=(sum(sum(LambLP16)))/years;
   LambSLP17=(sum(sum(LambLP17)))/years;
   LambSLP18=(sum(sum(LambLP18)))/years;
   LambSLP19=(sum(sum(LambLP19)))/years;
   LambSLP20=(sum(sum(LambLP20)))/years;
   LambSLP21=(sum(sum(LambLP21)))/years;
   LambSLP22=(sum(sum(LambLP22)))/years;
   LambSF2=(LambSLP15+LambSLP16+LambSLP17+LambSLP18+LambSLP19+LambSLP20+LambSLP21+LambSLP22)/8;
   USLP15=(sum(sum(ULP15)))/years;
   USLP16=(sum(sum(ULP16)))/years;
   USLP17=(sum(sum(ULP17)))/years;
   USLP18=(sum(sum(ULP18)))/years;
   USLP19=(sum(sum(ULP19)))/years;
   USLP20=(sum(sum(ULP20)))/years;
   USLP21=(sum(sum(ULP21)))/years;
   USLP22=(sum(sum(ULP22)))/years;
   USF2=(USLP15+USLP16+USLP17+USLP18+USLP19+USLP20+USLP21+USLP22)/8;
   rS2=USF2/LambSF2;
   
   SAIFIF2=((LambSLP15*CLP15)+(LambSLP16*CLP16)+(LambSLP17*CLP17)+(LambSLP18*CLP18)+(LambSLP19*CLP19)+(LambSLP20*CLP20)+(LambSLP21*CLP21)+(LambSLP22*CLP22))/CF2;
   SAIDIF2=((USLP15*CLP15)+(USLP16*CLP16)+(USLP17*CLP17)+(USLP18*CLP18)+(USLP19*CLP19)+(USLP20*CLP20)+(USLP21*CLP21)+(USLP22*CLP22))/CF2;
   CAIDIF2=SAIDIF2/SAIFIF2;
   ASAIF2=((CF2*8760)-((USLP15*CLP15)+(USLP16*CLP16)+(USLP17*CLP17)+(USLP18*CLP18)+(USLP19*CLP19)+(USLP20*CLP20)+(USLP21*CLP21)+(USLP22*CLP22)))/(CF2*8760);
   ASUIF2=1-ASAIF2;
   
   EENSLP15=(sum(sum(ENSLP15)))/years;
   EENSLP16=(sum(sum(ENSLP16)))/years;
   EENSLP17=(sum(sum(ENSLP17)))/years;
   EENSLP18=(sum(sum(ENSLP18)))/years;
   EENSLP19=(sum(sum(ENSLP19)))/years;
   EENSLP20=(sum(sum(ENSLP20)))/years;
   EENSLP21=(sum(sum(ENSLP21)))/years;
   EENSLP22=(sum(sum(ENSLP22)))/years;
 
   EENSF2=((sum(sum(ENSLP15)))+(sum(sum(ENSLP16)))+(sum(sum(ENSLP17)))+(sum(sum(ENSLP18)))+(sum(sum(ENSLP19)))+(sum(sum(ENSLP20)))+(sum(sum(ENSLP21)))+(sum(sum(ENSLP21))))/years;
   
   % para los puntos de carga en las MGs
   EENSLPET=EENSLP11+EENSLP12+EENSLP13+EENSLP14;
   CLPE=(CLP11+CLP12+CLP13+CLP14);
   SAIFILPE=((LambSLP11*CLP11)+(LambSLP12*CLP12)+(LambSLP13*CLP13)+(LambSLP14*CLP14))/CLPE;
   SAIDILPE=((USLP11*CLP11)+(USLP12*CLP12)+(USLP13*CLP13)+(USLP14*CLP14))/CLPE;
   CAIDILPE=SAIDILPE/SAIFILPE;
   ASAILPE=((CLPE*8760)-((USLP11*CLP11)+(USLP12*CLP12)+(USLP13*CLP13)+(USLP14*CLP14)))/(CLPE*8760);
   ASUILPE=1-ASAILPE;
   
   SAIFIST=((LambSLP1*CLP1)+(LambSLP2*CLP2)+(LambSLP3*CLP3)+(LambSLP4*CLP4)+(LambSLP5*CLP5)+(LambSLP6*CLP6)+(LambSLP7*CLP7)+(LambSLP8*CLP8)+(LambSLP9*CLP9)+(LambSLP10*CLP10)+(LambSLP11*CLP11)+(LambSLP12*CLP12)+(LambSLP13*CLP13)+(LambSLP14*CLP14)+(LambSLP15*CLP15)+(LambSLP16*CLP16)+(LambSLP17*CLP17)+(LambSLP18*CLP18)+(LambSLP19*CLP19)+(LambSLP20*CLP20)+(LambSLP21*CLP21)+(LambSLP22*CLP22))/CTS;
   EENST=(((sum(sum(ENSLP1)))+(sum(sum(ENSLP2)))+(sum(sum(ENSLP3)))+(sum(sum(ENSLP4)))+(sum(sum(ENSLP5)))+(sum(sum(ENSLP6)))+(sum(sum(ENSLP7)))+(sum(sum(ENSLP8)))+(sum(sum(ENSLP9)))+(sum(sum(ENSLP10)))+(sum(sum(ENSLP11)))+(sum(sum(ENSLP12)))+(sum(sum(ENSLP13)))+(sum(sum(ENSLP14))))+(sum(sum(ENSLP15)))+(sum(sum(ENSLP16)))+(sum(sum(ENSLP17)))+(sum(sum(ENSLP18)))+(sum(sum(ENSLP19)))+(sum(sum(ENSLP20)))+(sum(sum(ENSLP21)))+(sum(sum(ENSLP21))))/years; 
   
   format short
   LambSLP=[LambSLP1 LambSLP2 LambSLP3 LambSLP4 LambSLP5 LambSLP6 LambSLP7 LambSLP8 LambSLP9 LambSLP10 LambSLP11 LambSLP12 LambSLP13 LambSLP14 LambSLP15 LambSLP16 LambSLP17 LambSLP18 LambSLP19 LambSLP20 LambSLP21 LambSLP22]
   USLP=[USLP1 USLP2 USLP3 USLP4 USLP5 USLP6 USLP7 USLP8 USLP9 USLP10 USLP11 USLP12 USLP13 USLP14 USLP15 USLP16 USLP17 USLP18 USLP19 USLP20 USLP21 USLP22]
   EENSLP=[EENSLP1 EENSLP2 EENSLP3 EENSLP4 EENSLP5 EENSLP6 EENSLP7 EENSLP8 EENSLP9 EENSLP10 EENSLP11 EENSLP12 EENSLP13 EENSLP14 EENSLP15 EENSLP16 EENSLP17 EENSLP18 EENSLP19 EENSLP20 EENSLP21 EENSLP22]
   LambSLPE=[LambSLP11 LambSLP12 LambSLP13 LambSLP14]
   USLPE=[USLP11 USLP12 USLP13 USLP14]
   EENSLPE=[EENSLP11 EENSLP12 EENSLP13 EENSLP14]
   INDFE=[SAIFILPE SAIDILPE CAIDILPE ASAILPE ASUILPE]
   INDFB=[LambSF1 USF1 rS1; LambSF2 USF2 rS2]
   INDF=[SAIFIF1 SAIDIF1 CAIDIF1 ASAIF1 ASUIF1; SAIFIF2 SAIDIF2 CAIDIF2 ASAIF2 ASUIF2]
   EENSF=[EENSF1 EENSF2 EENSLPET EENST]
   
   figure,plot(SAIFIF1DP)
   
   hold on
   %plot(PULP15)
   %plot(LambLP3B)
   %plot(LambLP14B)
   %set(gca,'fontsize',18);
   %xlabel('Muestras(año)')
   %ylabel('Cantidad de Fallas')
   %axis([0 time 0 400]); 
   %legend('Punto de Carga 14','Punto de Carga 15')