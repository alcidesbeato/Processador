-- Circuito de controle

LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY controlCircuit IS
		PORT (
			Clock, Reset: IN STD_LOGIC;
			W, Func: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			R0In, R0Out, R1In, R1Out, R2In, R2Out, R3In, R3Out, RGIn, RGOut, RAIn: OUT STD_LOGIC;
			AddSub, Extern, Done: OUT STD_LOGIC
		);
	END controlCircuit;
	
ARCHITECTURE LogicFunc OF controlCircuit IS
BEGIN
	PROCESS(Clock, Reset,W, Func)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
		-- Funciona apenas quando clock for igual a 1
			CASE Func IS
				WHEN "00" => 
				-- LOAD
					Extern <= '1';
					R0In <= '1';
					Done <= '1'; 

				WHEN "01" => 
				-- MOVE
					R1In <= '1';
					R0Out <= '1';
					Done <='1';		

				WHEN "10" => -- ADD
					Case W IS 
						WHEN "00" =>
						-- 1 ciclo
							R1Out <= '1';
							RAIn <='1'; 
						WHEN "01" => 
						-- 2 ciclo
							R2Out <= '1';
							AddSub <= '0';
							RGIn <= '1';
						WHEN "10" => 
						-- 3 ciclo
							RGOut <= '1';
							R2In <= '1';
							Done <= '1';
						WHEN OTHERS => NULL;
					END CASE;

				WHEN "11" => -- SUB
					Case W IS 
						WHEN "00" =>
						-- 1 ciclo
							R2Out <= '1';
							RAIn <='1'; 
						WHEN "01" => 
						-- 2 ciclo
							R3Out <= '1';
							AddSub <= '1';
							RGIn <= '1';
						WHEN "10" => 
						-- 3 ciclo
							RGOut <= '1';
							R3In <= '1';
							Done <= '1';
						WHEN OTHERS => NULL;
					END CASE;

				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
END LogicFunc;