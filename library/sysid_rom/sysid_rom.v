`timescale 1ns / 1ps

module sysid_rom#(
  parameter ROM_WIDTH = 32,
  parameter ROM_ADDR_BITS = 6,
  parameter PATH_TO_FILE = "path_to_mem_init_file" )(

  output  [ROM_WIDTH-1:0]           rom_data,
  input   [ROM_ADDR_BITS-1:0]       rom_addr
);

(* rom_style = "distributed" *) reg [ROM_WIDTH-1:0] lut_rom [(2**ROM_ADDR_BITS)-1:0];
initial begin
  $readmemh(PATH_TO_FILE, lut_rom, 0, (2**ROM_ADDR_BITS)-1);
end

assign rom_data = lut_rom[rom_addr];

endmodule

