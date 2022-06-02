LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT ( 
			A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			AluIn : IN STD_LOGIC ;
			AluOut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) ) ;
END ULA ;

ARCHITECTURE Behavior OF ULA IS
	BEGIN
		PROCESS
			BEGIN
					IF AluIn = '1' THEN
						AluOut <= A + B ;
					ELSE
						AluOut <= A - B ;
					END IF ;
	END PROCESS ;
END Behavior ;