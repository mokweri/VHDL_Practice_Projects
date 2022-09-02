library ieee;
use ieee.std_logic_1164.all;

entity basic_ALU is
	port(
		A 		: in std_logic;
		B 		: in std_logic;
		c_in 	: in std_logic;
		opcode: in std_logic_vector(2 downto 0);
		Y		: out std_logic;
		Status_out	: out std_logic
	);

end basic_ALU;


architecture rtl of basic_ALU is

begin
	process(opcode,A) begin
		if(opcode = "000") then -- no operation
			Y <= '0';
		elsif(opcode = "001") then -- AND
			Y <= A and B;
		elsif(opcode = "010") then -- OR
			Y <= A or B;
		elsif(opcode = "011") then -- half addition
			Y <= A xor B; --sum
			Status_out <= A or B;	--c_out
		elsif(opcode = "100") then -- full addition (using 1-bit addition)
			Y <= A xor B xor c_in; -- sum ,
			Status_out <= ((A xor B) and c_in) or (A and B); --c_out
		elsif(opcode = "101") then --encode A->Y,Status_out
				if(A = '0') then
					Y <= '0';
					Status_out <= '0';
				elsif(A = '1') then
					Y <= '0';
					Status_out <= '1';
				end if;
		elsif(opcode = "110") then --Subtract B from A
			Y <= A xor B; --diff
			Status_out <= (not A) and B; --borrow -not-A AND B
		elsif(opcode = "111") then -- mux
			if(A = '0') then
				Y <= B;
			elsif(A = '1') then
				Y <= c_in;
			end if;
		end if;
		
	end process;

end rtl;