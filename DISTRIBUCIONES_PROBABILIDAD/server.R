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
    
    text(x = 0.7, y = max(f_x), labels = paste("Probabilidad:", round(prob, 4)), pos = 1)
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
  output$expectation <- renderText({
    paste("El valor de la esperanza E(X) es igual a: ", input$n_binom * input$p_binom)
  })
  
  observeEvent(input$submit_geom, {
    n <- input$n_geom
    x <- input$x_geom
    prob <- input$prob_geom
    
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
    output$expectation_geom <- renderText({
      paste("El valor de la esperanza E(X) es igual a: ", 1/prob)
    })
  })
}
