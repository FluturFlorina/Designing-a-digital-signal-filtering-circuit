----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 07:30:36 PM
-- Design Name: 
-- Module Name: filtru3 - Behavioral
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

entity filtru3 is --Filtrul ce multiplica doi pixeli pentru a ajuta la inmultirea a doua imagini
Port 
( 
signal pixel1:in std_logic_vector(7 downto 0);
signal pixel2:in std_logic_vector(7 downto 0);
signal newPixelValue:out std_logic_vector(7 downto 0)
);
end filtru3;

architecture Behavioral of filtru3 is

type produse is array(0 to 7) of std_logic_vector(7 downto 0);
signal produse_partiale:produse:=(others=>(others=>'0'));

signal tout_linia1:std_logic_vector(7 downto 0);
signal sume_linia1:std_logic_vector(7 downto 0);

signal tout_linia2:std_logic_vector(7 downto 0);
signal sume_linia2:std_logic_vector(7 downto 0);

signal tout_linia3:std_logic_vector(7 downto 0);
signal sume_linia3:std_logic_vector(7 downto 0);

signal tout_linia4:std_logic_vector(7 downto 0);
signal sume_linia4:std_logic_vector(7 downto 0);

signal tout_linia5:std_logic_vector(7 downto 0);
signal sume_linia5:std_logic_vector(7 downto 0);

signal tout_linia6:std_logic_vector(7 downto 0);
signal sume_linia6:std_logic_vector(7 downto 0);

signal tout_linia7:std_logic_vector(7 downto 0);
signal sume_linia7:std_logic_vector(7 downto 0);

signal produs:std_logic_vector(15 downto 0);

begin


-- x(0) and y(0)... pe linie am pixel2=y , pe coloane am pixel1=x
--rand 0
produse_partiale(0)(0)<=pixel1(0) and pixel2(0); 
produse_partiale(0)(1)<=pixel1(1) and pixel2(0);
produse_partiale(0)(2)<=pixel1(2) and pixel2(0);
produse_partiale(0)(3)<=pixel1(3) and pixel2(0);
produse_partiale(0)(4)<=pixel1(4) and pixel2(0);
produse_partiale(0)(5)<=pixel1(5) and pixel2(0);
produse_partiale(0)(6)<=pixel1(6) and pixel2(0);
produse_partiale(0)(7)<=pixel1(7) and pixel2(0);

--rand 1
produse_partiale(1)(0)<=pixel1(0) and pixel2(1); 
produse_partiale(1)(1)<=pixel1(1) and pixel2(1);
produse_partiale(1)(2)<=pixel1(2) and pixel2(1);
produse_partiale(1)(3)<=pixel1(3) and pixel2(1);
produse_partiale(1)(4)<=pixel1(4) and pixel2(1);
produse_partiale(1)(5)<=pixel1(5) and pixel2(1);
produse_partiale(1)(6)<=pixel1(6) and pixel2(1);
produse_partiale(1)(7)<=pixel1(7) and pixel2(1);

--rand 2
produse_partiale(2)(0)<=pixel1(0) and pixel2(2); 
produse_partiale(2)(1)<=pixel1(1) and pixel2(2);
produse_partiale(2)(2)<=pixel1(2) and pixel2(2);
produse_partiale(2)(3)<=pixel1(3) and pixel2(2);
produse_partiale(2)(4)<=pixel1(4) and pixel2(2);
produse_partiale(2)(5)<=pixel1(5) and pixel2(2);
produse_partiale(2)(6)<=pixel1(6) and pixel2(2);
produse_partiale(2)(7)<=pixel1(7) and pixel2(2);

--rand 3
produse_partiale(3)(0)<=pixel1(0) and pixel2(3); 
produse_partiale(3)(1)<=pixel1(1) and pixel2(3);
produse_partiale(3)(2)<=pixel1(2) and pixel2(3);
produse_partiale(3)(3)<=pixel1(3) and pixel2(3);
produse_partiale(3)(4)<=pixel1(4) and pixel2(3);
produse_partiale(3)(5)<=pixel1(5) and pixel2(3);
produse_partiale(3)(6)<=pixel1(6) and pixel2(3);
produse_partiale(3)(7)<=pixel1(7) and pixel2(3);

--rand 4
produse_partiale(4)(0)<=pixel1(0) and pixel2(4); 
produse_partiale(4)(1)<=pixel1(1) and pixel2(4);
produse_partiale(4)(2)<=pixel1(2) and pixel2(4);
produse_partiale(4)(3)<=pixel1(3) and pixel2(4);
produse_partiale(4)(4)<=pixel1(4) and pixel2(4);
produse_partiale(4)(5)<=pixel1(5) and pixel2(4);
produse_partiale(4)(6)<=pixel1(6) and pixel2(4);
produse_partiale(4)(7)<=pixel1(7) and pixel2(4);

--rand 5
produse_partiale(5)(0)<=pixel1(0) and pixel2(5); 
produse_partiale(5)(1)<=pixel1(1) and pixel2(5);
produse_partiale(5)(2)<=pixel1(2) and pixel2(5);
produse_partiale(5)(3)<=pixel1(3) and pixel2(5);
produse_partiale(5)(4)<=pixel1(4) and pixel2(5);
produse_partiale(5)(5)<=pixel1(5) and pixel2(5);
produse_partiale(5)(6)<=pixel1(6) and pixel2(5);
produse_partiale(5)(7)<=pixel1(7) and pixel2(5);

--rand 6
produse_partiale(6)(0)<=pixel1(0) and pixel2(6); 
produse_partiale(6)(1)<=pixel1(1) and pixel2(6);
produse_partiale(6)(2)<=pixel1(2) and pixel2(6);
produse_partiale(6)(3)<=pixel1(3) and pixel2(6);
produse_partiale(6)(4)<=pixel1(4) and pixel2(6);
produse_partiale(6)(5)<=pixel1(5) and pixel2(6);
produse_partiale(6)(6)<=pixel1(6) and pixel2(6);
produse_partiale(6)(7)<=pixel1(7) and pixel2(6);

--rand 7
produse_partiale(7)(0)<=pixel1(0) and pixel2(7); 
produse_partiale(7)(1)<=pixel1(1) and pixel2(7);
produse_partiale(7)(2)<=pixel1(2) and pixel2(7);
produse_partiale(7)(3)<=pixel1(3) and pixel2(7);
produse_partiale(7)(4)<=pixel1(4) and pixel2(7);
produse_partiale(7)(5)<=pixel1(5) and pixel2(7);
produse_partiale(7)(6)<=pixel1(6) and pixel2(7);
produse_partiale(7)(7)<=pixel1(7) and pixel2(7);


-- prima linie-> a doua , primul nivel
se0:entity WORK.SE port map
(
x=>produse_partiale(0)(1),
y=>produse_partiale(1)(0),
tin=>'0',
tout=>tout_linia1(0),
s=>sume_linia1(0)
);
se1:entity WORK.SE port map
(
x=>produse_partiale(0)(2),
y=>produse_partiale(1)(1),
tin=>tout_linia1(0),
tout=>tout_linia1(1),
s=>sume_linia1(1)
);

se2:entity WORK.SE port map
(
x=>produse_partiale(0)(3),
y=>produse_partiale(1)(2),
tin=>tout_linia1(1),
tout=>tout_linia1(2),
s=>sume_linia1(2)
);

se3:entity WORK.SE port map
(
x=>produse_partiale(0)(4),
y=>produse_partiale(1)(3),
tin=>tout_linia1(2),
tout=>tout_linia1(3),
s=>sume_linia1(3)
);

se4:entity WORK.SE port map
(
x=>produse_partiale(0)(5),
y=>produse_partiale(1)(4),
tin=>tout_linia1(3),
tout=>tout_linia1(4),
s=>sume_linia1(4)
);

se5:entity WORK.SE port map
(
x=>produse_partiale(0)(6),
y=>produse_partiale(1)(5),
tin=>tout_linia1(4),
tout=>tout_linia1(5),
s=>sume_linia1(5)
);

se6:entity WORK.SE port map
(
x=>produse_partiale(0)(7),
y=>produse_partiale(1)(6),
tin=>tout_linia1(5),
tout=>tout_linia1(6),
s=>sume_linia1(6)
);

se7:entity WORK.SE port map
(
x=>'0',
y=>produse_partiale(1)(7),
tin=>tout_linia1(6),
tout=>tout_linia1(7),
s=>sume_linia1(7)
);

-- a doua linie


se8:entity WORK.SE port map
(
x=>sume_linia1(1),
y=>produse_partiale(2)(0),
tin=>'0',
tout=>tout_linia2(0),
s=>sume_linia2(0)
);
se9:entity WORK.SE port map
(
x=>sume_linia1(2),
y=>produse_partiale(2)(1),
tin=>tout_linia2(0),
tout=>tout_linia2(1),
s=>sume_linia2(1)
);

se10:entity WORK.SE port map
(
x=>sume_linia1(3),
y=>produse_partiale(2)(2),
tin=>tout_linia2(1),
tout=>tout_linia2(2),
s=>sume_linia2(2)
);

se11:entity WORK.SE port map
(
x=>sume_linia1(4),
y=>produse_partiale(2)(3),
tin=>tout_linia2(2),
tout=>tout_linia2(3),
s=>sume_linia2(3)
);

se12:entity WORK.SE port map
(
x=>sume_linia1(5),
y=>produse_partiale(2)(4),
tin=>tout_linia2(3),
tout=>tout_linia2(4),
s=>sume_linia2(4)
);

se13:entity WORK.SE port map
(
x=>sume_linia1(6),
y=>produse_partiale(2)(5),
tin=>tout_linia2(4),
tout=>tout_linia2(5),
s=>sume_linia2(5)
);

se14:entity WORK.SE port map
(
x=>sume_linia1(7),
y=>produse_partiale(2)(6),
tin=>tout_linia2(5),
tout=>tout_linia2(6),
s=>sume_linia2(6)
);

se15:entity WORK.SE port map
(
x=>tout_linia1(7),
y=>produse_partiale(2)(7),
tin=>tout_linia2(6),
tout=>tout_linia2(7),
s=>sume_linia2(7)
);

-- a treia linie


se16:entity WORK.SE port map
(
x=>sume_linia2(1),
y=>produse_partiale(3)(0),
tin=>'0',
tout=>tout_linia3(0),
s=>sume_linia3(0)
);
se17:entity WORK.SE port map
(
x=>sume_linia2(2),
y=>produse_partiale(3)(1),
tin=>tout_linia3(0),
tout=>tout_linia3(1),
s=>sume_linia3(1)
);

se18:entity WORK.SE port map
(
x=>sume_linia2(3),
y=>produse_partiale(3)(2),
tin=>tout_linia3(1),
tout=>tout_linia3(2),
s=>sume_linia3(2)
);

se19:entity WORK.SE port map
(
x=>sume_linia2(4),
y=>produse_partiale(3)(3),
tin=>tout_linia3(2),
tout=>tout_linia3(3),
s=>sume_linia3(3)
);

se20:entity WORK.SE port map
(
x=>sume_linia2(5),
y=>produse_partiale(3)(4),
tin=>tout_linia3(3),
tout=>tout_linia3(4),
s=>sume_linia3(4)
);

se21:entity WORK.SE port map
(
x=>sume_linia2(6),
y=>produse_partiale(3)(5),
tin=>tout_linia3(4),
tout=>tout_linia3(5),
s=>sume_linia3(5)
);

se22:entity WORK.SE port map
(
x=>sume_linia2(7),
y=>produse_partiale(3)(6),
tin=>tout_linia3(5),
tout=>tout_linia3(6),
s=>sume_linia3(6)
);

se23:entity WORK.SE port map
(
x=>tout_linia2(7),
y=>produse_partiale(3)(7),
tin=>tout_linia3(6),
tout=>tout_linia3(7),
s=>sume_linia3(7)
);

-- a patra linie


se24:entity WORK.SE port map
(
x=>sume_linia3(1),
y=>produse_partiale(4)(0),
tin=>'0',
tout=>tout_linia4(0),
s=>sume_linia4(0)
);
se25:entity WORK.SE port map
(
x=>sume_linia3(2),
y=>produse_partiale(4)(1),
tin=>tout_linia4(0),
tout=>tout_linia4(1),
s=>sume_linia4(1)
);

se26:entity WORK.SE port map
(
x=>sume_linia3(3),
y=>produse_partiale(4)(2),
tin=>tout_linia4(1),
tout=>tout_linia4(2),
s=>sume_linia4(2)
);

se27:entity WORK.SE port map
(
x=>sume_linia3(4),
y=>produse_partiale(4)(3),
tin=>tout_linia4(2),
tout=>tout_linia4(3),
s=>sume_linia4(3)
);

se28:entity WORK.SE port map
(
x=>sume_linia3(5),
y=>produse_partiale(4)(4),
tin=>tout_linia4(3),
tout=>tout_linia4(4),
s=>sume_linia4(4)
);

se29:entity WORK.SE port map
(
x=>sume_linia3(6),
y=>produse_partiale(4)(5),
tin=>tout_linia4(4),
tout=>tout_linia4(5),
s=>sume_linia4(5)
);

se30:entity WORK.SE port map
(
x=>sume_linia3(7),
y=>produse_partiale(4)(6),
tin=>tout_linia4(5),
tout=>tout_linia4(6),
s=>sume_linia4(6)
);

se31:entity WORK.SE port map
(
x=>tout_linia3(7),
y=>produse_partiale(4)(7),
tin=>tout_linia4(6),
tout=>tout_linia4(7),
s=>sume_linia4(7)
);

-- a cincea linie


se32:entity WORK.SE port map
(
x=>sume_linia4(1),
y=>produse_partiale(5)(0),
tin=>'0',
tout=>tout_linia5(0),
s=>sume_linia5(0)
);
se33:entity WORK.SE port map
(
x=>sume_linia4(2),
y=>produse_partiale(5)(1),
tin=>tout_linia5(0),
tout=>tout_linia5(1),
s=>sume_linia5(1)
);

se34:entity WORK.SE port map
(
x=>sume_linia4(3),
y=>produse_partiale(5)(2),
tin=>tout_linia5(1),
tout=>tout_linia5(2),
s=>sume_linia5(2)
);

se35:entity WORK.SE port map
(
x=>sume_linia4(4),
y=>produse_partiale(5)(3),
tin=>tout_linia5(2),
tout=>tout_linia5(3),
s=>sume_linia5(3)
);

se36:entity WORK.SE port map
(
x=>sume_linia4(5),
y=>produse_partiale(5)(4),
tin=>tout_linia5(3),
tout=>tout_linia5(4),
s=>sume_linia5(4)
);

se37:entity WORK.SE port map
(
x=>sume_linia4(6),
y=>produse_partiale(5)(5),
tin=>tout_linia5(4),
tout=>tout_linia5(5),
s=>sume_linia5(5)
);

se38:entity WORK.SE port map
(
x=>sume_linia4(7),
y=>produse_partiale(5)(6),
tin=>tout_linia5(5),
tout=>tout_linia5(6),
s=>sume_linia5(6)
);

se39:entity WORK.SE port map
(
x=>tout_linia4(7),
y=>produse_partiale(5)(7),
tin=>tout_linia5(6),
tout=>tout_linia5(7),
s=>sume_linia5(7)
);

-- a sasea linie


se40:entity WORK.SE port map
(
x=>sume_linia5(1),
y=>produse_partiale(6)(0),
tin=>'0',
tout=>tout_linia6(0),
s=>sume_linia6(0)
);
se41:entity WORK.SE port map
(
x=>sume_linia5(2),
y=>produse_partiale(6)(1),
tin=>tout_linia6(0),
tout=>tout_linia6(1),
s=>sume_linia6(1)
);

se42:entity WORK.SE port map
(
x=>sume_linia5(3),
y=>produse_partiale(6)(2),
tin=>tout_linia6(1),
tout=>tout_linia6(2),
s=>sume_linia6(2)
);

se43:entity WORK.SE port map
(
x=>sume_linia5(4),
y=>produse_partiale(6)(3),
tin=>tout_linia6(2),
tout=>tout_linia6(3),
s=>sume_linia6(3)
);

se44:entity WORK.SE port map
(
x=>sume_linia5(5),
y=>produse_partiale(6)(4),
tin=>tout_linia6(3),
tout=>tout_linia6(4),
s=>sume_linia6(4)
);

se45:entity WORK.SE port map
(
x=>sume_linia5(6),
y=>produse_partiale(6)(5),
tin=>tout_linia6(4),
tout=>tout_linia6(5),
s=>sume_linia6(5)
);

se46:entity WORK.SE port map
(
x=>sume_linia5(7),
y=>produse_partiale(6)(6),
tin=>tout_linia6(5),
tout=>tout_linia6(6),
s=>sume_linia6(6)
);

se47:entity WORK.SE port map
(
x=>tout_linia5(7),
y=>produse_partiale(6)(7),
tin=>tout_linia6(6),
tout=>tout_linia6(7),
s=>sume_linia6(7)
);

-- a saptea linie


se48:entity WORK.SE port map
(
x=>sume_linia6(1),
y=>produse_partiale(7)(0),
tin=>'0',
tout=>tout_linia7(0),
s=>sume_linia7(0)
);
se49:entity WORK.SE port map
(
x=>sume_linia6(2),
y=>produse_partiale(7)(1),
tin=>tout_linia7(0),
tout=>tout_linia7(1),
s=>sume_linia7(1)
);

se50:entity WORK.SE port map
(
x=>sume_linia6(3),
y=>produse_partiale(7)(2),
tin=>tout_linia7(1),
tout=>tout_linia7(2),
s=>sume_linia7(2)
);

se51:entity WORK.SE port map
(
x=>sume_linia6(4),
y=>produse_partiale(7)(3),
tin=>tout_linia7(2),
tout=>tout_linia7(3),
s=>sume_linia7(3)
);

se52:entity WORK.SE port map
(
x=>sume_linia6(5),
y=>produse_partiale(7)(4),
tin=>tout_linia7(3),
tout=>tout_linia7(4),
s=>sume_linia7(4)
);

se53:entity WORK.SE port map
(
x=>sume_linia6(6),
y=>produse_partiale(7)(5),
tin=>tout_linia7(4),
tout=>tout_linia7(5),
s=>sume_linia7(5)
);

se54:entity WORK.SE port map
(
x=>sume_linia6(7),
y=>produse_partiale(7)(6),
tin=>tout_linia7(5),
tout=>tout_linia7(6),
s=>sume_linia7(6)
);

se55:entity WORK.SE port map
(
x=>tout_linia6(7),
y=>produse_partiale(7)(7),
tin=>tout_linia7(6),
tout=>tout_linia7(7),
s=>sume_linia7(7)
);


produs<= tout_linia7(7) & sume_linia7(7) & sume_linia7(6) & sume_linia7(5) & sume_linia7(4) & sume_linia7(3) & sume_linia7(2) & sume_linia7(1) & sume_linia7(0) & sume_linia6(0) & sume_linia5(0) & sume_linia4(0) & sume_linia3(0) & sume_linia2(0) & sume_linia1(0) & produse_partiale(0)(0);
newPixelValue<=produs(7 downto 0);
end Behavioral;


