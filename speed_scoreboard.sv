class speed_scoreboard extends uvm_component;

    `uvm_component_utils(speed_scoreboard)

    uvm_analysis_imp #(speed_item, speed_scoreboard) analysis_export;

    virtual speed_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
    endfunction

    function void write(speed_item item);
        if (item.speed > 100 && vif.overspeed != 1)
            `uvm_error("SCOREBOARD", "Overspeed not asserted")
        else if (item.speed <= 100 && vif.overspeed != 0)
            `uvm_error("SCOREBOARD", "Overspeed wrongly asserted")
    endfunction

endclass
