[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Trip_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "DateID", DestinationColumnName = "DateID"], [SourceColumnName = "MedallionID", DestinationColumnName = "MedallionID"], [SourceColumnName = "HackneyLicenseID", DestinationColumnName = "HackneyLicenseID"], [SourceColumnName = "PickupTimeID", DestinationColumnName = "PickupTimeID"], [SourceColumnName = "DropoffTimeID", DestinationColumnName = "DropoffTimeID"], [SourceColumnName = "PickupGeographyID", DestinationColumnName = "PickupGeographyID"], [SourceColumnName = "DropoffGeographyID", DestinationColumnName = "DropoffGeographyID"], [SourceColumnName = "PickupLatitude", DestinationColumnName = "PickupLatitude"], [SourceColumnName = "PickupLongitude", DestinationColumnName = "PickupLongitude"], [SourceColumnName = "PickupLatLong", DestinationColumnName = "PickupLatLong"], [SourceColumnName = "DropoffLatitude", DestinationColumnName = "DropoffLatitude"], [SourceColumnName = "DropoffLongitude", DestinationColumnName = "DropoffLongitude"], [SourceColumnName = "DropoffLatLong", DestinationColumnName = "DropoffLatLong"], [SourceColumnName = "PassengerCount", DestinationColumnName = "PassengerCount"], [SourceColumnName = "TripDurationSeconds", DestinationColumnName = "TripDurationSeconds"], [SourceColumnName = "TripDistanceMiles", DestinationColumnName = "TripDistanceMiles"], [SourceColumnName = "PaymentType", DestinationColumnName = "PaymentType"], [SourceColumnName = "FareAmount", DestinationColumnName = "FareAmount"], [SourceColumnName = "SurchargeAmount", DestinationColumnName = "SurchargeAmount"], [SourceColumnName = "TaxAmount", DestinationColumnName = "TaxAmount"], [SourceColumnName = "TipAmount", DestinationColumnName = "TipAmount"], [SourceColumnName = "TollsAmount", DestinationColumnName = "TollsAmount"], [SourceColumnName = "TotalAmount", DestinationColumnName = "TotalAmount"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Trip = let
  Source = Fabric.Warehouse([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[warehouseId = WarehouseId]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Trip"]}[Data],
  #"Filtered rows" = Table.SelectRows(#"Navigation 3", each ([PaymentType] = PaymentType))
in
  #"Filtered rows";
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
shared Trip_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "28b917e5-faab-4cd7-bdb4-1b3502325f20"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "e301198f-7f74-4f68-97b0-2c195a28e063"]}[Data],
  TableNavigation = Navigation_2{[Item = "TripReusable", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
