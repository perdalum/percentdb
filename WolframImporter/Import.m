ImportExport`RegisterImport[
  "PercentDB",
  PercentDB`Private`percentDBImport,
  {
    "Dataset" -> (Dataset["Data" /. #] &),
    "Tabular" -> (PercentDB`Private`toTabular["Data" /. #] &)
  },
  "AvailableElements" -> {"Data", "Dataset", "Tabular"},
  "DefaultElement" -> "Tabular"
]