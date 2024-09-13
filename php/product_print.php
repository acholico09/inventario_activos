<?php 

require_once('main.php');
$id=$_GET['product'];
$GLOBALS["id"]=$id;


$fecha_fin=date('Y-m-d'); 

$conexion = conexion();
$consulta = "SELECT * FROM producto as po INNER JOIN categoria as ca ON po.categoria_id=ca.categoria_id JOIN plazas AS pa ON po.plaza_responsable=pa.id_plaza WHERE po.producto_id = :producto_id ";
$stmt = $conexion->prepare($consulta);
$stmt->bindParam(':producto_id', $id);
$stmt->execute();

$datos = $stmt->fetch();
$GLOBALS['nombre']=$datos['producto_nombre'];

require_once ("../pdf/fpdf.php");

class PDF extends FPDF {
  
    function Header() {
        // $this->Image('./img/etiqueta.png',0, 0, 180);
        $this->SetFont('Arial','B',12);
        $this->Cell(0,7,'Ficha Tecnica',0,1,'C'); 
         
    }
}

$pdf = new PDF('L', 'mm', array(150, 100)); 
$pdf->SetMargins(3, 5, 3); 
$pdf->AddPage();
$pdf->SetFont('Arial','I',12);
$pdf->Cell(0,5,$GLOBALS['nombre'],0,1,'C');

$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->SetXY($x+110, $y-11);
$pdf->SetFont('Arial','I',10);
$pdf->Cell(25,5,'ID Equipo: '.$datos['producto_id'],0,1,'L');

$pdf->SetXY($x, $y+5);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Número SERIE:'),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,$datos['producto_codigo'],0,1,'L');

$pdf->SetXY($x, $y+12);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Responsable: '),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,utf8_decode($datos['responsable']),0,1,'L');


$pdf->SetXY($x, $y+19);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Nombre equipo:'),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,$datos['producto_nombre'],0,1,'L');


$pdf->SetXY($x, $y+26);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Marca: '),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,$datos['marca'],0,1,'L');

$pdf->SetXY($x, $y+33);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Categoria: '),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,$datos['categoria_nombre'],0,1,'L');



$pdf->SetXY($x, $y+40);
$pdf->SetFont('Arial','B',12);  
$pdf->Cell(36,5,utf8_decode('Área asignada: '),0,0,'L');
$pdf->SetFont('Arial','I',12); 
$pdf->Cell(50,5,$datos['area_asignada'],0,0,'L');

$pdf->SetXY($x, $y+55);
$pdf->SetFont('Arial','I',12);  
$pdf->Cell(0,5,utf8_decode('Procesador: ').$datos['procesador'],0,0,'L');









$pdf->Output(' RESUMEN'.$GLOBALS["id"].'.pdf','I');

?>

