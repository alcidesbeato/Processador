-- Alcides Gomes Beato Neto 19060987   
-- Thiago Loureiro Kosciuk 21005277
-- Registrador

LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R2 IS
	PORT (
		Dado2In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado 
		R2In: IN STD_LOGIC; -- Sinal de Entrada
		R2Out: IN STD_LOGIC; -- Sinal de Saida
		Reset : IN STD_LOGIC ; -- Sinal de Reset
		Clock : IN STD_LOGIC ; -- Sinal de Clock
		Dado2Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0) -- Buffer de armazenamento do dado
	); 
END R2 ;

ARCHITECTURE Behavior OF R2 IS
	BEGIN
		PROCESS (Dado2In, R2In, R2Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF R2In = '1' THEN
						-- Sinal de entrada ativo, dado é armazenado
						DadoArmazenado <= Dado2In ;
					ELSIF R2Out = '1' THEN
						-- Sinal de saida ativo, dado é retirado
						Dado2Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;