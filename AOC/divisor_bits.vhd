library IEEE;
use IEEE.std_logic_1164.all;

entity divisor_bits is port (
    entrada : in std_logic_vector(7 downto 0);
    saida_controle : out std_logic_vector(3 downto 0);
    saida_regA : out std_logic_vector(1 downto 0);
    saida_regB : out std_logic_vector(1 downto 0);

    saida_extensor1 : out std_logic_vector(3 downto 0);
    saida_extensor2 : out std_logic_vector(1 downto 0)
);
end entity;

architecture behavior of divisor_bits is
begin
    saida_controle  <= entrada(7 downto 4);
    saida_regA      <= entrada(3 downto 2);
    saida_regB      <= entrada(1 downto 0);

    saida_extensor1  <= entrada(3 downto 0);
    saida_extensor2  <= entrada(1 downto 0);
end behavior;