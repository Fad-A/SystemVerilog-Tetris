typedef struct packed {
  logic [3:0][9:0] shape;
  logic [4:0] shapeRowPos; 
} shapeStruct;


// Take the shape and move it to the right on the screen.
module moveRight(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge;
    shapeStruct [3:0][9:0] shape_shifted;
    assign shape_shifted.shapeRowPos = shape.shapeRowPos;
    logic [19:0][9:0] nextOutput
    always_comb
    begin  
        atEdge = shape.shape[0][0] | shape.shape[1][0] | shape.shape[2][0] | shape.shape[3][0];
        nextOutput = screen 
        nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape;
        for (int r = 0; r < 4; r++) begin
            shape_shifted.shape[r] = {1'b0, shape.shape[r][9:1]};
        end
        nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] | shape_shifted.shape;
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge) begin
            output <= screen;
            outputShape <= shape.shape;
        end 
        else
        begin
            output <= nextOutput;
            outputShape <= shape_shifted;
        end
    end
endmodule 

// Take the shape and move it to the left on the screen.
module moveLeft(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge;
    shapeStruct [3:0][9:0] shape_shifted;
    assign shape_shifted.shapeRowPos = shape.shapeRowPos;
    logic [19:0][9:0] nextOutput
    always_comb
    begin  
        atEdge = shape.shape[0][9] | shape.shape[1][9] | shape.shape[2][9] | shape.shape[3][9];
        nextOutput = screen 
        nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape
        for (int r = 0; r < 4; r++) begin
            shape_shifted.shape[r] = {shape.shape[r][8:0] , 1'b0};
        end
        nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] | shape_shifted.shape;
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge) begin
            output <= screen;
            outputShape <= shape.shape;
        end 
        else
        begin
            output <= nextOutput;
            outputShape <= shape_shifted;
        end
    end
endmodule

// Take the shape and move it to the down on the screen.
module moveDown(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge;
    logic [19:0][9:0] nextOutput
    always_comb
    begin  
        atEdge = shape.shapeRowPos == 0;
        if (!atEdge) begin
            nextOutput = screen 
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape; // Remove current shape from 
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos-1 +:4] | shape.shape; // add it back 
        end
        
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge) begin
            output <= screen;
            outputShape <= shape;
        end 
        else
        begin
            output <= nextOutput;
            outputShape.shape <= shape.shape;
            outputShape.shapeRowPos <= shape.shapeRowPos - 1;
            
        end
    end
endmodule 