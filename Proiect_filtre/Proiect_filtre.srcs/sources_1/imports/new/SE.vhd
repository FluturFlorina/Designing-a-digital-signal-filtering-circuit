----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 07:35:52 PM
-- Design Name: 
-- Module Name: SE - Behavioral
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

entity SE is --sumator cu propagarea succesiva a transportului
Port 
(
signal x:in std_logic;
signal y:in std_logic;
signal tin:in std_logic;
signal tout:out std_logic;
signal s:out std_logic
 );
end SE;

architecture Behavioral of SE is

begin
s<=(x xor y) xor tin;
tout<=(x and y) or ((x or y) and tin);

end Behavioral;
