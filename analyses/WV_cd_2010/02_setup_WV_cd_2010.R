###############################################################################
# Set up redistricting simulation for `WV_cd_2010`
# © ALARM Project, March 2022
###############################################################################
cli_process_start("Creating {.cls redist_map} object for {.pkg WV_cd_2010}")


map <- redist_map(wv_shp, pop_tol = 0.005,
    existing_plan = cd_2020, adj = wv_shp$adj)


# IF MERGING CORES OR OTHER UNITS:
# make a new `map_cores` object that is merged & used for simulating. You can set `drop_geom=TRUE` for this.

# Add an analysis name attribute
attr(map, "analysis_name") <- "WV_2010"

# Output the redist_map object. Do not edit this path.
write_rds(map, "data-out/WV_2010/WV_cd_2010_map.rds", compress = "xz")
cli_process_done()
