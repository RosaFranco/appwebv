<?php 
require_once ("conf/confconexion.php");
require 'excel/vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use \PhpOffice\PhpSpreadsheet\IOFactory;
$spreadsheet=new Spreadsheet();
$spreadsheet->getProperties()->setCreator("jonathan")->setTitle("5TDS");
$spreadsheet->getDefaultStyle()->getFont()->setName('Arial')
                                          ->setSize(11);          

$spreadsheet->setActiveSheetIndex(0);
$hojactiva= $spreadsheet->getActiveSheet();
$hojactiva->setCellValue('A1', 'NOMBRES DOCENTES')
            ->setCellValue('B1', 'NOMBRES ESTUDIANTES')
            ->setCellValue('C1', 'JORNADA')
            ->setCellValue('D1', 'CARRERA')
            ->setCellValue('E1', 'TEMAS_VINCULACIONES')
          ->setCellValue('F1', 'LUGAR_ASIGNACION')
            ->setCellValue('G1', 'FECHA ASIGNACION')
        ->setCellValue('H1', 'FECHA FINALIZACION')
            
            ->setCellValue('I1', 'ESTADO');
    
//$idcarre=$_POST['id_carrera'];
$i = 2;
$sql = "SELECT tb_docentes.nombre_apellidos ,tb_estudiantes.nombres_apellidos as  estudiante,tb_jornada2.descripcion as jornada,tb_carreras.descripcion as carrera,
tb_lugar_asignacion.descripcion as lugar_asignacion,tb_asignacion.inicio_normal,tb_asignacion.final_normal,tb_temas.descripcion as temas,tb_asignacion.estado
FROM tb_lugar_asignacion,tb_temas,tb_docentes,tb_asignacion,tb_estudiantes,tb_jornada2,tb_carreras where tb_asignacion.id_docentes = tb_docentes.id_docentes
and tb_asignacion.id_temas=tb_temas.id_temas
and tb_asignacion.id_estudiantes= tb_estudiantes.id_estudiantes and tb_asignacion.id_jornada2= tb_jornada2.id_jornada2 and tb_asignacion.id_lugar_asignacion = tb_lugar_asignacion.id_lugar_asignacion
and tb_asignacion.id_carreras = tb_carreras.id_carreras and tb_asignacion.estado;";
$result = mysqli_query($objConexion, $sql);
while ($usuarioArray=mysqli_fetch_array($result)){
        //CAPTURAMOS VALORES DE LA CONSULTA
       
        $NombrePersona=$usuarioArray['nombre_apellidos'];
        $estudiante=$usuarioArray['estudiante'];
        $jornadasss=$usuarioArray['jornada'];
        $carreera=$usuarioArray['carrera'];
        
        $luagr=$usuarioArray['lugar_asignacion'];
        $temas=$usuarioArray['temas'];
        $fecha_incio=$usuarioArray['inicio_normal'];
         $fecha_final=$usuarioArray['final_normal'];
        $idestado=$usuarioArray['estado'];
        
        if($idestado=='1'){
            $estado='ACTIVO';
        }elseif ($idestado=='0') {
            $estado='INACTIVO';
        } else {
            $estado='FINALIZO';
        }
            
       //ASIGNAMOS LOS DATOS A LA CELDA DE EXCEL             
  $spreadsheet->setActiveSheetIndex(0);
  $hojactiva->setCellValue("A$i", $NombrePersona)
            ->setCellValue("B$i", $estudiante)
            ->setCellValue("C$i", $jornadasss)
            ->setCellValue("D$i", $carreera)
           ->setCellValue("E$i", $temas)
            ->setCellValue("F$i", $luagr)
            ->setCellValue("G$i", $fecha_incio)
            ->setCellValue("H$i", $fecha_final)
            ->setCellValue("I$i", $estado);    
            
$i++;
}
//FIN DEL WHILE
//DAMOS ATRIBUTOS A LAS CELDAS
$hojactiva->getColumnDimension('A')->setAutoSize(true);
$hojactiva->getColumnDimension('B')->setAutoSize(true);
$hojactiva->getColumnDimension('C')->setAutoSize(true);
$hojactiva->getColumnDimension('D')->setAutoSize(true);
$hojactiva->getColumnDimension('E')->setAutoSize(true);
$hojactiva->getColumnDimension('F')->setAutoSize(true);
$hojactiva->getColumnDimension('G')->setAutoSize(true);
$hojactiva->getColumnDimension('H')->setAutoSize(true);
$hojactiva->getColumnDimension('I')->setAutoSize(true);


$hojactiva->setTitle('REPORTE DE ASIGNASION');

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="Asignasion_Vinculacion.xlsx"');
header('Cache-Control: max-age=0');

$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
$writer->save('php://output');

