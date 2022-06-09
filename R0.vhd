LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R IS
	PORT ( 
			Rin : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			ROut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) ) ;
END R ;

ARCHITECTURE Behavior OF R IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						ROut <= Rin ;
					ELSE
						Rout<= '0';
					END IF ;
	END PROCESS ;
END Behavior ;