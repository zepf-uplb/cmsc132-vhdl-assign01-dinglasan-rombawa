library IEEE; use IEEE.std_logic_1164.all;

entity alarm is
	port(a, b, c, d, e, f: in std_logic; g: out std_logic);
end alarm;

architecture behav of alarm is
	begin
		g <= (a or c or e) and (b or d or f);
		-- g -> alarm
		-- a, c, e -> IN_BUZZER
		-- b, d, f -> OUT_BUZZER
end architecture behav;		
