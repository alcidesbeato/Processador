LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R2 IS
	PORT (
		Dado2In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		R2In: IN STD_LOGIC;
		R2Out: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Dado2Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
	);
END R2 ;

ARCHITECTURE Behavior OF R2 IS
	BEGIN
		PROCESS (Dado2In, R2In, R2Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Zerando o valor do Dado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF R2In = '1' 
						-- Dado é armazenado
						DadoArmazenado <= Dado2In ;
					ELSIF R2Out = '1' THEN
						-- Dado é retirado
						Dado2Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;