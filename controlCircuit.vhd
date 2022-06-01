-- Circuito de controle

LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY Processador IS
		PORT (
			R1,R2, R3: IN std_logic_vector(7 DOWNTO 0);
			A, G: IN std_logic_vector(7 DOWNTO 0));
	END Processador;
	
ARCHITECTURE LogicFunc OF Processador IS 
	BEGIN
		
END LogicFunc;