-- Alcides Gomes Beato Neto 19060987   
-- Thiago Loureiro Kosciuk 21005277
-- Data

LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Data IS
	PORT (
		DadoIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
		Extern: IN STD_LOGIC; -- Sinal de entrada 
		DadoOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Vetor de saida do dado
	);
END Data ;

ARCHITECTURE Behavior OF Data IS
	BEGIN
		PROCESS(DadoIn, Extern)
			BEGIN
			IF Extern = '1' THEN
				-- Sinal de entrada ativo, dado entra 
                DadoOut <= DadoIn;
			END IF;
		END PROCESS ;
END Behavior ;