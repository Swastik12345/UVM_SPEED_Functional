class speed_sequencer extends uvm_sequencer #(speed_item);

    `uvm_component_utils(speed_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

endclass
