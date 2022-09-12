library ieee;
use ieee.std_logic_1164.all;

entity Four_shiftReg_dff_tb is
	--port();
end Four_shiftReg_dff_tb;


architecture behavioral of Four_shiftReg_dff_tb is
-- Component declaration
	component Four_shiftRef_dff is
		port(		
			reset	: in std_logic;
			clk 	: in std_logic;
			s_in 	: in std_logic;
			s_out	: out std_logic;
			reg	: buffer std_logic_vector(3 downto 0) := "0000"
		);
	end component;
	
	--signals
	signal s_reset		: std_logic :='0';
	signal s_clk		: std_logic :='0';
	signal serial_in 	: std_logic	:='0';
	signal serial_out : std_logic;
	signal s_reg		: std_logic_vector(3 downto 0) := "0000";
	
begin

-- Component instantiation
--------------------------
u: Four_shiftRef_dff
	port map(		
		reset	=> s_reset,
		clk 	=> s_clk,
		s_in 	=> serial_in,
		s_out	=> serial_out,
		reg => s_reg
	);
 
--apply stomuli
----------------------- 
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

input_signal: process begin
	wait for 60 ns;
	serial_in <= '1';
	wait for 10 ns;	
	serial_in <= '0';
	wait for 10 ns;	
	serial_in <= '0';
	wait for 10 ns;	
	serial_in <= '0';
	wait;
end process;

end behavioral;