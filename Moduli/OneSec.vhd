-- oneSec
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity OneSec is

	port
	(
		input  		: in std_logic;
		clk	  		: in std_logic;

		output		: out std_logic
	);

end entity;

architecture rtl of OneSec is

	constant range_from:natural := (1000)*((50*1000)) -1; -- max counter
	
begin

	process (clk)
		variable cnt: natural range range_from downto 0;
		variable output_next: std_logic:='0';
	begin
	
		if (rising_edge(clk)) then
				if cnt=0 then
					cnt:=range_from;
				end if;
   
				if input='1' then
					cnt := cnt - 1;
				else
					cnt := range_from;
				end if;
			
			
			-- Output the current count
			if cnt=0 then
				output_next := '1';
			else
				output_next:='0';
			end if;
			
			
		end if;
		
		output<=output_next;
		
	end process;

end rtl;
