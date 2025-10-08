typedef struct packed {
  logic [2:0][9:0] shape;
  logic [4:0] shapeRowPos; 
} shape;


// Take the shape and move it to the right on the screen. Checks if it can even do that
module moveRight(input shape shp, input logic [19:0][9:0] screen, input logic clk,
                 output logic [19:0][9:0] outputScreen);
    always_comb begin
    logic atEdge;
    logic [2:0][9:0] shape_shifted = shp.shape;
    assign atEdge = shp.shape[0][0] | shp.shape[1][0] | shp.shape[2][0];
    screen[shp.shapeRowPos:shp.shapeRowPos-2] = screen[shp.shapeRowPos:shp.shapeRowPos-2] ^ shp.shape;
    end

    always_ff @(posedge clk) begin
        if (atEdge) begin
            outputScreen = screen;
        end
        else begin
            for (int r = 0; r < 3; r++) begin
                shape_shifted[r] = {1'b0, shp.shape[r][8:0]};
            end
            outputScreen[shp.shapeRowPos:shp.shapeRowPos-2] = screen[shp.shapeRowPos:shp.shapeRowPos-2] | shape_shifted;
        end
    end
endmodule 
