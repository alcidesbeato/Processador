LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RG IS
GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 
			RGin : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			RGout : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END RG ;

ARCHITECTURE Behavior OF RG IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						RGout <= RGin ;
					ELSE
						Genbits: FOR i IN 0 TO N-2 LOOP
						RGout(i) <= RGout(i+1) ;
						END LOOP ;
						RGout(N-1) <= w ;
					END IF ;
	END PROCESS ;
END Behavior ;