LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT ( 
			A: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
			B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ; -- Vetor de entrada do dado
			AddSub : IN STD_LOGIC ; -- Sinal de adicao ou subtracao
			AluOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Vetor de saida do dado
			RAIn: IN STD_LOGIC; -- Sinal de entrada
			Reset : IN STD_LOGIC ; -- Sinal de Reset
			Clock : IN STD_LOGIC ; -- Sinal de Clock
			DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) -- Buffer de armazenamento do dado
			) ;
END ULA ;

ARCHITECTURE Behavior OF ULA IS
	BEGIN
		PROCESS(A,B, AddSub, RAIn, Reset, Clock)
			BEGIN
			IF Reset = '1' THEN
				-- Sinal de reset ativo, zera o valor do dado armazenado
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					-- Funciona apenas quando clock for igual a 1

					IF RAIn = '1' THEN
						-- Sinal de entrada ativo, dado é armazenado
						DadoArmazenado <= A ;
					ELSIF AddSub = '0' THEN
						-- Soma é executada
						AluOut <= DadoArmazenado + B ;
					ELSIF AddSub = '1' THEN
						-- Subtração é executada
						AluOut <= DadoArmazenado - B ;
					END IF;
				END IF;
			END IF ;
		END PROCESS ;
END Behavior ;