// Ничего не понятно, но очень инетерсно

module synchronous_data_memory(
  input  logic        clk,                     // Вход синхронизации                  //
  input  logic [31:0] addr,                    // Адресный вход                       //
  input  logic [31:0] write_data,              // Вход данных для записи              // 
  input  logic        write_enable,            // Сигнал разрешения на запись         // 1 - запись, 0 - чтение
  output logic [31:0] synchronous_read_data,   // Синхронный выход считанных данных   //
  output logic [31:0] asynchronous_read_data   // Асинхронный выход считанных данных  //
);

  logic [31:0] mem [0:4096];                    // Память: 4096 слов по 32 бита  // Получается память с 4096-ю ячейками по 32 бита

  // Чтение данных из памяти, синхронно
  always_ff @(posedge clk) begin                          //
    if (write_enable == 0) begin                          // Чтение выполняется только если не производится запись
      synchronous_read_data_register <= mem[addr];        // Возможно надо указать куда, внутри addr[?] / или не надо
    end 
  end
  
  // Запись данных в память
  always_ff @(posedge clk) begin  //   
    if (write_enable == 1) begin  //
      mem[addr] <= write_data;    // Запись в mem[addr]. Возможно надо указать куда, внутри addr[?] / или не надо
    end
  end
endmodule