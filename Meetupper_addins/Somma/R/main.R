# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# We'll wrap our Shiny Gadget in an addin.
# Let's call it 'shiny_sum'.
shiny_sum <- function() {
    library(shiny)
    library(miniUI)
    # Our ui will be a simple gadget page, which
    # simply displays the time in a 'UI' output.
    ui <- miniPage(
        gadgetTitleBar("2 numbers...Sum them!"),
        fluidRow(
        column(2,
               numericInput("num1",
                            label = "Put the first number",
                            0),
               br()),
        column(2,
               numericInput("num2",
                            label = "..and the second number",
                            0),
               br())
        ),
        fluidRow(
            column(2,
                   actionButton("button", "Sum them!"))
        ),
        fluidRow(
            column(2,
                   textOutput("sum"))
        )
    )

    server <- function(input, output, session) {

        # Listen for 'submit' events. When we're finished, we'll
        # insert the current time, and then stop the gadget.
        observeEvent(input$button, {
            s <- as.numeric(input$num1) + as.numeric(input$num2)
            s = paste("The sum is ", as.character(s))
            output$sum = renderText(s)
        })

    }

    # We'll use a pane viwer, and set the minimum height at
    # 300px to ensure we get enough screen space to display the clock.
    viewer <- paneViewer(300)
    runGadget(ui, server, viewer = viewer)

}

# Try running the clock!
#clockAddin()


