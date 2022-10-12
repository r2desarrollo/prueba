class DataModel {

    int id;
    int material;
    int pesoneto;
    String evidencia;
    int sucursal;
    int proveedor;
    dynamic materialNavigation;
    dynamic proveedorNavigation;
    dynamic sucursalNavigation;
    List<dynamic> reporte;

  DataModel({
   required this.id,
        required this.material,
        required this.pesoneto,
        required this.evidencia,
        required this.sucursal,
        required this.proveedor,
        this.materialNavigation,
        this.proveedorNavigation,
        this.sucursalNavigation,
        required this.reporte});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] ?? "",
      material: json['material'],
      pesoneto: json['pesoneto'],
      evidencia: json['evidencia'],
      sucursal: json['sucursal'],
      proveedor: json['proveedor'],
      materialNavigation: json['materialNavigation'],
      proveedorNavigation: json['proveedorNavigation'],
      sucursalNavigation: json['sucursalNavigation'],
      reporte: List<dynamic>.from(json["reporte"].map((x) => x)),
    );
  }
}