<?php

/* @var $this yii\web\View */

$this->title = 'Los Nobles';
?>
<?php $this->beginContent('@app/views/site/say.php'); ?>

<?php $this->endContent(); ?>

<div class='container'>
    <div class="jumbotron text-center">
        <h1>¡Bienvenido al Gestor de Inventario Los Nobles!</h1>
        <div class="col-lg-5">
            <img src="\cursoyii2\img\logotipo.jpeg" style="width:80%">
        </div>
        <h3>Por favor, inicie sesión para continuar</h3>
        <p><a class="btn btn-lg btn-primary" href="http://localhost/cursoyii2/frontend/web/index.php?r=site%2Flogin">Iniciar sesión</a></p>
        <h3>¿No tiene cuenta? ¡Cree una!</h3>
        <p><a class="btn btn-lg btn-primary" href="http://localhost/cursoyii2/frontend/web/index.php?r=site%2Fsignup">Crear cuenta</a></p>
    </div>
</div>
