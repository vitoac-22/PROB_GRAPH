library(shiny)

function(input, output) {
  
  output$plot_binom <- renderPlot({
    n <- input$n_binom
    p <- input$p_binom
    x <- input$x_binom
    
    # Validación para asegurar que n >= x
    if (n < x) {
      return(NULL)
    }
    
    # Cálculo de la probabilidad
    prob <- dbinom(x, n, p)
    
    # Cálculo de la función de densidad
    x_vals <- 0:n
    f_x <- dbinom(x_vals, n, p)
    
    plot(x_vals, f_x, main = "Distribución Binomial",
         xlab = "Valores de X", ylab = "Valores de f(x)",
         type = "b", col = "red")
    
    abline(v = n * p, lty = 3, col = "blue")
    
    # text(x = 0.7, y = max(f_x), labels = paste("Probabilidad:", round(prob, 4)), pos = 1)
  })
  
  output$plot2_binom <- renderPlot({
    n <- input$n_binom
    p <- input$p_binom
    
    # Cálculo de la función de distribución acumulada
    x <- seq(0, n)
    Fx <- pbinom(x, n, p)
    
    plot(x, Fx, main = "Distribución Binomial (Función de Distribución)",
         xlab = "Valores de X", ylab = "Valores de F(x)", 
         type = "b", col = "red")
    
    abline(h = 1, lty = 3, col = "blue")
  })
  output$expectation_prob_binom <- renderText({
    paste("El valor de la P(X) es igual a: ", round(dbinom(input$x_binom, input$n_binom, input$p_binom),4))
  })
  output$expectation <- renderText({
    paste("El valor de E(X) es igual a: ", input$n_binom * input$p_binom)
  })
  
  
  observeEvent(input$submit_geom, {
    n <- input$n_geom
    x <- input$x_geom
    prob <- as.numeric(input$prob_geom)
    prob <- eval(parse(text = prob))
    
    # Función de densidad
    x_dgeom <- seq(1, n, by = 1)
    y_dgeom <- dgeom(x_dgeom - 1, prob = prob)
    
    # Gráfico de la función de densidad
    output$density_plot_geom <- renderPlot({
      plot(x_dgeom, y_dgeom, main = "Función Densidad - Distribución Geométrica",
           xlab = 'Valores de x', ylab = 'Valores de f(x)',
           type = "b", col = "black")
      abline(v = 1 / prob, col = "blue", lty = 3)
    })
    
    # Función de distribución acumulada
    y_pgeom <- pgeom(x_dgeom - 1, prob = prob)
    
    # Gráfico de la función de distribución acumulada
    output$distribution_plot_geom <- renderPlot({
      plot(x_dgeom, y_pgeom, main = "Función Distribución - Geométrica",
           xlab = 'Valores de x', ylab = 'Valores de F(x)',
           type = "b", col = "black")
      abline(h = 1, col = "blue", lty = 3)
    })
    output$expectation_prob_geom <- renderText({
      paste("El valor de la P(X) es igual a: ", round(dgeom(input$x_geom - 1, prob = input$prob_geom),4))
    })
    output$expectation_geom <- renderText({
      paste("El valor de E(X) es igual a: ", round(1/prob,4))
    })
  })
  
  observeEvent(input$submit_pois, {
    n <- input$n_pois
    val_aleatoria <- input$val_aleatoria_pois
    lambda <- input$lambda_pois
    
    # Definición de intentos, el cual no se especifica porque tiene dal infinito
    # n <- Inf
    
    # Gráfica de la función de densidad
    x_dpois <- seq(0, n, by = 1)
    y_dpois <- dpois(x_dpois, lambda = lambda)
    
    output$density_plot_pois <- renderPlot({
      plot(x_dpois, y_dpois, main = "Función Densidad - Distribución Poisson",
           xlab = 'Valores de x', ylab = 'Valores de f(x)',
           type = "b", col = "black")
      abline(v = lambda, col= "blue", lty = 3)
      text(x = 0.7, y = 0.7, labels = paste("Probabilidad:", round(dpois(x=val_aleatoria, lambda = lambda), 4)), pos = 1)
    })
    
    # Función de distribución acumulada
    y_ppois <- ppois(x_dpois, lambda = lambda)
    
    output$distribution_plot_pois <- renderPlot({
      plot(x_dpois, y_ppois, main = "Función Distribución Poisson",
           xlab = 'Valores de x', ylab = 'Valores de F(x)',
           type = "b", col = "black")
      abline(h = 1, col = "blue", lty = 3)
    })
    output$expectation_prob_pois <- renderText({
      paste("El valor de P(X) es igual a: ",round(dpois(x=input$val_aleatoria_pois ,lambda = input$lambda_pois),4))
    })
    output$expectation_pois <- renderText({
      paste("El valor de E(X) es igual a: ",round(input$lambda_pois,4))
    })
  })
}
