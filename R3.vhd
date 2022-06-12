LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R3 IS
	PORT (
		Dado3In : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		R3In: IN STD_LOGIC;
		R3Out: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Dado3Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR( 7 DOWNTO 0)
	);
END R3 ;

ARCHITECTURE Behavior OF R3 IS
	BEGIN
		PROCESS (Dado3In, R3In, R3Out, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					IF R3In = '1' THEN
						DadoArmazenado <= Dado3In ;
					ELSIF R3Out = '1' THEN
						Dado3Out <= DadoArmazenado ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;