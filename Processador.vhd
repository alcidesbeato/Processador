LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Processador IS
	PORT( 
        Clock,Reset :IN STD_LOGIC
    );
END Processador;

ARCHITECTURE Behavior OF Processador IS
    COMPONENT Data IS
        PORT (
            DadoIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            Extern: IN STD_LOGIC;
            DadoOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT R0 IS
        PORT (
            Dado0In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            R0In: IN STD_LOGIC;
            R0Out: IN STD_LOGIC;
            Reset : IN STD_LOGIC ;
            Clock : IN STD_LOGIC ;
            Dado0Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT R1 IS
        PORT (
            Dado1In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            R1In: IN STD_LOGIC;
            R1Out: IN STD_LOGIC;
            Reset : IN STD_LOGIC ;
            Clock : IN STD_LOGIC ;
            Dado1Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT R2 IS
        PORT (
            Dado2In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            R2In: IN STD_LOGIC;
            R2Out: IN STD_LOGIC;
            Reset : IN STD_LOGIC ;
            Clock : IN STD_LOGIC ;
            Dado2Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT R3 IS
        PORT (
            Dado3In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            R3In: IN STD_LOGIC;
            R3Out: IN STD_LOGIC;
            Reset : IN STD_LOGIC ;
            Clock : IN STD_LOGIC ;
            Dado3Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT RG IS
        PORT (
            DadoGIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
            RGIn: IN STD_LOGIC;
            RGOut: IN STD_LOGIC;
            Reset : IN STD_LOGIC ;
            Clock : IN STD_LOGIC ;
            DadoGOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT RA IS
	PORT (
		DadoAIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		RAIn: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		DadoAOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
    END COMPONENT ;

   COMPONENT ULA IS
	PORT ( 
			A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			AddSub : IN STD_LOGIC ;
			AluOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			RAIn: IN STD_LOGIC;
			Reset : IN STD_LOGIC ;
			Clock : IN STD_LOGIC ;
			DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
			) ;
    END COMPONENT ;

    COMPONENT controlCircuit IS
    PORT (
        Clock, Reset: IN STD_LOGIC;
		  W, Func: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        R0In, R0Out, R1In, R1Out, R2In, R2Out, R3In, R3Out, RGIn, RGOut, RAIn: OUT STD_LOGIC;
        AddSub, Extern, Done: OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL R0_In, R0_Out, R1_In, R1_Out, R2_In, R2_Out, R3_In, R3_Out, RG_In, RG_Out, RA_In,Add_Sub, extern, done  : STD_LOGIC;
	 SIGNAL w,func: STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Dado_In, Dado_Out, Dado0_Out, Dado1_Out, Dado2_Out, Dado3_Out, DadoA_Out, DadoG_Out  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
BEGIN
    Dado: DATA PORT MAP (Dado_In, extern, Dado_Out);

    Reg0: R0 PORT MAP (Dado_Out, R0_In, R0_Out, Reset, Clock, Dado0_Out);

    Reg1: R1 PORT MAP (Dado_Out, R1_In, R1_Out, Reset, Clock, Dado1_Out);

    Reg2: R2 PORT MAP (Dado_Out, R2_In, R2_Out, Reset, Clock, Dado2_Out);

    Reg3: R3 PORT MAP (Dado_Out, R3_In, R3_Out, Reset, Clock, Dado3_Out);

    RegA: RA PORT MAP (Dado_Out, RA_In, Reset, Clock, DadoA_Out);

    RegG: RG PORT MAP (Dado_Out, RG_In, RG_Out, Reset, Clock, DadoG_Out);

    UnidadeLogicaAritmetica: ULA PORT MAP(DadoA_Out, Dado_Out, Add_Sub, DadoG_Out, RA_In, Reset, Clock);

    ControleCircuito: controlCircuit PORT MAP (Clock, Reset, w, func, R0_In, R0_Out, R1_In, R1_Out, R2_In, R3_Out, RG_In, RG_Out, RA_In, Add_Sub, extern, done);

END Behavior ;