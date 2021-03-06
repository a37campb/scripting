library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity mem is
  generic (
    data_width : natural := 8;
    addr_width : natural := 4
  );
  port (
    clk      : in  std_logic;
    wr_en    : in  std_logic;
    addr     : in  unsigned( addr_width - 1 downto 0 );
    i_data   : in  std_logic_vector( data_width - 1 downto 0 );
    o_data   : out std_logic_vector( data_width - 1 downto 0 )
  );
end entity;


architecture main of mem is
  type mem_type is array ( 2**addr_width-1 downto 0 ) of
    std_logic_vector( data_width - 1 downto 0 ) ;
  signal mem        : mem_type ;
  signal mem_output : std_logic_vector( data_width - 1 downto 0 );
  signal rd_disable : std_logic;
begin
  proc : process (clk)
  begin
    if rising_edge(clk) then
      if wr_en = '1' then
        mem( to_integer( addr ) ) <= i_data ;
      end if ;
      mem_output <= mem( to_integer( addr ) );
    end if ;
  end process;

  process (clk)
  begin
    if rising_edge(clk) then
      rd_disable <= wr_en;
    end if;
  end process;

  o_data <=   (others => 'X') when rd_disable='1'
         else mem_output;
  
end architecture;

