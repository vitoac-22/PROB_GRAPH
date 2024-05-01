# DISTRIBUCIÓN DE PROBABILIDAD HIPERGEOMÉTRICA

# ---------------------------------------------------
# FUNCIÓN DENSIDAD
# ---------------------------------------------------

# X: Número de elementos de la categoría de interés (a)
#    seleccionados de entre (n) escogidos.

# Petición al usuario, la población
print("En el siguiente programa, usted como usuario ingresará los valores,")
print("para ello necesitamos necesitamos lo siguiente.")

pob_hyper <- readline("Ingrese el valor de la población de la característica que quiere conocer: ")
pob_hyper <- as.numeric(pob_hyper)

a_hyper <- readline("Ingrese el valor de elementos de la característica que quiere conocer: ")
a_hyper <- as.numeric(a_hyper)

b_hyper <- readline("Ingrese el valor de elementos de la otra característica: ")
b_hyper <- as.numeric(b_hyper)

n_hyper <- readline("Ingrese el valor de la muestra tomada: ")
n_hyper <- as.numeric(n_hyper)

prob_hyper <- dhyper(a_hyper, pob_hyper, b_hyper, n_hyper)

cat("La P(X=",a_hyper,")= ", prob_hyper)

# Definición de la Gráfica
x_hyper <- seq(0, n_hyper, by = 1)
y_hyper <- dhyper(x_hyper, pob_hyper, b_hyper, n_hyper)

plot(x_hyper, y_hyper, main = "Función Densidad - Distribución Hipergeométrica",
     xlab = 'Valores de x', ylab = 'Valores de f(x)',
     type = "b", col = "black")
abline(v = (n_hyper * pob_hyper)/(pob_hyper + b_hyper), col= "blue", lty = 3)

