LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RG IS
	PORT (
		DadoGIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
		RGIn: IN STD_LOGIC;  -- Sinal de Entrada
		RGOut: IN STD_LOGIC; -- Sinal de saida
		Reset : IN STD_LOGIC ; -- Sinal de Reset
		Clock : IN STD_LOGIC ; -- Sinal de Clock 
		DadoGOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
	);
END RG ;

ARCHITECTURE Behavior OF RG IS
	BEGIN
		PROCESS (DadoGIn, RGIn, RGOut, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF RGIn = '1' THEN
						-- Sinal de entrada ativo, dado é armazenado
						DadoArmazenado <= DadoGIn ;
					ELSIF RGOut = '1' THEN
						-- Sinal de saida rada ativo, dado é retirado
						DadoGOut <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;