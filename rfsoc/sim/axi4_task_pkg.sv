package axi4_task;

    virtual AXI4 m_axi;
    virtual AXI4Lite m_axil;
    logic axi_aclk;
    logic axilite_clk;

    // AXI4
    task axi4_reset();
        m_axi.awaddr <= '0;
        m_axi.awprot <= '0;
        m_axi.awvalid <= '0;
        m_axi.wdata <= '0;
        m_axi.wstrb <= '0;
        m_axi.wvalid <= '0;
        m_axi.bready <= '0;
        m_axi.araddr <= '0;
        m_axi.arprot <= '0;
        m_axi.arvalid <= '0;
        m_axi.rready <= '0;
        m_axi.awid  <= '0;
        m_axi.awlen   <= '1;        // len = 1
        m_axi.awsize  <= 'd5;       // 256b
        m_axi.awburst <= '1;        // incr
        m_axi.awlock  <= '0;
        m_axi.awcache <= '0;
        m_axi.awregion <= '0;
        m_axi.awqos   <= '0;
        m_axi.wlast <= '0;
        m_axi.arid  <= '1;
        m_axi.arlen   <= '1;
        m_axi.arsize  <= 'd5;
        m_axi.arburst <= '1;
        m_axi.arlock  <= '0;
        m_axi.arcache <= '0;
        m_axi.arqos   <= '0;
        m_axi.arregion <= '0;
    endtask

    task axi4_write(input logic [31:0] addr, input logic [255:0] data);
        @(posedge axi_aclk);
        m_axi.awlen   <= '1;
        if (m_axi != null) begin
            m_axi.awvalid <= 1'b1;
            m_axi.awaddr <= addr;
            @(m_axi.awready);
            @(posedge axi_aclk);
            m_axi.awvalid <= 1'b0;
            m_axi.wvalid <= 1'b1;
            m_axi.wdata <= data;
            m_axi.wstrb <= '1;
            m_axi.wlast <= 1'b1;
            @(m_axi.wready);
            @(posedge axi_aclk);
            m_axi.wvalid <= 1'b0;
            m_axi.wlast <= 1'b0;
            m_axi.wstrb <= '0;
            m_axi.bready <= 1'b1;
            @(m_axi.bvalid);
            @(posedge axi_aclk);
            m_axi.bready <= 1'b0;
            @(posedge axi_aclk);
            $display("[%t] : axi4_write(0x%0h, 0x%0h)", $time, addr, data);
        end else begin
            $display("Error: AXI4 interface is not bound");
        end
    endtask

    task axi4_read(input [31:0] addr, output [255:0] data);
        m_axi.arlen   <= '1;
        @(posedge axi_aclk);
        if (m_axi != null) begin
            m_axi.araddr <= addr;
            m_axi.arvalid <= 1'b1;
            @(m_axi.arready);
            @(posedge axi_aclk);
            m_axi.arvalid <= 1'b0;
            m_axi.rready <= 1'b1;
            @(m_axi.rvalid);
            data = m_axi.rdata;
            @(posedge axi_aclk);
            m_axi.rready <= 1'b0;
            $display("[%t] : axi4_read(0x%0h, 0x%0h)", $time, addr, data);
        end else begin
            $display("Error: AXI4 interface is not bound");
        end
    endtask

    // AXILite
    task axilite_reset();
        m_axil.awaddr <= '0;
        m_axil.awprot <= '0;
        m_axil.awvalid <= '0;
        m_axil.wdata <= '0;
        m_axil.wstrb <= '0;
        m_axil.wvalid <= '0;
        m_axil.bready <= '0;
        m_axil.araddr <= '0;
        m_axil.arprot <= '0;
        m_axil.arvalid <= '0;
        m_axil.rready <= '0;
    endtask

    task WriteReg(input logic [31:0] addr, input logic [31:0] data);
        @(posedge axilite_clk);
        if (m_axil != null) begin
            m_axil.awvalid <= 1'b1;
            m_axil.awaddr <= addr;
            @(m_axil.awready);
            @(posedge axilite_clk);
            m_axil.awvalid <= 1'b0;
            m_axil.wvalid <= 1'b1;
            m_axil.wdata <= data;
            m_axil.wstrb <= 4'hf;
            @(m_axil.wready);
            @(posedge axilite_clk);
            m_axil.wvalid <= 1'b0;
            m_axil.wstrb <= 4'h0;
            m_axil.bready <= 1'b1;
            @(m_axil.bvalid);
            @(posedge axilite_clk);
            m_axil.bready <= 1'b0;
            @(posedge axilite_clk);
            $display("[%t] : WriteReg(0x%0h, 0x%0h)", $time, addr, data);
        end else begin
            $display("Error: AXI4Lite interface is not bound");
        end
    endtask

    task ReadReg(input [31:0] addr, output [31:0] data);
        @(posedge axilite_clk);
        if (m_axil != null) begin
            m_axil.araddr <= addr;
            m_axil.arvalid <= 1'b1;
            @(m_axil.arready);
            @(posedge axilite_clk);
            m_axil.arvalid <= 1'b0;
            m_axil.rready <= 1'b1;
            @(m_axil.rvalid);
            data = m_axil.rdata;
            @(posedge axilite_clk);
            m_axil.rready <= 1'b0;
            $display("[%t] : ReadReg(0x%0h, 0x%0h)", $time, addr, data);
        end else begin
            $display("Error: AXI4Lite interface is not bound");
        end
    endtask

endpackage