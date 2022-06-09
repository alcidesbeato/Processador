LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Reg IS
	PORT ( 
			Rin : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			ROut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) ) ;
END Reg ;

ARCHITECTURE Behavior OF Reg IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						ROut <= Rin ;
					ELSE
						Genbits: FOR i IN 0 TO 6 LOOP
						ROut(i) <= ROut(i+1) ;
						END LOOP ;
						ROut(7) <= w ;
					END IF ;
	END PROCESS ;
END Behavior ;