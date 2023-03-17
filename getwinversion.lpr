program getwinversion;

{$X+}//extended syntax

var
  sharedUserData: pbyte;
  p: PInteger; // Declaramos un puntero a un entero
  i: integer; // Declaramos una variable entera
begin
  sharedUserData := pbyte($7FFE0000);
  writeln('Version ',
    uint32((sharedUserData)[$26c]), ' ',
    uint32(sharedUserData[$270]), ' ',
    uint32(sharedUserData[$260]), ' ');

  // Asignamos una dirección de memoria a nuestro puntero
  p := AllocMem(SizeOf(integer) * 5); // Supongamos que queremos un arreglo de 5 enteros

  // Accedemos al tercer elemento del arreglo a través del puntero
  p[2] := 5;
  i := p[2];
  // El índice 2 corresponde al tercer elemento, ya que los índices de arreglos en Pascal comienzan en cero

  // Hacemos algo con el valor obtenido
  writeLn('El tercer elemento del arreglo es: ', i);

  // Liberamos la memoria asignada al arreglo
  FreeMem(p);

  ReadLn;
end.
