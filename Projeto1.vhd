LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY Projeto1 IS
	PORT (  Clock, Resetn, w  : IN  STD_LOGIC ;
			  z : OUT  STD_LOGIC ) ;
END Projeto1 ;
ARCHITECTURE Behavior OF Projeto1 IS
TYPE State_type IS (A, B) ;
SIGNAL y : State_type ;
SIGNAL AddSubOut, AddSubIn : STD_LOGIC;
SIGNAL s0,s1,s2 : STD_LOGIC;
	COMPONENT ULA
		PORT( 	
			clock			:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC;
			A, B			:IN	STD_LOGIC;
			ALUout 		:OUT  STD_LOGIC);
	END COMPONENT;
	PROCESS ( Resetn, Clock )
	BEGIN
		IF Resetn = '0' THEN
			y <= A ;
		ELSIF (Clock'EVENT AND Clock = '1') THEN
		CASE y IS
			WHEN A =>
				IF w = '0' THEN y <= "A" ;
				ELSE y <= "B" ;
				END IF;
			WHEN B => 
				IF w = '0' THEN y <= "A" ;
				ELSE y <= "B" ;
				END IF;
			WHEN C =>
				IF w = '0' THEN y <= "A" ;
				ELSE y <= "C" ;
				END IF ;
			WHEN D =>
				IF w = '0' THEN y <= "A" ;
				ELSE y <= "D" ;
				END IF ;
		END IF ;
		END CASE ;
		END IF ;
	END PROCESS ;
	PROCESS ( y, w )
		BEGIN
			CASE y IS
				WHEN A =>
					z <= '0' ;
				WHEN B =>
					z <= w ;
			END CASE ;
	END PROCESS ;
	BEGIN
		stage0: ULA PORT MAP (AddSubOut, A, B, s0, AddSubIn) ;
END Behavior ;
