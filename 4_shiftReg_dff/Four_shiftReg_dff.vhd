library ieee;
use ieee.std_logic_1164.all;


entity Four_shiftRef_dff is
	port(		
		reset	: in std_logic;
		clk 	: in std_logic;
		s_in 	: in std_logic;
		s_out	: out std_logic
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
	signal D1_SO, D2_SO, D3_SO : std_logic;
	
begin
-- make the connections
	dff_1: D_FF port map(reset=>reset, clk=>clk, D=>s_in, Q=>D1_SO);
	dff_2: D_FF port map(reset=>reset, clk=>clk, D=>D1_SO, Q=>D2_SO);
	dff_3: D_FF port map(reset=>reset, clk=>clk, D=>D2_SO, Q=>D3_SO);
	dff_4: D_FF port map(reset=>reset, clk=>clk, D=>D3_SO, Q=>s_out);
	
end rtl;