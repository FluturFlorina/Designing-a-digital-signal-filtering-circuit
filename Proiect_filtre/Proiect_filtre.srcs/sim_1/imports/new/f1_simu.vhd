----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 10:19:27 PM
-- Design Name: 
-- Module Name: f1_simu - Behavioral
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

entity f1_simu is
--  Port ( );
end f1_simu;

architecture Behavioral of f1_simu is

signal currPixelValue: std_logic_vector(7 downto 0);
signal brightness: std_logic_vector(7 downto 0);
signal sel: std_logic;
signal newPixelValue: std_logic_vector(7 downto 0);

component filtru1 is
port
(
signal currPixelValue:in std_logic_vector(7 downto 0);
signal brightness:in std_logic_vector(7 downto 0);
signal sel:in std_logic;
signal newPixelValue:out std_logic_vector(7 downto 0)
);
end component filtru1;

begin

f1_simu: filtru1 port map
(
currPixelValue=>currPixelValue,
brightness=>brightness,
sel=>sel,
newPixelValue=>newPixelValue
);

currPixelValue<="00000010" after 0 ns,"00010011" after 20 ns,"01000000" after 60 ns,"10010001" after 70 ns,"01011110" after 90 ns, "11111101" after 130 ns,"00110001" after 150 ns,"00110001" after 170 ns,"11101110" after 200 ns, "01101001" after 240 ns,"00110001" after 250 ns,"11001000" after 260 ns,  "10100001" after 270 ns;
brightness<="00010101" after 150 ns,"11011001" after 170 ns,"00100001" after 190 ns,"01001000" after 200 ns, "11010001" after 210 ns, "10110001" after 220 ns,"00000110" after 250 ns, "01011001" after 270 ns;
sel<='0' after 0 ns, '1' after 150 ns;

end Behavioral;
