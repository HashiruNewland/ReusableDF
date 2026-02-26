[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared WorkspaceId = "28b917e5-faab-4cd7-bdb4-1b3502325f20" meta [IsParameterQuery = true, IsParameterQueryRequired = false, Type = type text];
shared LakehouseId = "497f4de7-7fbb-48f7-93ee-ffea1639a105" meta [IsParameterQuery = true, IsParameterQueryRequired = false, Type = type text];
shared dimension_city = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = LakehouseId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimension_city", ItemKind = "Table"]}[Data],
  #"Filtered rows" = Table.SelectRows(#"Navigation 2", each [SalesTerritory] = Territory)
in
  #"Filtered rows";
shared Territory = "Mideast" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
