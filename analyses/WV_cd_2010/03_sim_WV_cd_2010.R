###############################################################################
# Simulate plans for `WV_cd_2010`
# © ALARM Project, March 2022
###############################################################################

# Run the simulation -----
cli_process_start("Running simulations for {.pkg WV_cd_2010}")

plans <- redist_smc(map, nsims = 5e3, counties = county)
# IF CORES OR OTHER UNITS HAVE BEEN MERGED:
# make sure to call `pullback()` on this plans object!

cli_process_done()
cli_process_start("Saving {.cls redist_plans} object")


# Output the redist_map object. Do not edit this path.
write_rds(plans, here("data-out/WV_2010/WV_cd_2010_plans.rds"), compress = "xz")
cli_process_done()

# Compute summary statistics -----
cli_process_start("Computing summary statistics for {.pkg WV_cd_2010}")

plans <- add_summary_stats(plans, map)

# Output the summary statistics. Do not edit this path.
save_summary_stats(plans, "data-out/WV_2010/WV_cd_2010_stats.csv")

cli_process_done()

# Extra validation plots for custom constraints -----
# TODO remove this section if no custom constraints
if (interactive()) {
    library(ggplot2)
    library(patchwork)

}
