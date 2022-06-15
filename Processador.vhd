LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Processador IS
	PORT( 
        Clock,Reset :IN STD_LOGIC -- Sinais de clock e Reset
    );
END Processador;

ARCHITECTURE Behavior OF Processador IS
    -- Componente do Dado
    COMPONENT Data IS
        PORT (
            DadoIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            Extern: IN STD_LOGIC; -- Sinal de Entrada
            DadoOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Vetor de saida do dado
        );
    END COMPONENT ;

    -- Componente do Registrador 0
    COMPONENT R0 IS
        PORT (
            Dado0In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            R0In: IN STD_LOGIC; -- Sinal de Entrada
            R0Out: IN STD_LOGIC; -- Sinal de saida
            Reset : IN STD_LOGIC ; -- Sinal de Reset
            Clock : IN STD_LOGIC ; -- Sinal de Clock
            Dado0Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
        );
    END COMPONENT ;

    -- Componente do Registrador 1
    COMPONENT R1 IS
        PORT (
            Dado1In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            R1In: IN STD_LOGIC; -- Sinal de Entrada
            R1Out: IN STD_LOGIC; -- Sinal de saida
            Reset : IN STD_LOGIC ; -- Sinal de Reset
            Clock : IN STD_LOGIC ; -- Sinal de Clock
            Dado1Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
        );
    END COMPONENT ;

    -- Componente do Registrador 2
    COMPONENT R2 IS
        PORT (
            Dado2In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            R2In: IN STD_LOGIC; -- Sinal de Entrada
            R2Out: IN STD_LOGIC; -- Sinal de saida
            Reset : IN STD_LOGIC ; -- Sinal de Reset
            Clock : IN STD_LOGIC ; -- Sinal de Clock
            Dado2Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
        );
    END COMPONENT ;

    -- Componente do Registrador 3
    COMPONENT R3 IS
        PORT (
            Dado3In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            R3In: IN STD_LOGIC; -- Sinal de Entrada
            R3Out: IN STD_LOGIC; -- Sinal de saida
            Reset : IN STD_LOGIC ; -- Sinal de Reset
            Clock : IN STD_LOGIC ; -- Sinal de Clock
            Dado3Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
        ); 
    END COMPONENT ;

    -- Componente do Registrador G
    COMPONENT RG IS
        PORT (
            DadoGIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
            RGIn: IN STD_LOGIC; -- Sinal de Entrada
            RGOut: IN STD_LOGIC; -- Sinal de saida
            Reset : IN STD_LOGIC ;-- Sinal de Reset
            Clock : IN STD_LOGIC ; -- Sinal de Clock
            DadoGOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
        );
    END COMPONENT ;
        
    -- Componente do Registrador A
    COMPONENT RA IS
		PORT (
			DadoAIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
			RAIn: IN STD_LOGIC; -- Sinal de Entrada
			Reset : IN STD_LOGIC ; -- Sinal de Reset
			Clock : IN STD_LOGIC ;  -- Sinal de Clock
			DadoAOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
			DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) -- Buffer de armazenamento do dado
		); 
    END COMPONENT ;
        
    -- Componente da Unidade Logica Aritmetica
   COMPONENT ULA IS
		PORT ( 
				A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
				AddSub : IN STD_LOGIC ; -- Sinal de adicao ou subtracao
				AluOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
				RAIn: IN STD_LOGIC; -- Sinal de Entrada
				Reset : IN STD_LOGIC ; -- Sinal de Reset
				Clock : IN STD_LOGIC ; -- Sinal de Clock
				DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) -- Buffer de armazenamento do dado
				) ;
    END COMPONENT ;

    -- Componente do circuito de controle
    COMPONENT controlCircuit IS
		 PORT (
			  Clock, Reset: IN STD_LOGIC; -- Sinais de Clock e Reset
			  W, Func: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Vetor de sinais de entrada
			  R0In, R0Out, R1In, R1Out, R2In, R2Out, R3In, R3Out, RGIn, RGOut, RAIn: OUT STD_LOGIC; -- Sinais de saida
			  AddSub, Extern, Done: OUT STD_LOGIC -- Sinais de saida
			  );
    END COMPONENT;
	
		-- Sinais internos para ligacao
    SIGNAL R0_In, R0_Out, R1_In, R1_Out, R2_In, R2_Out, R3_In, R3_Out, RG_In, RG_Out, RA_In,Add_Sub, extern, done  : STD_LOGIC;
	SIGNAL w, func: STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Dado_In, Dado_Out, Dado0_Out, Dado1_Out, Dado2_Out, Dado3_Out, DadoA_Out, DadoG_Out  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
BEGIN
        Dado: DATA PORT MAP (Dado_In, extern, Dado_Out); -- Componente do dado

        Reg0: R0 PORT MAP (Dado_Out, R0_In, R0_Out, Reset, Clock, Dado0_Out); -- Componente do registrador 0

        Reg1: R1 PORT MAP (Dado_Out, R1_In, R1_Out, Reset, Clock, Dado1_Out); -- Componente do registrador 1

        Reg2: R2 PORT MAP (Dado_Out, R2_In, R2_Out, Reset, Clock, Dado2_Out); -- Componente do registrador 2

        Reg3: R3 PORT MAP (Dado_Out, R3_In, R3_Out, Reset, Clock, Dado3_Out); -- Componente do registrador 3

        RegA: RA PORT MAP (Dado_Out, RA_In, Reset, Clock, DadoA_Out); -- Componente do registrador A

        RegG: RG PORT MAP (Dado_Out, RG_In, RG_Out, Reset, Clock, DadoG_Out); -- Componente do registrador G

        UnidadeLogicaAritmetica: ULA PORT MAP(DadoA_Out, Dado_Out, Add_Sub, DadoG_Out, RA_In, Reset, Clock); -- Componente da unidade logica aritmetica
        
        ControleCircuito: controlCircuit PORT MAP (Clock, Reset, w, func, R0_In, R0_Out, R1_In, R1_Out, R2_In, R3_Out, RG_In, RG_Out, RA_In, Add_Sub, extern, done); -- Componente da unidade de controle
END Behavior ;