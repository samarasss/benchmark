library(sjmisc)

# Aggregates files related to VM usage
aggregate_data_azure <- function(){
  files_workload <- list.files(path="data/vm_cpu_readingns_files", pattern="*.csv", full.names=TRUE, recursive=FALSE)
  for (file in files_workload){
    if(str_contains(file, "vm_cpu_readings-file")){
      csv_to_add <- read.csv(file)
      colnames(csv_to_add) <- c("timestamp", "vm_id", "min_cpu", "max_cpu", "avg_cpu")
      write.table(csv_to_add, file = ("data/aggregate.csv"), sep = ",",
                  append = TRUE, quote = FALSE,
                  col.names = !file.exists(("data/vm_cpu_readingns_files/aggregate.csv")), row.names = FALSE)
    }
  }
}
