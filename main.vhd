library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity main is
port(
    A0 : in std_logic
);
end main;

architecture behavior of main is 

component PC is port (
    clock: in std_logic;
    entrada: in std_logic_vector(7 downto 0);
    saida: out std_logic_vector(7 downto 0)
);
end component;

component memROM is port (
        PC_endereco: in std_logic_vector(7 downto 0);
        instrucao: out std_logic_vector(7 downto 0)
);
end component;

signal clock1 : std_logic;
signal aux1 : std_logic_vector(7 downto 0);
signal saida1 : std_logic_vector(7 downto 0);
signal saida2 : std_logic_vector(7 downto 0);

signal instrucaoROM : std_logic_vector(7 downto 0);

begin
    auxFIO1 : PC port map(clock1,aux1,saida1);
    auxFIO2 : memROM port map(saida1,saida2);
end behavior;