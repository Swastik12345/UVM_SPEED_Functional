class speed_driver extends uvm_driver #(speed_item);

    `uvm_component_utils(speed_driver)

    virtual speed_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        speed_item req;

        forever begin
            seq_item_port.get_next_item(req);

            vif.speed <= req.speed;
            @(posedge vif.clk);

            seq_item_port.item_done();
        end
    endtask

endclass
