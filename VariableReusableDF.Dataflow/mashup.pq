[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Trip = let
  Source = Fabric.Warehouse([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[warehouseId = WarehouseId]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Trip"]}[Data]
in
  #"Navigation 3";
shared WorkspaceId = let
  Source = Variable.ValueOrDefault("$(/**/Variables_1/WorkspaceId))", "28b917e5-faab-4cd7-bdb4-1b3502325f20")
in
  Source;
shared WarehouseId = let
  Source = Variable.ValueOrDefault("$(/**/Variables_1/WorkspaceId))", "e301198f-7f74-4f68-97b0-2c195a28e063")
in
  Source;
shared PaymentType = let
  Source = Variable.ValueOrDefault("$(/**/Variables_1/PaymentType)", "Cash")
in
  Source;
