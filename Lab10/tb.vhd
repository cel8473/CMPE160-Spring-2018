library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture behavior of tb is 
  component full_adder
      port(
            A : in std_logic;
            B : in std_logic;
            Cin : in std_logic;
            Sum : out std_logic;
            Cout : out std_logic);
end component;

signal sA: std_logic :='0';
signal sB: std_logic :='0';
signal sCin: std_logic :='0';
signal sSum: std_logic :='0';
signal sCout: std_logic :='0';

for UUT : full_adder  use entity work.full_adder(df);

begin
  UUT: full_adder port map(A=>sA, B=>sB, Cin=>sCin,Sum=>sSum, Cout=>sCout);
  sA <= not sA after 50 ns;
  sB <= not sB after 100 ns;
  sCin <= not sCin after 200 ns;

end;

library ieee;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture behavior of tb is
  component full_adder
    port(
          A : in std_logic;
            B : in std_logic;
            Cin : in std_logic;
            Sum : out std_logic;
            Cout : out std_logic);
end component;

signal sA: std_logic :='0';
signal sB: std_logic :='0';
signal sCin: std_logic :='0';
signal sSum1, sSum2, sSum3: std_logic :='0';
signal sCout1, sCout2, sCout3: std_logic :='0';

for UUT1 : full_adder use entity work.full_adder(df);
for UUT2 : full_adder use entity work.full_adder(struct);
for UUT3 : full_adder use entity work.full_adder(blerbler);

begin
    UUT1: full_adder port map(A=>sA, B=>sB, Cin=>sCin, Sum=>sSum1, Cout=>sCout1);
    UUT2: full_adder port map(A=>sA, B=>sB, Cin=>sCin, Sum=>sSum2, Cout=>sCout2);
    UUT3: full_adder port map(A=>sA, B=>sB, Cin=>sCin, Sum=>sSum3, Cout=>sCout3);
    
    process
      variable vIn : std_logic_vector( 2 downto 0):="000";
    begin
      (sCin, sB,sA) <= vIn;
      wait for 50 ns;
      vIn := vIn +1;
  end process;
  
process
  variable vA, vB, vCin, vOut : std_logic_vector(1 downto 0):="00";
  begin
    wait on sA, sB, sCin;
    vA := '0'& sA;
    vB := '0'& sB;
    vCin := '0'& sCin;
    vOut := vA + vB + vCin;
    wait for 20 ns;
    
    assert(sSum1 = vOut(0) and sCout1 = vOut(1))
    report"wrong_output_for_df_architecture_at_time:' & time'image(now)"
    severity warning;
    
    if(sSum2/=vOut(0) or sCout2/=vOut(1)) then
    assert false
    report"wrong_output_for_df_architecture_at_time:' & time'image(now)"
    severity warning;
  end if;
end process;
end;