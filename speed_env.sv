class speed_env extends uvm_env;

    `uvm_component_utils(speed_env)

    speed_agent      agent;
    speed_scoreboard sb;

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent = speed_agent::type_id::create("agent", this);
        sb    = speed_scoreboard::type_id::create("sb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        agent.monitor.ap.connect(sb.analysis_export);
    endfunction

endclass
