`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:50 04/01/2024 
// Design Name: 
// Module Name:    instruction 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction(clk,led, counter);
	 input clk;
	 output led;
	 output counter;
	 reg [7:0] led;
	 
	 reg [31:0] memory[13:0];
	 reg [7:0] array[10:0];
	 reg [7:0] register[31:0];
	 reg [7:0] counter;
	 
	 reg[31:0] curr;
	
	 reg[3:0] state;
	 
	 reg [5:0] opcode;
	 reg [4:0] rs;
	 reg [4:0] rt;
	 reg [4:0] rd;
	 reg [4:0] shift_amt;
	 reg [5:0] func;
	 reg [7:0] immed;
	 reg [7:0] jump_target;
	 reg [5:0] load_addr;
	 reg [7:0] source_op1, source_op2;
	 reg [1:0] is_invalid;
	 reg [7:0] curr_row;
	 integer  i;

	 initial begin
	 
	 for(i=0; i<32; i=i+1)	begin
		register[i] = 0;
	 end

	 memory[0]  = 32'b00100100000000100000000000000000;
	 memory[1]  = 32'b00100100000000110000000000000000;
	 memory[2]  = 32'b00000000011000010010000000101010;
	 memory[3]  = 32'b00010000000001000000000000001000;
	 memory[4]  = 32'b00100100000001010000000000001010;
	 memory[5]  = 32'b00010000101000110000000000000110;
	 memory[6]  = 32'b10001100011001100000000000000000;
	 memory[7]  = 32'b00000000010001100001000000100001;
	 memory[8]  = 32'b00100100011000110000000000000001;
	 memory[9]  = 32'b00000000011000010010000000101010;
	 memory[10] = 32'b00010100000001001111111111111011;
	 memory[11] = 32'b00000011111000000000000000001000;
	 memory[12] = 32'b10001100000000010000000000001010;
	 memory[13] = 32'b00001100000000000000000000000000;
	 
	 // array;
	 array[0]=8'b00000011;
	 array[1]=8'b00000001;
	 array[2]=8'b00000001;
	 array[3]=8'b00000001;
	 array[4]=8'b00000001;
	 array[5]=8'b00000001;
	 array[6]=8'b00000001;
	 array[7]=8'b00000001;
	 array[8]=8'b00000001;
	 array[9]=8'b00000001;
	 array[10]=10;
	 
	 load_addr=0;
	 state=0;
	 is_invalid=0;
	 curr_row=0;
	 counter=12;
	 end
	 
	 always@(posedge clk)	begin
	
		if(state==0) 	begin
			curr <= memory[counter];
			state <= 1;
		end
		
		else if(state==1)	begin
			opcode <= curr[31:26];
			if( curr[31:26] == 6'b000000)	begin
				// R - format;
				func <= curr[5:0];
				shift_amt <= curr[10:6];
				rd <= curr[15:11];
				rt <= curr[20:16];
				rs <= curr[25:21];
			end
			else if(curr[31:26] == 6'b000011)	begin
				// J - format;
				jump_target <= curr[7:0];
			end
			else	begin
				// I - format;
				immed <= curr[7:0];
				rt <= curr[20:16];
				rs <= curr[25:21];
			end
			state <=2;
		end
		
		else if(state==2)	begin
		// check;
			if(opcode == 0)	begin
				source_op1 <= register[rs];
				source_op2 <= register[rt];
			end
			else if(opcode != 3)	begin
				source_op1 <= register[rs];
			end
			state <=3;
		end
		
		else if(state==3)	begin
			if(opcode == 6'b100011)	begin
				// 0x23 - lw;
				load_addr <= source_op1 + immed;
				counter <= counter + 1;
			end
			else if(opcode == 6'b001001)	begin
				// 9 - addiu;
				register[rt] <= source_op1 + immed;
				counter <= counter + 1;
			end
			else if(opcode == 6'b000100)	begin
				// 4 - beq;
				if(register[rt] == source_op1)	counter <= counter + immed;
				else	counter <= counter + 1;
			end
			else if(opcode == 6'b000101)	begin
				// 5 - bne;
				if(register[rt] != source_op1)	counter <= counter + immed;
				else	counter <= counter + 1;
			end
			else if(opcode == 6'b000011)	begin
				// 3- jal;
				register[31] <= counter + 1;
				counter <= jump_target;
			end
			else if(opcode == 6'b000000)	begin
				// R;
				if(func == 6'b101010)	begin
					// slt;
					register[rd] <= ($signed(source_op1) < $signed(source_op2));
					counter <= counter + 1;
				end
				else if(func == 6'b100001)	begin
					// addu;
					register[rd] <= (source_op1 + source_op2);
					counter <= counter + 1;
				end
				else if(func == 6'b001000)	begin
					// jr;
					counter <= source_op1;
				end
				else is_invalid = 1;
			end
			else	is_invalid = 1;
			state <= 4;
		end

		else if(state==4)	begin
			if(opcode == 6'b100011)	begin
				curr_row <= array[load_addr];
			end
			state<=5;
		end

		else if(state==5)	begin
			if(opcode == 6'b100011 && rt != 0 && is_invalid == 0)	begin
				register[rt] <= curr_row;
			end
			if(counter<14)	state <= 0;
			else if(counter>=14) state <= 6;
		end

		else if(state==6)	begin
			led <= register[2];
			state <= 6;
		end

	 end
endmodule
