module sign_extender #(
    parameter int IN_WIDTH = 16,
    parameter int OUT_WIDTH = 32
)
(
    input logic [IN_WIDTH-1:0] in_data,
    output logic [OUT_WIDTH-1:0] out_data
);

    always_comb begin
        // Sign-extend the input to the output width
        out_data = {{(OUT_WIDTH - IN_WIDTH){in_data[IN_WIDTH-1]}}, in_data};
    end
endmodule