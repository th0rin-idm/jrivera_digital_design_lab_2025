.data

.text
.global main
main:
	MOV R0, #0x1000 @Direccion de tecla presionada
	MOV R1, #0x2000 @Contador
	
	LDR R2, =0xE048 @Tecla hacia arriba
	LDR R3, =0xE050 @Tecla hacia abajo
	
bucleInfinito:
	LDR R4, [R0] @Se carga el valor en la dirrecion R0 que estaría siendo ejecutado por la tecla al presionarse
	CMP R4, R2 @Flecha arriba?
	BEQ fArriba
	
	CMP R4, R3
	BEQ fAbajo @Flecha Abajo?
	B bucleInfinito
	
fArriba:
	LDR R5, [R1]@Se carga el valor del contador
	ADD R5, R5, #1 @Se suma el valor
	
	STR R5, [R1]@Se almacena el cambio
	B bucleInfinito
	
fAbajo:
	LDR R5, [R1] @Se carga el valor del contador
	SUB R5, R5, #1 @Se resta el valor
	
	STR R5, [R1] @Se almacena el cambio
	B bucleInfinito
	
	
	

	
