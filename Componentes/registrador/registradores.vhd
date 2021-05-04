library IEEE;
use IEEE.std_logic_1164.all;

entity registradores is port(
    regisA, regisB : in std_logic_vector(1 downto 0);
    dadoA,dadoB : out std_logic_vector(1 downto 0);
    escRegi : in std_logic_vector(1 downto 0)
);
end entity;

architecture Behavior of registradores is 
    begin
end Behavior;
