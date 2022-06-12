LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RA IS
	PORT (
		DadoAIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		RAIn: IN STD_LOGIC;
		Reset : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		DadoAOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		DadoArmazenado: BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END RA ;

ARCHITECTURE Behavior OF RA IS
	BEGIN
		PROCESS (DadoAIn, RAIn, Reset, Clock, DadoArmazenado)
			BEGIN
			IF Reset = '1' THEN
				DadoArmazenado <= "00000000";
			ELSE
				IF Clock'EVENT AND Clock = '1' THEN
					IF RAIn = '1' THEN
						DadoArmazenado <= DadoAIn ;
					END IF ;
				END IF;
			END IF;
		END PROCESS ;
END Behavior ;