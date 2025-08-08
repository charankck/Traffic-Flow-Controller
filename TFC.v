// traffic_light_controller.v
module traffic_light_controller(
    input clk,        // Clock input
    input reset,      // Reset signal
    output reg [2:0] lights // {Red, Yellow, Green}
);

    reg [3:0] count; // Counter for timing

    // State encoding
    parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            lights <= RED;
        end
        else begin
            count <= count + 1;

            // Cycle: Red (0–4), Green (5–9), Yellow (10–12)
            case (count)
                0,1,2,3,4:   lights <= RED;
                5,6,7,8,9:   lights <= GREEN;
                10,11,12:    lights <= YELLOW;
                default: begin
                    count <= 0;
                    lights <= RED;
                end
            endcase
        end
    end
endmodule
