LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Data IS
	PORT (
		DadoIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		Extern: IN STD_LOGIC;
		DadoOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Data ;

ARCHITECTURE Behavior OF Data IS
	BEGIN
		PROCESS(DadoIn, Extern)
			BEGIN
			IF Extern = '1' THEN
                DadoOut <= DadoIn;
			END IF;
		END PROCESS ;
END Behavior ;