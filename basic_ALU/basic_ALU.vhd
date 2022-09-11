library ieee;
use ieee.std_logic_1164.all;

entity basic_ALU is
	port(
		A 		: in std_logic;
		B 		: in std_logic;
		opcode: in std_logic_vector(2 downto 0);
		Y		: out std_logic_vector(1 downto 0)
	);

end basic_ALU;


architecture rtl of basic_ALU is

begin
	process(opcode,A) begin
		case opcode is
			when "000" => --no opertaion
				Y <= '0' & '0';
			when "001" => -- AND operation
				Y <= '0' & (A and B);
			when "010" => -- OR
				Y <= '0' & (A or B);
			when "011" => -- half addition
				Y <= (A xor B) & (A or B); -- sum,c_out
			when "100" => -- full addition (using 1-bit addition)
				Y <= (A xor B xor '0') & (((A xor B) and '0') or (A and B)); -- sum ,c_out
			when "101" => --encode A->Y,Status_out
				case A is
					when '0' =>
						Y <= "00";
					when '1' =>
						Y <= "01";						
					when others =>
				end case;
			when "110" => --Subtract B from A
				Y <= (A xor B) & ((not A) and B); ---diff,borrow
			when "111" =>
				case A is
					when '0' => 
						Y <= "00";
					when '1' =>
						Y <= '0' & B;
					when others =>
						Y <= "00";
				end case;
			when others =>
		end case;
		
	end process;

end rtl;