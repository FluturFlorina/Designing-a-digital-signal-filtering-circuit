----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 10:21:25 PM
-- Design Name: 
-- Module Name: f3_simu - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity f3_simu is
--  Port ( );
end f3_simu;

architecture Behavioral of f3_simu is

signal pixel1: std_logic_vector(7 downto 0);
signal pixel2: std_logic_vector(7 downto 0);
signal newPixelValue: std_logic_vector(7 downto 0);

component filtru3 is
port
(
signal pixel1:in std_logic_vector(7 downto 0);
signal pixel2:in std_logic_vector(7 downto 0);
signal newPixelValue:out std_logic_vector(7 downto 0)
);
end component filtru3;

begin

f3_simu: filtru3 port map
(
pixel1=>pixel1,
pixel2=>pixel2,
newPixelValue=>newPixelValue
);

pixel1<= "11111111" after 0 ns,"00000000" after 20 ns,"00000001" after 30 ns,"00000011" after 70 ns,"01010110" after 90 ns, "00011001" after 130 ns,"00100001" after 150 ns,"01001000" after 200 ns, "01110001" after 250 ns, "10110001" after 270 ns;
pixel2<="11111111" after 0 ns,"00000000" after 10 ns,"00100001" after 20 ns,"00000010" after 100 ns, "01010001" after 110 ns, "00110001" after 120 ns,"11101110" after 200 ns, "01101001" after 240 ns,"00110001" after 250 ns,"11001000" after 260 ns, "01011001" after 270 ns, "00110101" after 280 ns;
end Behavioral;
