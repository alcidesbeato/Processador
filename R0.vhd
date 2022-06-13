LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R0 IS
	PORT (
		Dado0In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		R0In: IN STD_LOGIC;
		R0Out: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Dado0Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
	);
END R0 ;

ARCHITECTURE Behavior OF R0 IS
	BEGIN
		PROCESS (Dado0In, R0In, R0Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
			-- Zerando o valor do Dado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF R0In = '1' THEN
					-- Dado é armazenado
						DadoArmazenado <= Dado0In ;
					ELSIF R0Out = '1' THEN
					-- Dado é retirado
						Dado0Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;