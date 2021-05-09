library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity memROM is port (
        PC_endereco: in std_logic_vector(7 downto 0);
        instrucao: out std_logic_vector(7 downto 0)
);
end memROM;

architecture Behavior of memROM is 

constant instrucao0: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
CONSTANT instrucao1:  STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000100";

type ROMvector is array (natural range <>) OF std_logic_vector (7 DOWNTO 0);
constant ROM: ROMvector := (
    instrucao0,
    instrucao1
);
begin
	process(PC_endereco)
	begin
    instrucao <= ROM(conv_integer(PC_endereco));
	end process;
end Behavior;