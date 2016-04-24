// Dissertação de Mestrado - Programa de Engenharia de Transportes - PET/COPPE/UFRJ
//
// File created on : Terça 17/Março/2015 15h
// Marcello Victorino
//
// Aplicado ao Banco de Dados #02 - Pós Limpeza de Outliers - Estratificação Alunos
// 2 alternativas: Carro ; TPub (Opções de transporte público)
// Modelo CONSTANTES (ASC) + Específicas de alternativas (CUSTO+TEMPO)

[DataFile]
$COLUMNS = 28

[Choice]
Choice

[Beta]
// Name Value  LowerBound UpperBound  status (0=variable, 1=fixed)
ASC_1	    0.0          -15.0     15.0         1
ASC_2	    0.0          -15.0     15.0         0
B1_CUSTO	0.0			 -15.0	   15.0			0
B2_CUSTO	0.0			 -15.0	   15.0			0
B1_TTIME	0.0			 -150.0	   150.0		0
B2_TTIME	0.0			 -15.0	   15.0			0

[Utilities]
// Id   Name  	Avail  linear-in-parameter expression (beta1*x1 + beta2*x2 + ... )
  1     Carro   one   	ASC_1 * one + B1_CUSTO * Cost_2 + B1_TTIME * TTime1_1 
  2     TPub    one   	ASC_2 * one + B2_CUSTO * Cost_2 + B2_TTIME * TTime1_2  


[Expressions] 
// Define here arithmetic expressions for name that are not directly 
// available from the data
one = 1


[Model]
// Currently, only $MNL (multinomial logit), $NL (nested logit), $CNL
// (cross-nested logit) and $NGEV (Network GEV model) are valid keywords
$MNL
