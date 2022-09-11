library ieee;
use ieee.std_logic_1164.all;

entity basic_ALU_tb is
	--port();
end basic_ALU_tb;


architecture Behavioral of basic_ALU_tb is

	--Component declaration
	component basic_ALU is
		port(
			A 		: in std_logic;
			B 		: in std_logic;
			opcode: in std_logic_vector(2 downto 0);
			Y		: out std_logic_vector(1 downto 0)
		);
	end component;
	
	--signals
	signal A 		: std_logic := '0';
	signal B 		: std_logic := '0';
	signal opcode 	: std_logic_vector(2 downto 0);
	signal Y			: std_logic_vector(1 downto 0) := "00";

begin
	-- component instantiation
ALU: basic_ALU
	port map(
		A => A,
		B => B,
		opcode => opcode,
		Y => Y
	);
	
	--stimuli
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