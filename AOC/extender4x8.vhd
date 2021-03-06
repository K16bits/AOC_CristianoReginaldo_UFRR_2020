library IEEE;
use IEEE.std_logic_1164.all;

entity extender4x8 is port(
    entrada : in std_logic_vector(3 downto 0);
    saida : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of extender4x8 is 
begin
    saida <= "0000"&entrada;
end behavior;