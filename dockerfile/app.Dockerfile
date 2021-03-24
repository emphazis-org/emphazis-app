FROM luciorq/emphazis-base:latest

RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone

# RUN R -e 'remotes::install_local(upgrade="never")'

RUN Rscript -e 'remotes::install_github("emphazis-org/emphaziscv@main", upgrade="never")'

RUN Rscript -e 'remotes::install_github("emphazis-org/emphazis@main", upgrade="never")'

# RUN Rscript -e 'remotes::install_github("emphazis-org/shinyemphazis@main", upgrade="never")'

RUN cp -R /build_zone/model_data /usr/local/lib/R/site-library/emphazis/emphazis_app/

EXPOSE 3838

CMD R -e "emphazis::emphazis_app(host = '0.0.0.0', port = 3838, launch_browser = FALSE)"

#CMD R -e "shinyemphazis::run_app(host = '0.0.0.0', port = 3838, launch.browser = FALSE)"
