----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:38 05/15/2018 
-- Design Name: 
-- Module Name:    johnsoncounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Johnson_counter is
  Port ( clk : in STD_LOGIC;
  rst : in STD_LOGIC;
  Q : out STD_LOGIC_VECTOR (3 downto 0));
end Johnson_counter;
 
architecture Behavioral of Johnson_counter is
  signal temp: std_logic_vector(3 downto 0):= "0000";
begin
  process(clk,rst)
  begin
    if rst = '1' then
      temp <= "0000";
    elsif Rising_edge(clk) then
      temp(1) <= temp(0);
      temp(2) <= temp(1);
      temp(3) <= temp(2);
      temp(0) <= not temp(3);
    end if;
  end process;
  Q <= temp;
end Behavioral;