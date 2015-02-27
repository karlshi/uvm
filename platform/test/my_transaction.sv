class my_transaction extends uvm_sequence_item;
	rand bit [47:0] dmac;
	rand bit [47:0] smac;
	rand bit [15:0] ether_type;
	rand byte pload[];
	rand bit [31:0] crc;

	constraint pload_cons {
		pload.size >= 45;
		pload.size <= 1500;
	}

	function bit[31:0] calc_crc();
		return 32'b0;
	endfunction

	function void post_randomize();
		crc = calc_crc;
	endfunction : post_randomize

	`uvm_object_utils(my_transaction)

	function new(string name = "my_transaction");
		super.new(name);
	endfunction : new

	function void my_print();
		$display("dmac = %0h", 		dmac);
		$display("smac = %0h", 		smac);
		$display("ether_type = %0h", ether_type);
		for(int i=0; i<pload.size();i++) begin
			$display("pload[%0h] = %0h", i, pload[i]);
		end
		$display("crc = %0h", crc);
	endfunction

endclass