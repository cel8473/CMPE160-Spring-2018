library ieee;
use ieee.std_logic_1164.all;

entity HW12 is
port( x, rst, clk: in std_logic;
      z : out std_logic);
end HW12;

architecture behv of HW12 is
type tstates is (A, B, C, D, E, F);
signal sstate : tstates;
begin
process(x,rst)
begin	
	sstate <= A;
	if(rst = '0') then
		sstate <= A;
	elsif(rising_edge(clk)) then
		if(sstate = A) then
			if(x = '1') then
				sstate <= B;
				z <= '0';
			elsif(x = '0') then
				sstate <= A;
				z <= '0';
			end if;
		elsif(sstate = B) then
			if(x = '1') then
				sstate <= C;
				z <= '0';
			elsif(x = '0') then
				sstate <= F;
				z <= '1';
			end if;
		elsif(sstate = C) then
			if(x = '1') then
				sstate <= D;
				z <= '0';
			elsif(x = '0') then
				sstate <= A;
				z <= '0';
			end if;
		elsif(sstate = D) then
			if(x = '1') then
				sstate <= E;
				z <= '0';
			elsif(x = '0') then
				sstate <= F;
				z <= '1';
			end if;
		elsif(sstate = E) then
			if(x = '1') then
				sstate <= E;
				z <= '0';
			elsif(x = '0') then
				sstate <= A;
				z <= '0';
			end if;
		elsif(sstate = F) then
			if(x = '1') then
				sstate <= B;
				z <= '0';
			elsif(x = '0') then
				sstate <= A;
				z <= '0';
			end if;
		end if;
	end if;
end process;
end;
		