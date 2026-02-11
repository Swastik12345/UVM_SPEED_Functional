class speed_item extends uvm_sequence_item;

    rand bit [15:0] speed;

    `uvm_object_utils(speed_item)

    function new(string name = "speed_item");
        super.new(name);
    endfunction

endclass
