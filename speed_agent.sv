class speed_agent extends uvm_agent;

    `uvm_component_utils(speed_agent)

    speed_driver     driver;
    speed_monitor    monitor;
    speed_sequencer  sequencer;

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        driver    = speed_driver::type_id::create("driver", this);
        monitor   = speed_monitor::type_id::create("monitor", this);
        sequencer = speed_sequencer::type_id::create("sequencer", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction

endclass
