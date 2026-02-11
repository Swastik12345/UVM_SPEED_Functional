class speed_monitor extends uvm_monitor;

    `uvm_component_utils(speed_monitor)

    virtual speed_if vif;
    uvm_analysis_port #(speed_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    task run_phase(uvm_phase phase);
        speed_item item;

        forever begin
            @(posedge vif.clk);

            item = speed_item::type_id::create("item");
            item.speed = vif.speed;

            ap.write(item);
        end
    endtask

endclass
