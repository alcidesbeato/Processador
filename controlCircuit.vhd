-- Circuito de controle

LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY Processador IS
		PORT (
			R1out,R2, R3: IN std_logic_vector(7 DOWNTO 0);
			A, G: IN std_logic_vector(7 DOWNTO 0));
	END Processador;
	
ARCHITECTURE LogicFunc OF Processador IS 
	BEGIN
	 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( 	
			Clock			:IN	STD_LOGIC;
			ULAop			:IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			A, B			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Opcode 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ULA;

ARCHITECTURE behavior OF ULA IS
BEGIN
	PROCESS (ULAop, A, B, clock1)
	BEGIN
	
		IF Clock'EVENT AND clock1 = '1' THEN
			CASE Opcode IS
				WHEN "00" => 
					Opcode <= Rout = '1', Rin = '1', Done ='1'; -- MOVE
				WHEN "01" => 
					Opcode <= Extern = '1', Rin = '1', Done ='1'; --LOAD
				WHEN "10" => 
					Opcode <= Rout = '1', Ain ='1'; --ADD
				WHEN "11" => 
					Opcode <= Rout = '1', Ain ='1'; --SUB
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
END LogicFunc;