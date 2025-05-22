.data
constante: 
	.word 17
arreglo:  
	.word 7, 13, 17, 20, 34, 2, 5, 22, 30, 9

.text
.global main
main:
	
	LDR R0, =constante @Carga la direccion de la constante 
	LDR R0, [R0] @Carga el valor en el registro

	LDR R1, =arreglo @Carga la direccion del arreglo 

	MOV R2, #0 @Bandera de iteraciones
	MOV R4, #0 @"i" contador o variable para acceder a cada posicion de la iteracion
	
inicioCiclo:
	CMP R2, #9 @Cuando superemos las 9 iteraciones
	BGT End @Branch if Greater Than (si se cumple la instruccion anterior)
	
	LDR R3, [R1, R4] @el valor actual del iterador "i" segun su posicion en el arreglo
	
	CMP R3, R0 @Comparo el valor con la constante
	BGE mayorIgual @Branch if Greater or Equal
	
	ADD R5, R3, R0 @el valor actual + constante en registro 5
	STR R5, [R1, R4] @almacena el nuevo valor en su posicion del arreglo
	
	B repiteCiclo 
	
mayorIgual:
	MUL R5, R3, R0 @Producto en registro 5
	STR R5, [R1, R4] @almacena el nuevo valor en su posicion del arreglo

repiteCiclo:
	ADD R2, R2, #1 @R2+1 será el nuevo valor de R2
	ADD R4, R4, #4 @"i+1" Como cada numero tiene 4bytes, pasamos al siguiente
	
	B inicioCiclo
	
End:
