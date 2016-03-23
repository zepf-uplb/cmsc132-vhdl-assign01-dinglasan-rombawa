library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity t6l_dinglasan_rombawa_tb is
end;

architecture alarm_tb of t6l_dinglasan_rombawa_tb is
	signal a, b, c, d, e, f, g: std_logic;
	component alarm is
		port(a, b, c, d, e, f: in std_logic; g: out std_logic);
	end component;
begin
	uut: component alarm port map(a,b,c,d,e,f,g);
	process
		variable error_count: integer := 0;
		variable inputs: unsigned(5 downto 0);
		variable expected: std_logic;
		begin
			inputs := B"000000";
			for count in 0 to 63 loop
				a <= inputs(0);
				b <= inputs(1);
				c <= inputs(2);
				d <= inputs(3);
				e <= inputs(4);
				f <= inputs(5);
				wait for 10 ns;
				expected := (a or c or e) and (b or d or f);
				assert(expected = g) report "alarm design error!" severity error;
				if(g /= expected) then error_count := error_count + 1; end if;
				inputs := inputs + 1;
			end loop;
			report "Done with test. Errors:"&integer'image(error_count);
			wait;
	end process;	 
end architecture ; 
