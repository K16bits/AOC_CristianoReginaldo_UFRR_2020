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
    opULA:     out std_logic_vector(1 downto 0);
    origULA: out std_logic;
    memLer: out std_logic;
    memEsc: out std_logic;
    mem_para_reg: out std_logic;
    regEsc: out std_logic;
    dvc: out std_logic;
    jump:   out std_logic
);
end component;

component registradores is port(
    regisA, regisB : in std_logic_vector(1 downto 0);
    dadoA,dadoB : in std_logic_vector(7 downto 0);
    dadoA_saida,dadoB_saida : out std_logic_vector(7 downto 0);
    escRegi : in std_logic_vector(7 downto 0);
    controleEscRegi : in std_logic
);
end component;


component multiplex2x1 is 
port(
    A,B : in std_logic_vector(1 downto 0);
    Sel: in std_logic;
    S : out std_logic_vector(1 downto 0)
);
end component;

component multiplex8bits2x1 is 
port(
    A,B : in std_logic_vector(7 downto 0);
    Sel: in std_logic;
    S : out std_logic_vector(7 downto 0)
);
end component;


component extender4x8 is port(
    entrada : in std_logic_vector(3 downto 0);
    saida : out std_logic_vector(7 downto 0)
);
end component;

component extender2x8 is port (
    A : in std_logic_vector(1 downto 0);
    A_saida : out std_logic_vector(7 downto 0)
);
end component;


component ula is port (
    entradaA : in std_logic_vector(7 downto 0);
    entradaB : in std_logic_vector(7 downto 0);
    opULA : in std_logic_vector(1 downto 0);
    zero : out std_logic;
    resultado : out std_logic_vector(7 downto 0)
);
end component;

component andgate is 
port(
    A_in : in std_logic;
    B_in : in std_logic;
    S : out std_logic
);
end component;

component memRAM is port(
    clock: in std_logic;
    endereco : in std_logic_vector(7 downto 0);
    escritaDado : in std_logic_vector(7 downto 0);
    memLer : in std_logic;
    memEsc : in std_logic;
    saidaLeituraDado : out std_logic_vector(7 downto 0)
);
end component;

signal clock1 : std_logic;
signal aux1 : std_logic_vector(7 downto 0);
signal saida1 : std_logic_vector(7 downto 0);
signal saida2 : std_logic_vector(7 downto 0);

-- divisao de bits para a unidade de controle
signal bitControle : std_logic_vector (7 downto 4);
signal registradoA : std_logic_vector (3 downto 2);
signal registradoB : std_logic_vector (1 downto 0);
----------------------- Endere??o + extensor------------------
signal enderecobits : std_logic_vector (3 downto 0);
signal enderecobits_saida : std_logic_vector (7 downto 0);
signal saidaMultpexUla : std_logic_vector (7 downto 0);
------------------------------------------------
signal dataA : std_logic_vector (7 downto 0);
signal dataB : std_logic_vector (7 downto 0);
------------------------------------------------
signal auxControleRegis : std_logic;
signal saidaDmult2x : std_logic_vector (1 downto 0);
signal registradoFake : std_logic_vector (1 downto 0);
-------------------------------------------------
signal instrucaoROM : std_logic_vector(7 downto 0);


signal dataA_saida : std_logic_vector(7 downto 0);
signal dataB_saida : std_logic_vector(7 downto 0);

-------------------------------Depois do registrador -------------------------------
signal saidaResultULA : std_logic_vector(7 downto 0);
signal zeroULA : std_logic;

----------------------- Unidade de controle -----------------------
signal opUlaOUT : std_logic_vector (1 downto 0);
signal origULAOUT : std_logic;
signal memLerOUT : std_logic;
signal memEscOUT : std_logic;
signal mem_para_regOUT : std_logic;
signal regEscOUT : std_logic;
signal dvcOUT : std_logic;
signal jumpOUT : std_logic;
--------------------------------------------------------------------

signal saidaAND : std_logic;
-----------------TOPO DO PROCESSADOR---------------------------------

signal saidaDoSomador : std_logic_vector(7 downto 0);
signal saidaMultiplex1Final : std_logic_vector(7 downto 0);
signal saidaMultiplex2Final : std_logic_vector(7 downto 0);

---------------------    CONEXAO DE MULTPLEXADOR DA RAM        ---------------------------------

signal saidaLeituraDadoOUT : std_logic_vector(7 downto 0);
signal saidaMultidaRAM : std_logic_vector(7 downto 0);
----------------------------------------------------------------------

begin
    Pc_para_MemoriaInstru : PC port map(clock1,saidaMultiplex2Final,saida1);
    somador4bits : sum4 port map(saida1,"00000100",saidaDoSomador);
    Memoria_DivisaoBits : memROM port map(saida1,saida2);
	
    --Divis??o de bits
	bitControle <= saida2(7 downto 4);
	registradoA <= saida2(3 downto 2);a
	registradoB <= saida2(1 downto 0);
    enderecobits <= saida2(3 downto 0); ----------------------- Endere??o + extensor------------------

    -----------------------------------------------------------------------------------------------------
    enderecoComExtensor : extender4x8 port map(enderecobits,enderecobits_saida);
    unidadedecontrole : unidadeDControle port map (clock1,bitControle,opUlaOUT,origULAOUT,memLerOUT,memEscOUT,mem_para_regOUT,regEscOUT,dvcOUT,jumpOUT);


    -------------------EXTENSOR : 2 bits para 8 bits para a memoria -----------------------------------
    extensor2x8dadoA : extender2x8 port map(registradoA,dataA);
    extensor2x8dadoB : extender2x8 port map(registradoB,dataB);
    -------------------------------------------------------------------------------------
    multiplexAntesRegis : multiplex2x1 port map (registradoB,registradoFake,'0',saidaDmult2x);
	registradoresConexao : registradores port map (registradoA,saidaDmult2x,dataA,dataB,dataA_saida,dataB_saida,saidaMultidaRAM,regEscOUT);
    multiplexDepoisRegis : multiplex8bits2x1 port map (dataB_saida,enderecobits_saida,origULAOUT,saidaMultpexUla); ------------- Liga????o com o extensor de 8 bits

    ------------------------------------------------------------------------------------------------------
    ligacaoULA : ula port map(dataA_saida,saidaMultpexUla,opUlaOUT,zeroULA,saidaResultULA);
    -------------------------------------------------------------------------------------------------------
    
    dvi_e_zero : andgate port map(dvcOUT,zeroULA,saidaAND);
    multplexadorTOPO1 : multiplex8bits2x1 port map(enderecobits_saida,saidaDoSomador,saidaAND,saidaMultiplex1Final);

    multplexadorTOPO2 : multiplex8bits2x1 port map(enderecobits_saida,saidaMultiplex1Final,jumpOUT,saidaMultiplex2Final);
    -------------------------------------------------------------------------------------------------------
    
    ---------------------------------- MEMORIA RAM CONEX??O -------------------------------------------------------
    conexaomemRAM : memRAM port map('1',enderecobits_saida,saidaResultULA,memLerOUT,memEscOUT,saidaLeituraDadoOUT);

    multplexadorDEPOISRAM : multiplex8bits2x1 port map(saidaLeituraDadoOUT,saidaResultULA,mem_para_regOUT,saidaMultidaRAM);
    ----------------------------------------------------------------------------------------------------------

end behavior;