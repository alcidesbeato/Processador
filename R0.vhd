LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R0 IS
	PORT (
		Dado0In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
		R0In: IN STD_LOGIC; -- Sinal de Entrada
		R0Out: IN STD_LOGIC; -- Sinal de Saida
		Reset : IN STD_LOGIC ; -- Sinal de Reset
		Clock : IN STD_LOGIC ; -- Sinal de Clock
		Dado0Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
	);
END R0 ;

ARCHITECTURE Behavior OF R0 IS
	BEGIN
		PROCESS (Dado0In, R0In, R0Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF R0In = '1' THEN
						-- Sinal de entrada ativo, dado é armazenado
						DadoArmazenado <= Dado0In ;
					ELSIF R0Out = '1' THEN
						-- Sinal de saida ativo, dado é retirado
						Dado0Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;