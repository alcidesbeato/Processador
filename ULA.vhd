LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ALU IS
	PORT( 	
			clock			:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC;
			A, B			:IN	STD_LOGIC;
			ALUout 		:OUT  STD_LOGIC);
END ALU;

ARCHITECTURE behavior OF ALU IS
	BEGIN
		PROCESS (ALUop, A, B, clock)
			BEGIN
				IF clock'EVENT AND clock = '1' THEN -- Realiza a operação na subida de clock
					CASE ALUop IS
						WHEN "0" => 
							ALUout <= A + B;
						WHEN "1" => 
							ALUout <= A - B;
						WHEN OTHERS => NULL;
					END CASE; 
				END IF;
		END PROCESS;
END behavior;