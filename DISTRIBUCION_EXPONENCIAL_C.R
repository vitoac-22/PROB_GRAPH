# ---------------------------------------------------
# VARIABLE ALEATORIA 'CONTINUA'
# ---------------------------------------------------

# DISTRIBUCIÓN DE PROBABILIDAD EXPONENCIAL

# ---------------------------------------------------
# FUNCIÓN DENSIDAD
# ---------------------------------------------------

# X: Indica generalmente el tiempo que transcurre en realizarse un evento

# Peticiones al usuario
t_exp <- readline("Ingrese el valor/tiempo que transcurre en realizarse el evento: ")
t_exp <- as.numeric(t_exp)

l_exp <- readline("Ingrese la tasa de ocurrencia de un eventeo (lmbda): ")
l_exp <- as.numeric(l_exp)

n_exp <- t_exp + 5

# Gráfica
x_exp <- seq(0, t_exp, by = 0.5)
y_exp <- dexp(x_exp, l_exp)

plot(x_exp, y_exp, main = "Función Densidad - Distribución Exponencial",
     xlab = 'Valores de x', ylab = 'Valores de f(x)',
     type = "l", col = "black")
abline(h=0.1, col= "blue", lty = 3)



dexp(12, 0.1)
pexp(12, 0.1)



