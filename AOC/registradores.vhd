library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity registradores is port(
    regisA, regisB : in std_logic_vector(1 downto 0);
    dadoA,dadoB : in std_logic_vector(7 downto 0);
    dadoA_saida,dadoB_saida : out std_logic_vector(7 downto 0);
    escRegi : in std_logic_vector(7 downto 0);
    controleEscRegi : in std_logic
);
end entity;

architecture Behavior of registradores is 
TYPE vetorRegistrador IS ARRAY(0 TO 3) OF std_logic_vector (7 DOWNTO 0);
SIGNAL registrador : vetorRegistrador ;

    begin
        dadoA_saida <= registrador(to_integer(unsigned(regisA)));
        dadoB_saida <= registrador(to_integer(unsigned(regisB)));
end Behavior;
