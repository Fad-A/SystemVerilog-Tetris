// ## Fadi Ajaj ## 


module replaceRow(input logic[19:0] inputRow, input logic clk, output logic[19:0] outputRow);
    always_ff @(posedge clk)
    begin
        outputRow = InputRow;
    end
endmodule

module clearRow(input logic[19:0] inputRow, input logic clk);
    always_ff @(posedge clk)
    begin
        inputRow = 0;
    end
endmodule