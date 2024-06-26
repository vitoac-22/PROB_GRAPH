# ---------------------------------------------------
# VARIABLE ALEATORIA 'CONTINUA'
# ---------------------------------------------------

# DISTRIBUCIÓN DE PROBABILIDAD UNIFORME

# ---------------------------------------------------
# FUNCIÓN DENSIDAD
# ---------------------------------------------------

# X: Indica cualquier valor contenido en el intervalo [a,b]

# Petición al usuario, la población

a_unif <- readline("Ingrese el valor límite inferior: ")
a_unif <- as.numeric(a_unif)

b_unif <- readline("Ingrese el valor límite superior: ")
b_unif <- as.numeric(b_unif)

# n_unif <- readline("Ingrese el valor tope para formar una rejilla de valores: ")
n_unif <- a_unif  + b_unif


# Gráfica
x_unif <- seq(0, n_unif, by = 0.1)
y_unif <- dunif(x_unif, a_unif, b_unif)

plot(x_unif, y_unif, main = "Función Densidad - Distribución Uniforme",
     xlab = 'Valores de x', ylab = 'Valores de f(x)',
     type = "l", col = "black")
abline(v = (a_unif + b_unif)/2, col= "blue", lty = 3)

# ---------------------------------------------------
# FUNCIÓN DISTRIBUCIÓN
# ---------------------------------------------------
y_punif <- punif(x_unif, a_unif, b_unif)

plot(x_unif, y_punif, main = "Función Distribución - Uniforme",
     xlab = 'Valores de x', ylab = 'Valores de F(x)',
     type = "l", col = "black")

abline(h = 1, col= "blue", lty = 3)
