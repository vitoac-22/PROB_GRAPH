library(shiny)

fluidPage(
  titlePanel("Distribuciones de Probabilidad"),
  tabsetPanel(
    tabPanel("Distribución Binomial",
             sidebarLayout(
               sidebarPanel(
                 numericInput("n_binom", "Número de veces realizado el experimento:", value = 5, min = 1),
                 sliderInput("p_binom", "Probabilidad de éxito (p):", min = 0, max = 1, value = 0.5),
                 numericInput("x_binom", "Número de veces que desea se repita el éxito", value = 5, min = 1),
                 verbatimTextOutput("expectation")
               ),
               mainPanel(
                 plotOutput("plot_binom"),
                 plotOutput("plot2_binom")
               )
             )
    ),
    tabPanel("Distribución Geométrica",
             sidebarLayout(
               sidebarPanel(
                 numericInput("n_geom", "Número de intentos:", value = 1, min = 1),
                 numericInput("x_geom", "Número de éxito:", value = 1, min = 1),
                 sliderInput("prob_geom", "Probabilidad de éxito:", value = 0.5, min = 0, max = 1),
                 verbatimTextOutput("expectation_geom"),
                 actionButton("submit_geom", "Calcular")
               ),
               mainPanel(
                 plotOutput("density_plot_geom"),
                 plotOutput("distribution_plot_geom")
               )
             )
    )
  )
)
