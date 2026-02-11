class speed_seq extends uvm_sequence #(speed_item);

    `uvm_object_utils(speed_seq)

    task body();
        speed_item req;

        repeat (20) begin
            req = speed_item::type_id::create("req");
            start_item(req);
            assert(req.randomize() with { speed inside {[0:150]}; });
            finish_item(req);
        end
    endtask

endclass
