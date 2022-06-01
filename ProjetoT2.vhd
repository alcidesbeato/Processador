-- Palavras de 8 bits 
--  3 Registradores, de propósito geral,   R1, R2 e R3, todos de 8 bits. 
--  2 Registradores de propósito específico, A e G, todos de 8 bits 
--  Uma ULA que faça soma e subtração. 
--  Uma unidade de controle – máquina de estados. 

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