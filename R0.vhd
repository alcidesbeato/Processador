LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R0 IS
GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 
			R0in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			R0Out : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END R0 ;

ARCHITECTURE Behavior OF R0 IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						R0Out <= R0in ;
					ELSE
						Genbits: FOR i IN 0 TO N-2 LOOP
						R0Out(i) <= R0Out(i+1) ;
						END LOOP ;
						R0Out(N-1) <= w ;
					END IF ;
	END PROCESS ;
END Behavior ;