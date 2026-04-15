module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines

    binary myBinary(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .State(led[9:7]),
        .z(led[1])
    );
    
    onehot myOneHot(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .Astate(led[2]),
        .Bstate(led[3]),
        .Cstate(led[4]),
        .Dstate(led[5]),
        .Estate(led[6]),
        .z(led[0])
    );
    
    
    
endmodule