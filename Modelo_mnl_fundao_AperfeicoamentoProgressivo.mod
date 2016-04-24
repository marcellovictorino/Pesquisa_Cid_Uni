// Dissertação de Mestrado - Programa de Engenharia de Transportes - PET/COPPE/UFRJ
//
// File created on : Terça 01/Abril/2015 16h
// Marcello Victorino
//
// Aplicado ao Banco de Dados #02 - Pós Limpeza de Outliers - Estratificação: Alunos
// 2 alternativas: Carro ; TPub (Opções de transporte público)
// Aperfeiçoamento progressivo - Investigação do Modelo adequado
//
// Fixado o parâmetro da Alternativa 1: Automóvel

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
B1_TTIME	0.0			 -15.0	   15.0			0
B2_TTIME	0.0			 -15.0	   15.0			0
//B0_DIST	0.0			 -15.0	   15.0			0 - Não Significativo
B0_HOMEM	0.0			 -15.0	   15.0			0
B0_RENDA	0.0			 -15.0	   15.0			0
//B2_ACESS	0.0			 -10.0	   10.0			0 - Não significativo
B0_IDADE	0.0			 -10.0	   10.0			0
B0_QTDVEIC	0.0			 -10.0	   10.0			0
//B0_TCHAIN	0.0			 -10.0	   10.0			0 - Não significativo
B0_CT		0.0			 -10.0	   10.0			0
//B0_EDU	0.0			 -10.0	   10.0			0 - Descartado
//B0_TURIST	0.0			 -10.0	   10.0			0 - Não significativo
//B0_FDS	0.0			 -10.0	   10.0			0 - Não significativo


[Utilities]
// Id   Name  	Avail  linear-in-parameter expression (beta1*x1 + beta2*x2 + ... )
  1     Carro   one   	ASC_1 * one + B1_CUSTO * Cost_1 + B1_TTIME * TTime1_1 
  2     TPub    one   	ASC_2 * one + B2_CUSTO * Cost_2 + B2_TTIME * TTime1_2 + B0_HOMEM * D_Male + B0_IDADE * Age + B0_RENDA * Income_Mil + B0_QTDVEIC * QtdVeic + B0_CT * D1_CT 


[Expressions] 
// Define here arithmetic expressions for name that are not directly 
// available from the data
one = 1
Income_Mil = Income / 1000

[Model]
// Currently, only $MNL (multinomial logit), $NL (nested logit), $CNL
// (cross-nested logit) and $NGEV (Network GEV model) are valid keywords
$MNL
