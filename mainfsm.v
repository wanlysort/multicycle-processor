// riscvmulti.v main FSM module
module mainfsm(input  clk,
               input  reset,
               input  [6:0] op,
               output [1:0] ALUSrcA, ALUSrcB,
               output [1:0] ResultSrc,
               output AdrSrc,  
               output IRWrite, PCUpdate,
               output RegWrite, MemWrite,
               output [1:0] ALUOp,
               output Branch);
  
  //COMPLETAR
  parameter FETCH    = 4'b0000;
  parameter DECODE   = 4'b0001;
  ....
  
  reg [3:0] state, nextstate;
  reg [14:0] controls;
  
  // state register
  always @(posedge clk or posedge reset)
    if (reset) state <= FETCH;
    else state <= nextstate;
  
  // next state logic
  // COMPLETAR
  always @*
    case(state)
      FETCH:                     nextstate = DECODE;
      DECODE: casez(op)
                7'b0?00011:      nextstate = MEMADR; // lw or sw
 		....
		....
                default:         nextstate = UNKNOWN;
              endcase
      MEMADR: 
		....
      MEMREAD:                   ...
      EXECUTER:                  ...
      EXECUTEI:                  ...
      JAL:                       ...
      default:                   ...
    endcase
    
  // state-dependent output logic
  // COMPLETAR
  always @*
    case(state)
      FETCH: 	controls = 15'b00_10_10_0_1100_00_0;
      ...
      ...
      default: 	controls = 15'bxx_xx_xx_x_xxxx_xx_x;
    endcase

  assign {ALUSrcA, ALUSrcB, ResultSrc, AdrSrc, IRWrite, PCUpdate, 
  RegWrite, MemWrite, ALUOp, Branch} = controls;
endmodule