# DISTRIBUCIÓN DE PROBABILIDAD GEOMÉTRICA

# ---------------------------------------------------
# FUNCIÓN DENSIDAD
# ---------------------------------------------------

# La función definida, toma el valor 'x' ya reducido con '-1'.
# Es decir que debemos incluir el valor 'x-1'.
# dgeom()

# Definición de intentos que se realizará
n <- as.numeric(readline())

# Petición al usuario de ingreso de valores. Para usarlo como variable aleatoria
# X: Número de veces que hay que realizar el experimento, hasta obtener el primer éxito
x <- as.numeric(readline("Ingrese el valor de éxito: "))

# Petición al usuario la probabilidad de éxito
prob_str <- readline("Ingrese el valor de la probabilidad: ")
prob_str <- eval(parse(text = prob_str))
prob <- as.numeric(prob_str)

# Gráfica de la función
x_dgeom <- seq(1,n, by = 1)
y_dgeom <- dgeom(x_dgeom-1, prob = prob)

plot(x_dgeom, y_dgeom, main = "Función Densidad - Distribución Geométrica",
     xlab = 'Valores de x', ylab = 'Valores de f(x)',
     type = "b", col = "black")

abline(v = 1/prob, col= "blue", lty = 3)


# Definición de Esperanza
esperanza <- 1/prob

# ---------------------------------------------------
# FUNCIÓN DISTRIBUCIÓN
# ---------------------------------------------------
y_pgeom <- pgeom(x_dgeom-1, prob = prob)

plot(x_dgeom, y_pgeom, main = "Función Distribución - Geométrica",
     xlab = 'Valores de x', ylab = 'Valores de F(x)',
     type = "b", col = "black")

abline(h = 1, col= "blue", lty = 3)


