-- Circuito de controle

LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY bufferTriState IS
		PORT (
			R1out,R2, R3: IN std_logic_vector(7 DOWNTO 0);
			A, G: IN std_logic_vector(7 DOWNTO 0));
	END bufferTriState;
	
ARCHITECTURE LogicFunc OF bufferTriState IS 
	BEGIN
	y<=
END LogicFunc;