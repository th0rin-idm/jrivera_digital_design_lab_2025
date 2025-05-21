.data
constante: 
	.word 5

.text
.global main
main:
	
	LDR R0, =constante @Carga la direccion de X
	LDR R0, [R0] @Carga el valor en el registro
	MOV R1, R0@ R1 guarda el valor original
	ADD R2, R0, #-1 @Siguiente iteracion (X-1)

	
analizaSiguiente:
	CMP R2, #0 @Cuando sea igual a cero X-1
	BLE End

	MUL R0,R0,R2 @Producto en registro 1
	ADD R2, R2, #-1 @Siguiente iteracion (X-1)
	B analizaSiguiente

End: