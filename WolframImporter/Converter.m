Begin["PercentDB`Private`"]

ClearAll[parsePercentDB, percentDBImport, toTabular];

parsePercentDB[file_String] := Module[{txt, parts},
  txt = Import[file, "Text"];

  parts = StringCases[
    txt,
    RegularExpression[
      "(?ms)^%%\\s+([0-9]{4}-[0-9]{2}-[0-9]{2})\\s*\\n(.*?)(?=^%%\\s+|\\z)"
    ] :> {"$1", StringTrim["$2"]}
  ];

  <|"date" -> DateObject[#1], "text" -> #2|> & @@@ parts
];

percentDBImport[file_String, opts___] :=
  "Data" -> parsePercentDB[file];

toTabular[data_] :=
  If[NameQ["System`Tabular"],
    Tabular[data],
    Dataset[data]
  ];

End[]