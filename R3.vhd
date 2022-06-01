LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Registers IS
    PORT(
       clock			:IN	STD_LOGIC;							-- Sinal do controlador de escrita
		 data				:IN STD_LOGIC_VECTOR(7 DOWNTO 0);	-- Valor a ser escrito
       s,				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)   -- Saída de informações dos registradores
		 ); 	
END Registers;

ARCHITECTURE behavior OF Registers IS

	PROCESS (ALUop, A, B, clock)
	SIGNAL R3	: STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
	BEGIN
		IF clock'EVENT AND clock = '0' THEN -- Realiza a operação na subida de clock
			CASE R3 IS
				WHEN "001" =>
					R3 <= data;
				WHEN OTHERS => NULL;
		 clock = '0' THEN
				WHEN "000" =>
					s <= R3;
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
END behavior;