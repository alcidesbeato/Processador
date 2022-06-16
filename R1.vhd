-- Alcides Gomes Beato Neto 19060987   
-- Thiago Loureiro Kosciuk 21005277
-- Registrador

LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R1 IS
	PORT (
		Dado1In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado 
		R1In: IN STD_LOGIC; -- Sinal de Entrada
		R1Out: IN STD_LOGIC; -- Sinal de Saida
		Reset : IN STD_LOGIC ; -- Sinal de Reset
		Clock : IN STD_LOGIC ; -- Sinal de Clock
		Dado1Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)  -- Buffer de armazenamento do dado
	);
END R1 ;

ARCHITECTURE Behavior OF R1 IS
	BEGIN
		PROCESS (Dado1In, R1In, R1Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
				 	-- Funciona apenas quando clock for igual a 1
					IF R1In = '1' THEN
						-- Sinal de entrada ativo, dado é armazenado
						DadoArmazenado <= Dado1In ;
					ELSIF R1Out = '1' THEN
						-- Sinal de saida ativo, dado é retirado
						Dado1Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;