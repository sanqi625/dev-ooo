# Toy Scalar


## Environment

现在的环境分为服务器/WSL两套  
* 在服务器上运行时请执行：  

```
    source prj.env  
```
* 在WSL上运行时请执行：  

```
    source wsl_prj.env  
```


设置环境变量和工具，环境变量用在了各种filelist和makefile中。这两份环境的主要不同是引用了不同的filelist（sim.f/sim_wsl.f）这两份filelist是因为dw ip在不同的环境中的路径不同，所以需要使用不同的filelist仿真。

## Folder

- rtl

这里面存放了所有的rtl。这里面的makefile已经过时，不再维护。

- rv_isa_test

这里面放了一个cmake，用来构建一个并行测试的makefile。使用的测试例是预先编译好存放在lserver上的测试向量。这个cmake会抓取目标目录下的所有测试，构建一个ctest。在这个目录下执行cmake -b build后，会将makefile生成在build目录下。进入build目录执行ctest -j64，会并行执行所有rv官方开源的指令集测试。

这些测试是将一段代码放在rtl上进行运行，如果这段代码能够运行成功（即正常退出）,那么我们就认为这个case pass,目前还没有加入和simulator的逐条指令运行结果比对.



## Makefile

- make compile

**服务器环境下**编译rtl，将rtl编译到work/rtl_compile下。  

- make comp

**WSL环境下**编译rtl，将rtl编译到work/rtl_compile下。

- make compile_debug

**服务器环境下**编译rtl，使用debug csr功能，在该模式下的编译结果CSR获取到的值为定值。

- make lint

run lint。

- make dhry

使用编译好的simv跑dhrystone测试。

- make cm

跑coremark，其它同上。

- make verdi

看最近一次dhrystone或coremark的波形。


## DEBUG

### 1.isa test
直接通过  
    
    make isa  
完成isa debug，根据错误的test item，在`/tools/hurj/riscv-proj/isa/`路径下可以找到与之对应的dump文件，可以对照完成debug。
### 2.dhry/cm test
直接通过  
    
    make dhry
    make cm  
完成dhry/cm,如果出现跑不下去/输出明显异常/超时等问题，可以通过波形debug抑或是数据对比，当前的版本通过  

    +WAVE                    // 生成波形
    +PC=pc_trace.log         // 生成pc trace log
    +REG_TRACE=reg_trace.log // 生成reg file trace log
    +FETCH=fetch.log         // 生成fetch instruction log
生成相关的debug信号，但是在实际对比中会发现因为csr的存在，reg_trace的结果总是不同。针对这个问题可以在编译时使用

    make compile_debug
这个编译通过DEBUG宏将CSR的结果固定，此时的程序应该完全与事先准备好的trace log相同。
相关trace log的gold版本在  

- dhry pc_trace  `/data/usr/hurj/gold/toy_scalar/pc_trace_dhry.log`
- dhry reg_trace `/data/usr/hurj/gold/toy_scalar/reg_trace_dhry.log`
- cm pc_trace  `/data/usr/hurj/gold/toy_scalar/pc_trace_cm.log`
- cm reg_trace `/data/usr/hurj/gold/toy_scalar/reg_trace_cm.log`

比较工具可以使用  `find_diff.py`该程序共有4中比较方式

    python find_diff.py file1 file2 1 //mode 1 两个文件全部比较
    python find_diff.py file1 file2 2 //mode 2 比较pc_trace
    python find_diff.py file1 file2 3 //mode 3 比较reg trace
    python find_diff.py file 4 --pc_value=80001f80 //mode 4 在文件中找到特定pc的行

## SAM

| ID  | Name       | Start Addr   | Size         | End Addr    |
|-----|------------|--------------|--------------|-------------|
| 1   | ITCM       | 0x8000_0000  | 0x2000_0000  | 0x9FFF_FFFF |
| 2   | DTCM       | 0xA000_0000  | 0x2000_0000  | 0xBFFF_FFFF |
| 3   | Host       | 0xC000_0000  | 0x0000_1000  | 0xC000_0FFF |
| 4   | Uart       | 0xC000_1000  | 0x0000_1000  | 0xC000_1FFF |

