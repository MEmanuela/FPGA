library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity clockdivider_tb is
end;

architecture bench of clockdivider_tb is

  component clockdivider
      Port(
          clk: in std_logic;
          reset: in std_logic;
          clk_out, clk_out_1: out std_logic;
          count_out, count_out_1: out std_logic_vector(0 to 2)
          );
  end component;

  signal clk: std_logic;
  signal reset: std_logic;
  signal clk_out, clk_out_1: std_logic;
  signal count_out, count_out_1: std_logic_vector(0 to 2) ;

  constant clk_period: time := 10 ns;

begin

  uut: clockdivider port map ( clk         => clk,
                               reset       => reset,
                               clk_out     => clk_out,
                               clk_out_1   => clk_out_1,
                               count_out   => count_out,
                               count_out_1 => count_out_1 );

  clk_process:process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 100 ns;
    
    wait for clk_period*10;
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
    wait;
  end process;


end;