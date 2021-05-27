##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################

set_property IOSTANDARD AY38 [get_ports clk_n]
set_property IOSTANDARD AY37 [get_ports clk_p]
set_property IOSTANDARD BD21 [get_ports rst_n]
set_property IOSTANDARD AU22 [get_ports heating]
set_property IOSTANDARD AT22 [get_ports cooling]
set_property IOSTANDARD BC21 [get_ports temperature_0]
set_property IOSTANDARD BB21 [get_ports temperature_1]
set_property IOSTANDARD BA20 [get_ports temperature_2]
set_property IOSTANDARD AL20 [get_ports temperature_3]
set_property IOSTANDARD AT20 [get_ports temperature_4]




