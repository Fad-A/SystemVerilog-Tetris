package shape_pkg;
    typedef struct packed {
    logic [3:0][9:0] shape;
    logic [4:0] shapeRowPos; 
    } shapeStruct;

    typedef struct packed {
        shapeStruct[3:0] shapes;
    } shapeWithRotations;

    // Shape L1 and all its rotations
    parameter shapeStruct shape_L1_R0 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000010000,
            [1]: 10'b0000010000,
            [0]: 10'b0000011000,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L1_R1 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000000000,
            [1]: 10'b0000011100,
            [0]: 10'b0000010000,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L1_R2 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000011000,
            [1]: 10'b0000001000,
            [0]: 10'b0000001000,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L1_R3 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000000000,
            [1]: 10'b0000000100,
            [0]: 10'b0000011100,
        }',
        shapeRowPos: 5'd16
    }';

    parameter shapeWithRotations Shape_L1 = '{
        shapes: '{
            [3]: shape_L1_R3,
            [2]: shape_L1_R2,
            [1]: shape_L1_R1,
            [0]: shape_L1_R0
        }
    };

    // Shape L2 and its rotations
    parameter shapeStruct shape_L2_R0 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000010000,
            [1]: 10'b0000010000,
            [0]: 10'b0000110000,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L2_R1 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000000000,
            [1]: 10'b0000010000,
            [0]: 10'b0000011100,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L2_R2 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000011000,
            [1]: 10'b0000010000,
            [0]: 10'b0000010000,
        }',
        shapeRowPos: 5'd16
    }';
    parameter shapeStruct shape_L2_R3 '{
        shape: '{
            [3]: 10'b0,
            [2]: 10'b0000000000,
            [1]: 10'b0000011100,
            [0]: 10'b0000000100,
        }',
        shapeRowPos: 5'd16
    }';

    parameter shapeWithRotations Shape_L2 = '{
        shapes: '{
            [3]: shape_L2_R3,
            [2]: shape_L2_R2,
            [1]: shape_L2_R1,
            [0]: shape_L2_R0
        }
    };
    
endpackage