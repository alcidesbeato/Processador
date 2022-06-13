LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R1 IS
	PORT (
		Dado1In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		R1In: IN STD_LOGIC;
		R1Out: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Dado1Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
	);
END R1 ;

ARCHITECTURE Behavior OF R1 IS
	BEGIN
		PROCESS (Dado1In, R1In, R1Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Zerando o valor do Dado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
				 	- Funciona apenas quando clock for igual a 1
					IF R1In = '1' THEN
						-- Dado é armazenado
						DadoArmazenado <= Dado1In ;
					ELSIF R1Out = '1' THEN
						-- Dado é retirado
						Dado1Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;