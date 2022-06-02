LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY R2 IS
GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 
			R2in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			R2Out : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END R2 ;

ARCHITECTURE Behavior OF R2 IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						R2Out <= R2in ;
					ELSE
						Genbits: FOR i IN 0 TO N-2 LOOP
						R2Out(i) <= R2Out(i+1) ;
						END LOOP ;
						R2Out(N-1) <= w ;
					END IF ;
	END PROCESS ;
END Behavior ;