<html>
    <head>
        <?php 
include 'header.php';

  
        


      
   
//validación de que la sesión esté activa
$alert = '';
   session_start();
   $idrolUsuario=  $_SESSION['idRolUsuario_S'];
if(!empty($_SESSION['activa'])){
        header('location: header.php');
}

            
            
       ?>
           <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
           <link href="css/loader.css" rel="stylesheet">
    <script src="js/loader.js"></script>
    </head>
    <body>
    <div id="load-content" class="loader-wrapper">
    <div id="id-loading" class="loader-small"></div>
</div>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
               
               <?php 
                      include 'menu.php';
              ?>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <?php 
                            if($idrolUsuario==1){
                                
                           
                            
                            ?>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body"><i class="bi bi-people"></i> Usuarios</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="usuario.php">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <?php }?>
                            <?php 
                                   if($idrolUsuario==3 || $idrolUsuario==1){
                            ?>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body"><i class="bi bi-person-lines-fill"></i> Docente</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="docente.php">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <?php
                                   }
                             
                             if($idrolUsuario==1|| $idrolUsuario==2|| $idrolUsuario==3 ){
                                 
                             
                             ?>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body"> <a class="bi bi-person-rolodex"></a> Estudiantes</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="estudiantes.php">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body"><i class="bi bi-collection"></i> Asignacion</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="asignacion.php">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <?php 
                            }
                            ?>
                        </div>
                       
                      <div class="panel-body">
                          <?php 
                          if($idrolUsuario==1){
                            ?>
                         <canvas id="estudiante"></canvas>
                       
                         <?php
                          }
                          ?>
                   
                </div>
                    </div>
                    
                </main>
                
                            <?php 
                        
include 'fooder.php';
?> 
                
            </div>
        </div>
       
    </body>
    
     
</html>
 <script src="js/chart.min.js"></script>
 <?php


  $sql_carreras="SELECT tb_carreras.descripcion AS Carreras,COUNT(*) AS cantidad FROM tb_estudiantes,tb_carreras
    WHERE tb_estudiantes.id_carreras = tb_carreras.id_carreras GROUP BY Carreras  ;";
                                    $result_carreras= mysqli_query($objConexion, $sql_carreras);
                                    foreach ($result_carreras as $data){
                                        $careras []= $data['Carreras'];
                                        $cantidad []= $data['cantidad'];
                                    }

                                    
                                    ?>
<script>
const ctx = document.getElementById('estudiante').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($careras) ?>,
        datasets: [{
            label: 'Cantidad De Estudiantes Registrados ',
            data: <?php echo json_encode($cantidad) ?>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(255, 159, 64, 0.2)',
               'rgba(153, 102, 255, 0.2)',
               'rgba(255, 159, 64, 0.2)',
               'rgba(63, 240, 10, 0.2)',
               'rgba(54, 57, 240, 0.2)',
               'rgba(102, 227, 241, 0.2)',
               'rgba(252, 57, 4, 0.2)'
               
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(255, 159, 64, 1)',
               'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(63, 240, 10, 1)',
               'rgba(54, 57, 240, 1)',
               'rgba(102, 227, 241,1)',
               'rgba(252, 57, 4, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
 



