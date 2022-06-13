LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RG IS
	PORT (
		DadoGIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		RGIn: IN STD_LOGIC;
		RGOut: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		DadoGOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
	);
END RG ;

ARCHITECTURE Behavior OF RG IS
	BEGIN
		PROCESS (DadoGIn, RGIn, RGOut, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Zerando o valor do Dado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF RGIn = '1' THEN
						-- Dado é armazenado
						DadoArmazenado <= DadoGIn ;
					ELSIF RGOut = '1' THEN
						-- Dado é retirado
						DadoGOut <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;