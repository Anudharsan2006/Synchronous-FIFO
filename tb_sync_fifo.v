`timescale 1ns / 1ps

module tb_sync_fifo;

    reg clk;
    reg rst_n;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full;
    wire empty;

    sync_fifo #(
        .DATA_WIDTH(8),
        .FIFO_DEPTH(8)
    ) uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .wr_en(wr_en), 
        .rd_en(rd_en),
        .data_in(data_in), 
        .data_out(data_out), 
        .full(full), 
        .empty(empty)
    );

    always #10 clk = ~clk;

    initial begin
        $dumpfile("fifo_simulation.vcd");
        $dumpvars(0, tb_sync_fifo);
    end

    initial begin
        clk = 0; 
        rst_n = 0; 
        wr_en = 0; 
        rd_en = 0;
        data_in = 8'h55;
        
        #40; 
        rst_n = 1;
        
        #20; 
        wr_en = 1;
        #160;
        
        wr_en = 0;
        #40;
        
        rd_en = 1;
        #160;
        
        rd_en = 0;
        #40;
        
        $finish;
    end
      
endmodule
