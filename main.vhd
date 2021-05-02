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

component sum4 is port(
    entrada_A : in std_logic_vector(7 downto 0);
    entrada_B : in std_logic_vector(7 downto 0);
    saida : out std_logic_vector(7 downto 0)
);
end component;

component unidadeDControle is port(
    clock:        in std_logic;
    entrada4bits: in std_logic_vector(3 downto 0);
    opULA:     out std_logic_vector(3 downto 0);
    origULA: out std_logic;
    memLer: out std_logic;
    memEsc: out std_logic;
    mem_para_reg: out std_logic;
    regEsc: out std_logic;
    branch: out std_logic;
    jump:   out std_logic
);
end component;

signal clock1 : std_logic;
signal aux1 : std_logic_vector(7 downto 0);
signal saida1 : std_logic_vector(7 downto 0);
signal saida2 : std_logic_vector(7 downto 0);

-- Variaveis para receber os bits separados da saida da ROM para jogar na unidade de controle
signal partOP : std_logic_vector (7 downto 4);
signal partRS : std_logic_vector (3 downto 2);
signal partRT : std_logic_vector (1 downto 0);
------------------------------------------------

signal instrucaoROM : std_logic_vector(7 downto 0);

begin
    auxFIO1 : PC port map(clock1,aux1,saida1);
    auxFIO2 : sum4 port map(saida1,"00000100");
    auxFIO3 : memROM port map(saida1,saida2);
	 
    --- Divisão de bits
	 partOP <= saida2(7 downto 4); 
	 partRS <= saida2(3 downto 2);
	 partRT <= saida2(1 downto 0);
	 
    auxFIO4 : unidadeDControle port map(clock1,partOP);
	 
end behavior;