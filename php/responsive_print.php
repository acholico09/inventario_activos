<?php 

require_once('main.php');
$id=$_GET['product'];
$GLOBALS["id"]=$id;


$conexion = conexion();
$consulta = "SELECT * FROM producto as po INNER JOIN categoria as ca ON po.categoria_id=ca.categoria_id JOIN plazas AS pa ON po.plaza_responsable=pa.id_plaza WHERE po.producto_id = :producto_id ";
$stmt = $conexion->prepare($consulta);
$stmt->bindParam(':producto_id', $id);
$stmt->execute();
$datos = $stmt->fetch(PDO::FETCH_ASSOC);
$plaza=$datos['plaza_responsable'];
$area_asignada=$datos['area_asignada'];
$categoria_id=$datos['categoria_id'];

$consulta_tabla = "SELECT producto_nombre, marca, producto_codigo FROM producto  WHERE plaza_responsable = :plaza_responsable AND area_asignada = :area_asignada AND categoria_id = :categoria_id";
$stmt = $conexion->prepare($consulta_tabla);
$stmt->bindParam(':plaza_responsable', $plaza);
$stmt->bindParam(':area_asignada', $area_asignada);
$stmt->bindParam(':categoria_id', $categoria_id);
$stmt->execute();
$datos_tabla = $stmt->fetchAll(PDO::FETCH_ASSOC);

$date = date('d-m-Y'); 
$GLOBALS['mensaje'] = "Sirva la presente como comprobante oficial de responsabilidad del siguiente equipo de la categoria de ".$datos['categoria_nombre'].":" ;
$GLOBALS['mensaje2']= "A partir del día ".$datos['fecha_inicio'].", la persona ".$datos['responsable']." recibe conforme el equipo antes mencionado y se compromete a utilizarlo únicamente en el área laboral y a darle un uso adecuado. Además, el receptor asume completamente la responsabilidad sobre el cuidado del equipo. Este es consciente que no podrá sacarlo de las instalaciones laborales y no podrá modificar la configuración del equipo ni instalar software sin ser previamente autorizado.";



require_once ("../pdf/fpdf.php");

class PDF extends FPDF {
    function Header() {
        $anchoPagina = 210;
        $altoPagina = 298;
        $this->Image('../img/pabs.png', 0, 0, $anchoPagina, $altoPagina);
        $this->SetXY(0, 1);
        $this->SetTextColor(255, 255, 255);
        $this->SetFont('Arial','B',12);
        $this->Cell(0,7,'CARTA RESPONSIVA DE EQUIPO',0,1,'R'); 
    }

    function BasicTable($header, $data) {
        $w = array(100, 30,60);
        for ($i = 0; $i < count($header); $i++) {
            $this->Cell($w[$i], 10, $header[$i], 1);
        }
        $this->Ln();
        // Datos
        foreach ($data as $row) {
            $this->Cell($w[0], 6, utf8_decode($row['producto_nombre']), 1);
            $this->Cell($w[1], 6, utf8_decode($row['marca']), 1);
            $this->Cell($w[2], 6, utf8_decode($row['producto_codigo']), 1);
            $this->Ln(6);
        }
    }
}


$pdf = new PDF();


$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->AddPage();
$pdf->Ln(20);
$pdf->SetFont('Arial','BI',15);
$pdf->Cell(150,5,utf8_decode($datos['nombre_plaza'].','),0,0,'R');
$pdf->Cell(50,5,$date,0,0,'L');
$pdf->Ln(10); 
$pdf->SetFont('Arial','',11);
$pdf->SetFontSize(12);
$pdf->SetXY($x+10, $y+45);
$pdf->Cell(50,5,'PABS :',0,0,'L');
$pdf->SetXY($x+10, $y+50);
$pdf->MultiCell(190,5,utf8_decode($GLOBALS['mensaje']),0,'L');


$pdf->Ln(2);
$pdf->SetFont('Arial', 'BI', 12, );
$header = array('Producto', 'Marca', 'Numero de serie');
$pdf->SetFont('Arial', 'I', 12);
$pdf->BasicTable($header, $datos_tabla);


$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->SetXY($x, $y+5);
$pdf->MultiCell(190,10,utf8_decode($GLOBALS['mensaje2']),0,'J');
$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->SetXY($x, $y+5);
$pdf->Cell(50,5,'Atentamente,',0,1,'L');
$pdf->Ln(15);
$pdf->Cell(100,5,'Ing. Daniel Bricio',0,0,'C');
$pdf->Cell(100,5,utf8_decode($datos['responsable']),0,0,'C');
$pdf->Ln(25);
$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->SetXY($x, $y-10);
$pdf->Cell(100,5,'_______________________',0,0,'C');
$pdf->Cell(100,8,'_______________________',0,1,'C');
$pdf->Cell(100,5,'Firma',0,0,'C');
$pdf->Cell(100,5,'Firma',0,0,'C');

$pdf->Output('Carta_responsiva_'.$datos['categoria_nombre'].'_' . $datos["nombre_plaza"] .'_'.$datos['responsable'].'.pdf','I');

?>
