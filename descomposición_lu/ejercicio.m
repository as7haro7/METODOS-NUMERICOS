% Ejercicio 10.2: Descomposición LU sin pivoteo
clc; clear;

% 1. Definición del sistema Ax = B
A = [ 10,  2, -1; 
     -3, -6,  2; 
      1,  1,  5];

B = [27; -61.5; -21.5];

fprintf('--- Matriz Original A ---\n');
disp(A);

% 2. Proceso de Descomposición LU (Paso a paso)
% Inicializamos L como identidad y U como copia de A
[n, ~] = size(A);
L = eye(n);
U = A;

fprintf('--- Paso 1: Eliminación en la primera columna ---\n');
% Multiplicador para fila 2 (f21 = a21/a11)
L(2,1) = U(2,1) / U(1,1);
U(2,:) = U(2,:) - L(2,1) * U(1,:);
fprintf('Multiplicador f21: %f\n', L(2,1));

% Multiplicador para fila 3 (f31 = a31/a11)
L(3,1) = U(3,1) / U(1,1);
U(3,:) = U(3,:) - L(3,1) * U(1,:);
fprintf('Multiplicador f31: %f\n', L(3,1));
disp('U tras paso 1:'), disp(U);

fprintf('--- Paso 2: Eliminación en la segunda columna ---\n');
% Multiplicador para fila 3 (f32 = a32/a22)
L(3,2) = U(3,2) / U(2,2);
U(3,:) = U(3,:) - L(3,2) * U(2,:);
fprintf('Multiplicador f32: %f\n', L(3,2));
disp('U final (Triangular Superior):'), disp(U);

fprintf('--- Matriz L final (Triangular Inferior) ---\n');
disp(L);

% 3. Verificación A = L * U
fprintf('--- Verificación: L * U ---\n');
disp(L * U);

% 4. Resolución del sistema (Inciso b)
% Paso 4.1: Resolver L*d = B (Sustitución hacia adelante)
d = L \ B;
fprintf('Vector d (Ld = B):\n');
disp(d);

% Paso 4.2: Resolver U*x = d (Sustitución hacia atrás)
x = U \ d;
fprintf('Solución final x:\n');
disp(x);

% 5. Resolución para vector alternativo (Inciso c)
B_alt = [12; 18; -6];
fprintf('--- Resolución para B_alt = [12, 18, -6]^T ---\n');
d_alt = L \ B_alt;
x_alt = U \ d_alt;
disp('Nueva solución x:'), disp(x_alt);