typedef struct packed {
  logic [3:0][9:0] shape;
  logic [4:0] shapeRowPos; 
} shapeStruct;

// Take the shape and move it to the down on the screen.
module moveDown(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge; // 1-> at edge -> do nothing, 0 -> you may move
    logic space; // 1-> theres space, 0-> theres no space
    logic [19:0][9:0] nextOutput // 

    always_comb begin  
        atEdge = shape.shapeRowPos == 0;
        if (!atEdge) begin
            nextOutput = screen 
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape; // Remove current shape from 
            // Xor the nextOutput with the game, if it replaces only zeros then anding it with shape should return 0.
            space = ((nextOutput[shape.shapeRowPos-1 +:4] ^ shape.shape) & shape.shape) == shape.shape;
            // Add shape
            nextOutput[shape.shapeRowPos-1 +:4] = nextOutput[shape.shapeRowPos-1 +:4] | shape.shape; // add shape moved down
        end
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge | !space) begin
            outputScreen <= screen;
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

// Take the shape and move it to the right on the screen.
module moveRight(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge, space;
    shapeStruct [3:0][9:0] shapeShifted;
    logic [19:0][9:0] nextOutput;
    assign shapeShifted.shapeRowPos = shape.shapeRowPos;
    always_comb begin  
        atEdge = shape.shape[0][0] | shape.shape[1][0] | shape.shape[2][0] | shape.shape[3][0];
        if(!atEdge) begin
            nextOutput = screen ;
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape;
            for (int r = 0; r < 4; r++) begin
                shapeShifted.shape[r] = {1'b0, shape.shape[r][9:1]};
            end
            space = ((nextOutput[shape.shapeRowPos +:4] ^ shapeShifted.shape) & shapeShifted.shape) == shapeShifted;
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] | shapeShifted.shape;
        end
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge | !space) begin
            outputScreen <= screen;
            outputShape <= shape.shape;
        end 
        else
        begin
            outputScreen <= nextOutput;
            outputShape <= shapeShifted;
        end
    end
endmodule 

// Take the shape and move it to the left on the screen.
module moveLeft(input shapeStruct shape, input logic [19:0][9:0] screen, input logic clk, moveSignal,
                 output logic [19:0][9:0] outputScreen, output shapeStruct outputShape);
    logic atEdge, space;
    shapeStruct [3:0][9:0] shapeShifted;
    logic [19:0][9:0] nextOutput
    assign shapeShifted.shapeRowPos = shape.shapeRowPos;
    always_comb begin  
        atEdge = shape.shape[0][9] | shape.shape[1][9] | shape.shape[2][9] | shape.shape[3][9];
        if(!atEdge) begin
            nextOutput = screen;
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] ^ shape.shape;
            for (int r = 0; r < 4; r++) begin
                shapeShifted.shape[r] = {shape.shape[r][8:0] , 1'b0};
            end
            space = ((nextOutput[shape.shapeRowPos +:4] ^ shapeShifted.shape) & shapeShifted.shape) == shapeShifted;
            nextOutput[shape.shapeRowPos +:4] = nextOutput[shape.shapeRowPos +:4] | shapeShifted.shape;
        end
    end
    always_ff @(posedge clk) begin
        if(!moveSignal | atEdge | !space) begin
            outputScreen <= screen;
            outputShape <= shape.shape;
        end 
        else begin
            outputScreen <= nextOutput;
            outputShape <= shapeShifted;
        end
    end
endmodule
