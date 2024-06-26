# DISTRIBUCIÓN POISSON

# ---------------------------------------------------
# FUNCIÓN DENSIDAD
# ---------------------------------------------------

# X: indica el número de éxitos al realizar un número indeterminado
#   de veces el experimento de Bernoulli.

# Definición del valor de la variable aleatoria.
val_aleatoria <- readline("Ingrese el valor de la Variable Aleatoria: ")
val_aleatoria <- eval(parse(text = val_aleatoria))
val_aleatoria <- as.numeric(val_aleatoria)

# Definición del Lambda
lambda <- readline("Ingrese el valor de Lambda: ")
lambda <- eval(parse(text = lambda))
lambda <- as.numeric(lambda)

# Definición de intentos, el cual no se especifica porque tiene dal infinito
n <- as.numeric(readline())

# Gráfica de la función
x_dpois <- seq(0, n, by = 1)
y_dpois <- dpois(x_poisson, lambda = lambda)

plot(x_dpois, y_dpois, main = "Función Densidad - Distribución Poisson",
     xlab = 'Valores de x', ylab = 'Valores de f(x)',
     type = "b", col = "black")

abline(v = lambda, col= "blue", lty = 3)

# ---------------------------------------------------
# FUNCIÓN DISTRIBUCIÓN
# ---------------------------------------------------

y_ppois <- ppois(x_poisson, lambda = lambda)

# Crear un gráfico de dispersión
plot(x_dpois, y_ppois, main = "Función Distribución Poisson",
     xlab = 'Valores de x', ylab = 'Valores de F(x)',
     type = "b", col = "black")

# Agregar una línea horizontal en y = 1 (coloreada de azul con estilo punteado)
abline(h = 1, col = "blue", lty = 3)

