LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT ( 
			A: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			AddSub : IN STD_LOGIC ;
			AluOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			RAIn: IN STD_LOGIC;
			Reset : IN STD_LOGIC ;
			Clock : IN STD_LOGIC ;
			DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
			) ;
END ULA ;

ARCHITECTURE Behavior OF ULA IS
	BEGIN
		PROCESS(A,B, AddSub, RAIn, Reset, Clock)
			BEGIN
			IF Reset = '1' THEN
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					IF RAIn = '1' THEN
						DadoArmazenado <= A ;
					ELSIF AddSub = '1' THEN
						AluOut <= DadoArmazenado + B ;
					ELSIF AddSub = '0' THEN
						AluOut <= DadoArmazenado - B ;
					END IF;
				END IF;
			END IF ;
		END PROCESS ;
END Behavior ;