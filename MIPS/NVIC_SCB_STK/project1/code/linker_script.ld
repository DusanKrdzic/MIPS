


msp = 0x20002800;

MEMORY
{
	FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 32K
	SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 10K


}





SECTIONS
{



	.vector_table :
	{
		*(.vector_table)
	} > FLASH
	
	.text :
	{
		*(.text)
		*(.text*)
	} > FLASH

	
	.rodata :
	{
		*(.rodata)
		*(.rodata*)
	} > FLASH
	
	.data :
	{
		vma_data_start = .;
		*(.data)
		*(.data*)
		vma_data_end = .;
	
	} > SRAM AT> FLASH

	lma_data_start = LOADADDR(.data);

	.bss :
	{
		*(.bss)
		*(.bss*)
		*(COMMON)
	} > SRAM

	


}









