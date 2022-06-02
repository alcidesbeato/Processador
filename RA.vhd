LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY RA IS
GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 
			RAin : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			RAOut : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END RA ;

ARCHITECTURE Behavior OF RA IS
	BEGIN
		PROCESS
			BEGIN
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
					IF L = '1' THEN
						RAOut <= RAin ;
					ELSE
						Genbits: FOR i IN 0 TO N-2 LOOP
						RAOut(i) <= RAOut(i+1) ;
						END LOOP ;
						RAOut(N-1) <= w ;
					END IF ;
	END PROCESS ;
END Behavior ;