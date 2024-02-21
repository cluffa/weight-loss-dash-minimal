FROM rocker/shiny-verse:latest

WORKDIR /code

# Install stable packages from CRAN
RUN install2.r --error \
    shiny \
    tidyverse

COPY app.R app.R

CMD ["R", "--quiet", "-e", "shiny::runApp(host='0.0.0.0', port=7860)"]
