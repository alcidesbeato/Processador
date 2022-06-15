LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RA IS
	PORT (
		DadoAIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
		RAIn: IN STD_LOGIC; -- Sinal de Entrada
		Reset : IN STD_LOGIC ; -- Sinal de Reset
		Clock : IN STD_LOGIC ; -- Sinal de Clock
		DadoAOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) -- Buffer de armazenamento do dado
	);
END RA ;

ARCHITECTURE Behavior OF RA IS
	BEGIN
		PROCESS (DadoAIn, RAIn, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1
					IF RAIn = '1' THEN
						-- Sinal de entrada ativo, dado é retirado
						DadoArmazenado <= DadoAIn;
						DadoAOut <= DadoArmazenado;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;