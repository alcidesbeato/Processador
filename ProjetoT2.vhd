-- Palavras de 8 bits 
--  3 Registradores, de propósito geral,   R1, R2 e R3, todos de 8 bits. 
--  2 Registradores de propósito específico, A e G, todos de 8 bits 
--  Uma ULA que faça soma e subtração. 
--  Uma unidade de controle – máquina de estados. 
-- fazer registrador com buffer tri state pra ficar mis facil 
-- buffer tri state


LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY ProjetoT2 IS
		PORT (
			R0in, R1,R2, R3, RA, RG, : IN std_logic_vector(7 DOWNTO 0);
			A, G: IN std_logic_vector(7 DOWNTO 0));
	END ProjetoT2;
	
ARCHITECTURE LogicFunc OF ProjetoT2 IS 
	COMPONENT Reg
		PORT ( 
			Rin : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			Clock : IN STD_LOGIC ;
			L, w : IN STD_LOGIC ;
			ROut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) ) ;
	END COMPONENT;
	
	BEGIN
	
	
	
END LogicFunc;