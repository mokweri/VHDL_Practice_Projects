library ieee;
use ieee.std_logic_1164.all;

entity upCounter_tb is
	--port();
end upCounter_tb;


architecture Behavioral of upCounter_tb is

-- Component
component upCounter_4b is
	port(
		clk 	: in std_logic;
		reset	: in std_logic;
		count	: buffer std_logic_vector(3 downto 0)
	);
end component;


--Signals
signal s_clk 	: std_logic;
signal s_reset: std_logic;
signal s_count: std_logic_vector(3 downto 0) := "0000";

begin

-- instantiation
counter : upCounter_4b
port map(
	clk => s_clk,
	reset => s_reset,
	count => s_count
);

-- Apply stimuli
clk_generate: process begin
	s_clk <= '1';
	wait for 5 ns;
	s_clk <= '0';
	wait for 5 ns;
end process clk_generate;


Input_reset: process begin
	s_reset <= '1';
	wait for 50 ns;
	s_reset <= '0';
	wait;
end process;


end Behavioral;