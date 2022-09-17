library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity upCounter_4b is
	port(
		clk 	: in std_logic;
		reset	: in std_logic;
		count	: buffer std_logic_vector(3 downto 0)
	);
end upCounter_4b;

architecture Behavioral of upCounter_4b is

	begin
	process(clk, reset) begin
		if (reset = '1') then
			count <= "0000";
		elsif rising_edge(clk) then
			count <= count + 1;
			--Ring counter
			--if count = "1111" then
			--	count <= "0000";
			--else
			--	count <= count + 1;
			--end if;
		end if;		
	end process;
	
end Behavioral;