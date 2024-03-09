----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 07:30:22 PM
-- Design Name: 
-- Module Name: filtru2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity filtru2 is --Filtrul care converteste imaginile RGB in tonuri de gri
Port 
( 
signal r:in std_logic_vector(7 downto 0);
signal g:in std_logic_vector(7 downto 0);
signal b:in std_logic_vector(7 downto 0);
signal a:in std_logic_vector(7 downto 0);
signal grayscalePixel:out std_logic_vector(7 downto 0)
);
end filtru2;

architecture Behavioral of filtru2 is
signal retinem:std_logic_vector(8 downto 0);
signal shiftam:std_logic_vector(8 downto 0);
begin

SST4:entity WORK.SST4_8 port map
(
 x=>r,
 y=>g,
 z=>b,
 w=>a,
 s=>retinem
);

shiftam<="00" & retinem(8 downto 2);

grayscalePixel<=shiftam(7 downto 0);

end Behavioral;
