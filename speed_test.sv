class speed_test extends uvm_test;

    `uvm_component_utils(speed_test)

    speed_env env;

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = speed_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        speed_seq seq;
        phase.raise_objection(this);

        seq = speed_seq::type_id::create("seq");
        seq.start(env.agent.sequencer);

        phase.drop_objection(this);
    endtask

endclass
