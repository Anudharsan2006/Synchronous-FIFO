module sync_fifo #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8
)(
    input  wire                    clk,
    input  wire                    rst_n,
    input  wire                    wr_en,
    input  wire                    rd_en,
    input  wire [DATA_WIDTH-1:0]   data_in,
    
    output wire [DATA_WIDTH-1:0]   data_out,
    output wire                    full,
    output wire                    empty
);

    localparam ADDR_WIDTH = 3; 

    reg [DATA_WIDTH-1:0] fifo_ram [0:FIFO_DEPTH-1];

    reg [ADDR_WIDTH:0] wr_ptr;
    reg [ADDR_WIDTH:0] rd_ptr;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
        end else if (wr_en && !full) begin
            fifo_ram[wr_ptr[ADDR_WIDTH-1:0]] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end
    end

    assign data_out = fifo_ram[rd_ptr[ADDR_WIDTH-1:0]];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= 0;
        end else if (rd_en && !empty) begin
            rd_ptr <= rd_ptr + 1;
        end
    end

    assign empty = (wr_ptr == rd_ptr);

    assign full  = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) && 
                   (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule
