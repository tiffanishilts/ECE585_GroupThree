module parse;
initial begin 

	int file;
	int a; //address

	int c;	  // clk
	int o;    // operation 
	

	file = $fopen("./trace.txt", "r");
	`ifdef VERBOSE
	   if(file)begin
	      $display("file was opened successfully");
	   end
	   else	begin
	       $error("opening file was unsuccessful");
	   end
	`endif


	while($fscanf(file, "%d %d %h", c, o, a)==3)begin
	`ifdef VERBOSE
	$display("Time=%d Operation=%d Address=%h", c, o, a);
	`endif
	end
	
	$fclose(file);
end
endmodule
