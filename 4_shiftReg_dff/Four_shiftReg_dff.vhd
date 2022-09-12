library ieee;
use ieee.std_logic_1164.all;


entity Four_shiftRef_dff is
	port(		
		reset	: in std_logic;
		clk 	: in std_logic;
		s_in 	: in std_logic;
		s_out	: out std_logic;
		reg	: buffer std_logic_vector(3 downto 0) := "0000"
	);
end Four_shiftRef_dff;


architecture rtl of Four_shiftRef_dff is

-- Component instantiation
--------------------------
	component D_FF is
		port ( 
			reset	:	in std_logic;
			clk	:	in std_logic;
			D		: 	in std_logic;
			Q		: 	out std_logic
		);
	end component;
	
-- intermediate Signals-------
------------------------------
	--signal D1_SO, D2_SO, D3_SO : std_logic;
	
begin
-- make the connections
	dff_1: D_FF port map(reset=>reset, clk=>clk, D=>s_in, Q=>reg(3));
	dff_2: D_FF port map(reset=>reset, clk=>clk, D=>reg(3), Q=>reg(2));
	dff_3: D_FF port map(reset=>reset, clk=>clk, D=>reg(2), Q=>reg(1));
	dff_4: D_FF port map(reset=>reset, clk=>clk, D=>reg(1), Q=>reg(0));
	s_out <= reg(0);
	
end rtl;