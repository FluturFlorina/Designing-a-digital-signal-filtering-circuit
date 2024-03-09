----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 07:36:10 PM
-- Design Name: 
-- Module Name: se_simu - Behavioral
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

entity se_simu is
--  Port ( );
end se_simu;

architecture Behavioral of se_simu is
signal x: std_logic;
signal y: std_logic;
signal tin: std_logic;
signal tout: std_logic;
signal s: std_logic;

component SE is  
port
(
signal x:in std_logic;
signal y:in std_logic;
signal tin:in std_logic;
signal tout:out std_logic;
signal s:out std_logic
);
end component SE;

begin

se_simu: SE port map
(
x=>x,
y=>y,
tin=>tin,
tout=>tout,
s=>s
);

x <= '1' after 0 ns,'0' after 75 ns, '1' after 150 ns,'0' after 225 ns;
y <= '0' after 0 ns,'1' after 75 ns, '1' after 150 ns,'0' after 225 ns;
tin<= '1' after 0 ns,'0' after 20 ns,'1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns,'1' after 120 ns,'0' after 140 ns,'1' after 160 ns,'0' after 180 ns,'1' after 200 ns,'0' after 220 ns,'1' after 240 ns,'0' after 260 ns,'1' after 280 ns;


end Behavioral;
