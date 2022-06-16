-- Alcides Gomes Beato Neto 19060987   
-- Thiago Loureiro Kosciuk 21005277
-- Circuito de controle

LIBRARY ieee;
 USE ieee.std_logic_1164.all;
	ENTITY controlCircuit IS
		PORT (
			Clock, Reset: IN STD_LOGIC; -- Sinais de clock e reset
			W, Func: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Vetor de sinais de entrada
			R0In, R0Out, R1In, R1Out, R2In, R2Out, R3In, R3Out, RGIn, RGOut, RAIn: OUT STD_LOGIC; -- Sinais de saida
			AddSub, Extern, Done: OUT STD_LOGIC -- Sinais de saida
		);
	END controlCircuit;            

ARCHITECTURE Behavior OF controlCircuit IS
    TYPE STATE_TYPE IS (Load, Move, AddSub1, Add2, Sub2, AddSub3); -- tipos de estados
    SIGNAL state: STATE_TYPE; -- sinal de tipo de estado
	BEGIN
	PROCESS (Clock, Reset, Func)
    BEGIN

        IF Reset = '1' THEN
		-- Executando instrucao de load
            state <= Load;
        ELSIF Clock'EVENT AND Clock = '1' THEN
			-- Funciona apenas quando clock for igual a 1
            CASE state IS  -- Atribuicao ao proximo estado
                WHEN Load =>
					CASE Func IS
						WHEN "00" => state <= Load; -- instrucao de Load
						WHEN "01" => state <= Move; -- instrucao de Move
						WHEN "10" => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
						WHEN "11" => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
						WHEN OTHERS => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
				END CASE;

                WHEN Move =>
                    CASE Func IS
                        WHEN "00" => state <= Load; -- instrucao de Load
                        WHEN "01" => state <= Move;  -- instrucao de Move
                        WHEN "10" => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
                        WHEN "11" => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
                        WHEN OTHERS => state <= Load; -- instrucao de Load
                    END CASE;

				WHEN AddSub1 =>
					CASE W IS
						WHEN "00" => state <= Add2; -- instrucao de Add, segundo ciclo
						WHEN "01" => state <= Sub2; -- instrucao de Sub, segundo ciclo
						WHEN OTHERS => state <= Add2; -- instrucao de Sub, segundo ciclo
					END CASE;

				WHEN Add2 =>
					CASE W IS
						WHEN "00" => state <= AddSub3; -- instrucao de Add ou Sub, terceiro ciclo
						WHEN OTHERS => state <= AddSub3; -- instrucao de Add ou Sub, terceiro ciclo
					END CASE;

				WHEN Sub2 =>
					CASE W IS
						WHEN "00" => state <= AddSub3; -- instrucao de Add ou Sub, terceiro ciclo
						WHEN OTHERS => state <= AddSub3; -- instrucao de Add ou Sub, terceiro ciclo
					END CASE;

				WHEN AddSub3	=>
					CASE W IS
						WHEN "00" => state <= Load; -- instrucao de load
						WHEN "01" => state <= Move;  -- instrucao de move
						WHEN "10" => state <= AddSub1; -- instrucao de Add ou Sub, primeiro ciclo
						WHEN "11" => state <= AddSub1; --instrucao de Add ou Sub, primeiro ciclo 
						WHEN OTHERS => state <= Move;  -- instrucao de move
                    END CASE;

                WHEN OTHERS => NULL;
            END CASE;
        END IF;
	END PROCESS;
    
	
    --Atribuindo sinais aos estados
	 PROCESS(state, Func,Reset)
	 BEGIN
		CASE state IS
			WHEN Move => -- instrucao de Move
				R1In <= '1';
				R0Out <= '1';
				Done <= '1';
				
			WHEN Load => -- instrucao de Load
				Extern <= '1';
				R0In <= '1';
				Done <= '1';
				
			WHEN AddSub1 => -- instrucao de Add ou Sub, primeiro ciclo 
				-- 1 ciclo
				R1Out <= '1';
				RAIn <='1';
				
			WHEN Add2 => -- instrucao de Add, segundo ciclo
				-- 2 ciclo
				R2Out <= '1';
				AddSub <= '0';
				RGIn <= '1';
				
			WHEN Sub2 => -- instrucao de Sub, segundo ciclo 
				-- 2 ciclo
				R3Out <= '1';
				AddSub <= '1';
				RGIn <= '1';
				
			WHEN AddSub3 => -- instrucao de Add ou Sub, terceito ciclo 
				-- 3 ciclo
				RGOut <= '1';
				R2In <= '1';
				Done <= '1'; 

			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
END Behavior;
    