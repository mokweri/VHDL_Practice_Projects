library ieee;
use ieee.std_logic_1164.all;

entity ALU_Sequential_tb is
	--port();
end ALU_Sequential_tb;


architecture Behavioral of ALU_Sequential_tb is

	--Component declaration
	component ALU_Sequential is
		port(
			clk,reset	: in std_logic;
			A,B	 	: in std_logic;
			opcode	: in std_logic_vector(2 downto 0);
			Y			: out std_logic_vector(1 downto 0)
		);
	end component;
	
	--signals
	signal clk		: std_logic := '0';
	signal reset	: std_logic := '0';
	signal A 		: std_logic := '0';
	signal B 		: std_logic := '0';
	signal opcode 	: std_logic_vector(2 downto 0);
	signal Y			: std_logic_vector(1 downto 0);--dont initialize

begin
	-- component instantiation
ALU: ALU_Sequential
	port map(
		clk => clk,
		reset => reset,
		A => A,
		B => B,
		opcode => opcode,
		Y => Y
	);
	
	--stimuli
	
clk_generate: process begin
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
end process clk_generate;


Input_reset: process begin
	reset <= '1';
	wait for 20 ns;
	reset <= '0';
	wait;
end process;

	process begin
	opcode <= "011"; --half adder
	A <= '1';
	B <= '1';
	wait for 20 ns;
	
	opcode <= "111"; --mux
	A <= '1';
	B <= '1';
	wait for 20 ns;
	opcode <= "111"; --mux
	A <= '0';
	B <= '1';
	wait for 20 ns;
	opcode <= "000"; --no operation
	A <= '0';
	B <= '0';
	wait for 20 ns;
	end process;

end Behavioral;